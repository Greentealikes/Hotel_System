<?php
require_once 'head.php';

/*--++++++++++++++++++++++++++++++++++++++++++ 
功能簡述:
會員管理設定頁面，只有擁有user kind 的會員才可以進入修改
普通會員不會產生此畫面
在此顯示會員的帳號、姓名、電話、email、狀態
使用資料庫Users
++++++++++++++++++++++++++++++++++++++++++--*/

/*--++++++++++++++++++++++++++++++++++++++++++ 
過濾用變數
$op: 執行狀態(新增、刪除、....)
$uid: 該項目流水號 or 是否啟動搜尋
++++++++++++++++++++++++++++++++++++++++++--*/

$op = system_CleanVars($_REQUEST, 'op', 'op_list', 'string');
$uid = system_CleanVars($_REQUEST, 'uid', '', 'int');

if($_SESSION['user']['kind'] !== 1)redirect_header("index.php", '您沒有權限', 3000,0);

/*--++++++++++++++++++++++++++++++++++++++++++ 
新增、更新資料庫頁面:op_form  
刪除資料庫:op_delete
新增、更新資料庫:op_update
回首頁:default 
++++++++++++++++++++++++++++++++++++++++++--*/

if($op){
  if($op == "op_delete"){
    $msg = op_delete($uid);
    redirect_header("user.php", $msg, 3000,1);

  }else if($op == "op_update"){
    $msg = op_update($uid);  
    redirect_header("user.php",$msg, 3000, 1);   

  }else if($op == "op_form"){
    op_form($uid);  
  
  }else{
    op_list($op);
  
  }
}

$smarty->assign("WEB", $WEB);
$smarty->assign("op", $op);
$smarty->display('admin.tpl');

/*--++++++++++++++++++++++++++++++++++++++++++ 
會員顯示清單 (全部列出)
使用資料庫：Users
$op啟動搜尋功能
++++++++++++++++++++++++++++++++++++++++++--*/

function op_list($op = null){
  global $smarty,$db;

  $query_post = isset($_POST['qetxt']) ? db_filter($_POST['qetxt']) : ""; 
  $sql = "";
  
  if($op && $query_post != ""){
    $sql = "SELECT * FROM `Users` WHERE `uname` = '$query_post' OR `name` = '$query_post' OR 
      `tel` = '$query_post' OR `email` = '$query_post' ";
  }else{
    $sql = "SELECT * FROM `Users`";
  }

  $result = $db->query($sql) or die($db->error() . $sql);
  $rows=[];
  while($row = $result->fetch_assoc()){
    $row['uid'] = $row['uid'];
    $row['uname'] = htmlspecialchars($row['uname']);
    $row['pass'] = htmlspecialchars($row['pass']);
    $row['name'] = htmlspecialchars($row['name']);
    $row['tel'] = htmlspecialchars($row['tel']);
    $row['email'] = htmlspecialchars($row['email']); 
    $row['kind'] = (int)$row['kind'];
    $rows[] = $row;
  }

  $smarty->assign("rows",$rows);  
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
刪除會員資訊
刪除資料庫 users 並回報刪除成功
++++++++++++++++++++++++++++++++++++++++++--*/

function op_delete($uid){
  global $db; 
  global $db;
  $sql="DELETE FROM `users`
        WHERE `uid` = '{$uid}';
  ";
  $db->query($sql) or die($db->error() . $sql);
  return "會員刪除成功";
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
會員資料變更 (使用uid判定)
新增資料至資料庫 users
pass密碼使用哈希方式 加密密碼
++++++++++++++++++++++++++++++++++++++++++--*/

function op_update($uid=""){
  global $db;
    $_POST['uname'] = db_filter($_POST['uname'],'帳號');
    $_POST['pass'] = db_filter($_POST['pass'],'');
    $_POST['name'] = db_filter($_POST['name'],'姓名');
    $_POST['tel'] = db_filter($_POST['tel'],'電話');
    $_POST['email'] = db_filter($_POST['email'],'email',FILTER_SANITIZE_EMAIL);
    $_POST['kind'] = db_filter($_POST['kind'],'會員狀態');

    $and_col = "";
    if($_POST['pass']){
      $_POST['pass'] = password_hash($_POST['pass'],PASSWORD_DEFAULT);
      $and_col = "`pass` = '{$_POST['pass']}',";
    }
    $sql = "UPDATE `users` SET 
            `uname` = '{$_POST['uname']}',
            {$and_col}
            `name` = '{$_POST['name']}',
            `tel` = '{$_POST['tel']}',
            `email` = '{$_POST['email']}',
            `kind` = '{$_POST['kind']}'
            WHERE `users`.`uid` = '{$uid}'";    
    $db->query($sql) or die($db->error().$sql);
    return '資料密碼更改成功';
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
會員(更新)清單
資料庫：Users
編輯時列出$uid的資料
++++++++++++++++++++++++++++++++++++++++++--*/

function op_form($uid=""){
  global $smarty,$db;

  if($uid){
    $sql="SELECT *
          FROM `Users`
          WHERE `uid` = '{$uid}'
    ";
    
    $result = $db->query($sql) or die($db->error() . $sql);
    $row = $result->fetch_assoc(); 
  }
    
  $row['uid'] = isset($row['uid']) ? $row['uid'] : "";
  $row['uname'] = isset($row['uname']) ? $row['uname'] : "";
  $row['name'] = isset($row['name']) ? $row['name'] : "";
  $row['tel'] = isset($row['tel']) ? $row['tel'] : "";
  $row['email'] = isset($row['email']) ? $row['email'] : "";
  $row['kind'] = isset($row['kind']) ? $row['kind'] : "0"; 
  
  $smarty->assign("row",$row);
 
}






