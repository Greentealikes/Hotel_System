<?php 
session_start(); //啟用 $_SESSION,前面不可以有輸出
error_reporting(E_ALL);@ini_set('display_errors', true); //設定所有錯誤都顯示
$http = 'http://';
if (!empty($_SERVER['HTTPS'])) {
  $http = ($_SERVER['HTTPS'] == 'on') ? 'https://' : 'http://';
}

define('_WEB_PATH', str_replace("\\", "/", dirname(__FILE__)));
define('_WEB_URL', $http . $_SERVER["HTTP_HOST"] . str_replace($_SERVER["DOCUMENT_ROOT"], "", _WEB_PATH));


$WEB['file_name'] = basename($_SERVER['PHP_SELF']); //index.php

if($WEB['file_name'] == 'user.php'){
  $WEB['web_title'] = '會員管理';
}
else if($WEB['file_name'] == 'userbook.php'){
  $WEB['web_title'] = '訂房管理';
}
else if($WEB['file_name'] == 'userprods.php'){
  $WEB['web_title'] = '房型管理';
}
else{
  $WEB['web_title'] = 'Redtea住宿網';
}
  
#頁面轉換使用
$switch_id = isset($_GET['pageid'])? $_GET['pageid'] : '6';
$switch_bookpage = isset($_GET['bookpage'])? $_GET['bookpage'] : '0';

/*---- 必須引入----*/
#引入樣板引擎
require_once _WEB_PATH.'/smarty.php';
#引入資料庫設定
require_once _WEB_PATH . '/php/sqlConfig.php';
#引入設定檔
require_once _WEB_PATH . '/php/function.php';
#視窗畫面設定檔
require_once _WEB_PATH . '/php/redirect.php';

$_SESSION['cudate_json'] = isset($_SESSION['cudate_json']) ? $_SESSION['cudate_json'] : "";
$_SESSION['user']['kind'] = isset($_SESSION['user']['kind']) ? $_SESSION['user']['kind'] : "";

# 為了cookie使用
if($_SESSION['user']['kind'] === ""){
  $_COOKIE['token'] = isset($_COOKIE['token']) ? $_COOKIE['token'] : "";
  $_COOKIE['uname'] = isset($_COOKIE['uname']) ? $_COOKIE['uname'] : "";
  
  $_COOKIE['uname'] = db_filter($_COOKIE['uname'], '');
  $_COOKIE['token'] = db_filter($_COOKIE['token'], '');

  if($_COOKIE['uname'] && $_COOKIE['token']){
    $sql="SELECT *
        FROM `users`
        WHERE `uname` = '{$_COOKIE['uname']}'";

    $result = $db->query($sql);
    $row = $result->fetch_assoc();

    if($_COOKIE['token'] === $row['token']){
      
      $row['uname'] = htmlspecialchars($row['uname']);
      $row['uid'] = (int)$row['uid'];
      $row['kind'] = (int)$row['kind'];
      $row['name'] = htmlspecialchars($row['name']);
      $row['tel'] = htmlspecialchars($row['tel']);
      $row['email'] = htmlspecialchars($row['email']); 
      $row['pass'] = htmlspecialchars($row['pass']); 
      $row['token'] = htmlspecialchars($row['token']);
      
      $_SESSION['user']['uid'] = $row['uid'];
      $_SESSION['user']['uname'] = $row['uname'];
      $_SESSION['user']['name'] = $row['name'];
      $_SESSION['user']['tel'] = $row['tel'];
      $_SESSION['user']['email'] = $row['email'];
      $_SESSION['user']['kind'] = $row['kind'];
      
    }
  }   
}

?>