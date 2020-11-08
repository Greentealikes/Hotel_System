<?php
require_once 'head.php';

/*--++++++++++++++++++++++++++++++++++++++++++ 
功能簡述:
會員管理設定頁面，只有擁有user kind 的會員才可以進入修改
在此顯示顧客所留下的資訊
++++++++++++++++++++++++++++++++++++++++++--*/

/*--++++++++++++++++++++++++++++++++++++++++++ 
$book: 執行狀態(新增、刪除、....)
$usid: 該項目流水號 or 是否啟動搜尋
$_SESSION['user']['kind']:權限判定
++++++++++++++++++++++++++++++++++++++++++--*/

$book = system_CleanVars($_REQUEST, 'book', 'book_list', 'string');
$usid = system_CleanVars($_REQUEST, 'usid', '', 'int');

if($_SESSION['user']['kind'] !== 1)redirect_header("index.php", '您沒有權限', 3000,0);

/*--++++++++++++++++++++++++++++++++++++++++++ 
新增、更新資料庫頁面:book_form  
刪除資料庫:book_delete
新增、更新資料庫:book_update
清單頁面:book_list 
++++++++++++++++++++++++++++++++++++++++++--*/

switch ($book){
    case 'book_form':
        book_form($usid);    
    break;

    case "book_delete" :
        $msg = book_delete($usid);
        redirect_header("userbook.php", $msg, 3000,1);
        exit;

    case "book_update":
        $msg = book_update($usid);  
        redirect_header("userbook.php", $msg, 3000,1);
        exit;
    
    case "book_list":
        book_list($usid);
    break;
}

$smarty->assign("WEB", $WEB);  
$smarty->assign("book",$book);     
$smarty->display('admin.tpl');

/*--++++++++++++++++++++++++++++++++++++++++++ 
刪除預約資訊
刪除資料庫的資訊userdb
++++++++++++++++++++++++++++++++++++++++++--*/

function book_delete($usid){
    global $db; 
    $sql="DELETE FROM `userdb`
          WHERE `usid` = '{$usid}';
    ";
    $db->query($sql) or die($db->error() . $sql);
    return "會員刪除成功";
  }

/*--++++++++++++++++++++++++++++++++++++++++++ 
更新預約資訊 (使用usid判定)
新增資料至資料庫 users
++++++++++++++++++++++++++++++++++++++++++--*/  

function book_update($usid=""){
    global $db;

    $_POST['usname'] = $db->real_escape_string($_POST['usname']);
    $_POST['usphone'] = $db->real_escape_string($_POST['usphone']);
    $_POST['usemail'] = $db->real_escape_string($_POST['usemail']);
    $_POST['usarea'] = $db->real_escape_string($_POST['usarea']);
    $_POST['datein'] = $db->real_escape_string($_POST['datein']);
    $_POST['dateout'] = $db->real_escape_string($_POST['dateout']);
    $_POST['usnum'] = $db->real_escape_string($_POST['usnum']);
    $_POST['ustypes'] = $db->real_escape_string($_POST['ustypes']);
    $_POST['usadd'] = $db->real_escape_string($_POST['usadd']);

    $sql = "UPDATE `userdb` SET 
            `usname` = '{$_POST['usname']}',                  
            `usphone` = '{$_POST['usphone']}',
            `usemail` = '{$_POST['usemail']}',
            `usarea` = '{$_POST['usarea']}',
            `datein` = '{$_POST['datein']}',
            `dateout` = '{$_POST['dateout']}',
            `usnum` = '{$_POST['usnum']}',
            `ustype` = '{$_POST['ustypes']}',
            `usadd` = '{$_POST['usadd']}'
            WHERE `userdb`.`usid` = '{$usid}'"; 

    $db->query($sql) or die($db->error().$sql);

    return '資料密碼更改成功';
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
預約(更新)頁面
資料庫：userdb
編輯時列出$usid的資料
++++++++++++++++++++++++++++++++++++++++++--*/

function book_form($usid=""){
    global $smarty,$db;
    
    $sql="SELECT *
        FROM `userdb`
        WHERE `usid` = '{$usid}'
    ";
    $result = $db->query($sql) or die($db->error() . $sql);
    $row = $result->fetch_assoc();   
    
    $kinds_sql="SELECT * FROM `prods`";
    $kind_result = $db->query($kinds_sql) or die($db->error() . $kinds_sql);  
    $kind_rows=[];

    while($kind_row = $kind_result->fetch_assoc()){
        $kind_row['kind'] = ($kind_row['kind']);  
        $kind_row['sn'] = ($kind_row['sn']);      
        $kind_row['title'] = ($kind_row['title']);  
        $kind_row['enable'] = ($kind_row['enable']);             
        $kind_rows[] = $kind_row;
    }
  
    $row['usid'] = isset($row['usid']) ? ($row['usid']) : "";
    $row['usname'] = isset($row['usname']) ? ($row['usname']) : "";
    $row['usphone'] = isset($row['usphone']) ? ($row['usphone']) : "";
    $row['usemail'] = isset($row['usemail']) ? ($row['usemail']) : "";
    $row['usarea'] = isset($row['usarea']) ? ($row['usarea']) : "";
    $row['datein'] = isset($row['datein']) ? ($row['datein']) : "";
    $row['dateout'] = isset($row['dateout']) ? ($row['dateout']) : ""; 
    $row['usnum'] = isset($row['usnum']) ? ($row['usnum']) : ""; 
    $row['ustype'] = isset($row['ustype']) ? ($row['ustype']) : ""; 
    $row['usadd'] = isset($row['usadd']) ? ($row['usadd']) : ""; 
    
    $smarty->assign("row",$row);
    $smarty->assign("kind_rows",$kind_rows);  
  }

/*--++++++++++++++++++++++++++++++++++++++++++ 
預約顯示清單 (全部列出)
使用資料庫：Userdb
$usid:判定是否按下搜尋鍵
++++++++++++++++++++++++++++++++++++++++++--*/

function book_list($usid = null){
    global $smarty,$db;   
    $sql = "";
    
    $query_post = isset($_POST['qetxt']) ? db_filter($_POST['qetxt']) : ""; 
    if($usid && $query_post != ""){
        $sql = "SELECT * FROM `Userdb` WHERE usname = '$query_post' OR usphone = '$query_post' OR
            usemail = '$query_post' OR usnum = '$query_post' OR ustype = '$query_post'";
    }else{
        $sql = "SELECT * FROM `Userdb` ";
    }
    $result = $db->query($sql) or die($db->error() . $sql);  
    
    $rows=[];
    while($row = $result->fetch_assoc()){   
        $row['usname'] = htmlspecialchars($row['usname']);
        $row['usphone'] = htmlspecialchars($row['usphone']);
        $row['usemail'] = htmlspecialchars($row['usemail']);
        $row['usarea'] = htmlspecialchars($row['usarea']);
        $row['datein'] = htmlspecialchars($row['datein']);
        $row['dateout'] = htmlspecialchars($row['dateout']);   
        $row['usnum'] = (int)($row['usnum']);    
        $row['ustype'] = htmlspecialchars($row['ustype']);
        $row['usadd'] = htmlspecialchars($row['usadd']);
        $rows[] = $row;
    }  
    
    $smarty->assign("rows",$rows);  
}
