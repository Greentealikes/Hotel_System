<?php
  require_once 'head.php';   

  /*--++++++++++++++++++++++++++++++++++++++++++ 
  $op、$token: 登入狀態
  $using: 使用狀態
  $sn: 紀錄此動作狀態是否成立
  ++++++++++++++++++++++++++++++++++++++++++--*/
 
  $op = system_CleanVars($_REQUEST, 'op', 'op_list', 'string');
  $token = system_CleanVars($_REQUEST, 'token', '', 'string');
  $sn = system_CleanVars($_REQUEST, 'sn', '', 'int');
  $using = system_CleanVars($_REQUEST, 'using', '', 'string');

  
  /*--++++++++++++++++++++++++++++++++++++++++++ 
  
  ++++++++++++++++++++++++++++++++++++++++++--*/
  class Snstatus{
    public $sn_success = "登入成功";
    public $sn_error = "登入失敗";
    public $sn_logout = "登出成功";

    public function getsnstatus($status=null){
      if($status == $this->sn_error)
        return 0;
      return 1;
    }
  }
 
  $Sn_status = new Snstatus;

  #op判斷
  switch ($op){
    case "login" :   
      $msg = login();
      if($msg == $Sn_status->sn_success){
          $sn = $Sn_status->getsnstatus($Sn_status->sn_success);
          redirect_header("index.php",$msg, 3000, $sn);
      }
      else{     
        $sn = $Sn_status->getsnstatus($Sn_status->sn_error);         
        redirect_header("login.php", $msg, 3000, $sn);     
      }
      exit;

    case "logout":
        $msg = logout();
        $sn = $Sn_status->getsnstatus($Sn_status->sn_logout);     
        redirect_header("login.php", $msg , 3000, $sn);
        exit;
 
    case "reg":
        $msg = reg();       
        header("location:index.php"); 
        exit;

    #註冊介面
    case "reg_form" :
      $msg = reg_form();      
      break;
  
    #預設(op_list)
    default:
      $op = "op_list";
      break;  
    }

   /*---- 將變數送至樣版----*/
   $mainMenus = getMenus("mainMenu");
   $secMenus = getMenus("secMenu");
   
   $smarty->assign("mainMenus", $mainMenus);
   $smarty->assign("secMenus", $secMenus);

  $smarty->assign("WEB", $WEB);
  $smarty->assign("op", $op);
  $smarty->assign("pageid", $switch_id);
  $smarty->assign("bookpage", $switch_bookpage);
  $smarty->assign("using", $using);

  $smarty->display('theme.tpl');


   /*--++++++++++++++++++++++++++++++++++++++++++ 
  
  ++++++++++++++++++++++++++++++++++++++++++--*/
  function reg(){
    global $db;

    #過濾變數
    $_POST['uname'] = db_filter($_POST['uname'], '帳號');
    $_POST['pass'] = db_filter($_POST['pass'], '密碼');
    $_POST['chk_pass'] = db_filter($_POST['chk_pass'], '確認密碼');
    $_POST['name'] = db_filter($_POST['name'], '姓名');
    $_POST['tel'] = db_filter($_POST['tel'], '電話');
    $_POST['email'] = db_filter($_POST['email'], 'email',FILTER_SANITIZE_EMAIL);
    
    
    #寫入語法
    if( $_POST['pass'] !=  $_POST['chk_pass']) {
      $sn = $sn_error;  
      redirect_header("login.php", '密碼不一致' , 3000,$sn);
      //die("密碼不一致");
    }
    else{
      $_POST['pass'] = password_hash($_POST['chk_pass'], PASSWORD_DEFAULT);
    }
      $sql="INSERT INTO `users` 
          (`uname`, `pass`, `name`, `tel`, `email`,`kind`,`token`)  
          VALUES 
          ('{$_POST['uname']}', '{$_POST['pass']}', '{$_POST['name']}', '{$_POST['tel']}', '{$_POST['email']}','0','{xxxxxx}');
    ";
    #寫入資料庫
    $db->query($sql) or die($db->error. $sql);
    $uid = $db->insert_id;
    return $uid;
  }

    #使用者登出
    function logout(){
        $_SESSION['user']['kind'] = "";
        setcookie('name','',time() - 3600 * 24 * 365);
        setcookie('token','',time() - 3600 * 24 * 365);
        return "登出成功";
    }    
    
    function reg_form(){
        global $smarty;
    }
  
  function login(){
    global $smarty,$db;

    $_POST['uname'] = db_filter($_POST['uname'], '帳號');
    $_POST['pass'] = db_filter($_POST['pass'], '密碼');
    
    $sql= "SELECT * FROM `Users` WHERE `uname` = '{$_POST['uname']}'";

    $result = $db->query($sql) or die($db->error() . $sql);
    $row = $result->fetch_assoc() or redirect_header("login.php", "帳號輸入錯誤", 3000, 0);     
  
    $row['uname'] = htmlspecialchars($row['uname']);
    $row['uid'] = (int)$row['uid'];
    $row['kind'] = (int)$row['kind'];
    $row['name'] = htmlspecialchars($row['name']);
    $row['tel'] = htmlspecialchars($row['tel']);
    $row['email'] = htmlspecialchars($row['email']);
    $row['pass'] = htmlspecialchars($row['pass']);
    $row['token'] = htmlspecialchars($row['token']);
   

    if(password_verify($_POST['pass'],$row['pass'])){
      $_SESSION['user']['uid'] = $row['uid'];
      $_SESSION['user']['uname'] = $row['uname'];
      $_SESSION['user']['name'] = $row['name'];
      $_SESSION['user']['tel'] = $row['tel'];
      $_SESSION['user']['email'] = $row['email'];
      $_SESSION['user']['kind'] = $row['kind'];
      
      $_POST['remember'] = isset($_POST['remember']) ? $_POST['remember'] : "";
      
      //點選記住我
      if($_POST['remember']){
        setcookie("uname", $name, time()+ 3600 * 24 * 365); 
        setcookie("token", $token, time()+ 3600 * 24 * 365); 
      }      
      return "登入成功";
    }else{    
      $_SESSION['user']['uid'] = "";
      $_SESSION['user']['uname'] = "";
      $_SESSION['user']['name'] = "";
      $_SESSION['user']['tel'] = "";
      $_SESSION['user']['email'] = "";
      $_SESSION['user']['kind'] = "";   
      return "登入失敗";
    }
  }
?>
