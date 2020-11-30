<?php
if($_SERVER['HTTP_HOST'] == "127.0.0.1:81" or $_SERVER['HTTP_HOST'] == "localhost"){
  #資料庫伺服器
  $db_host = "localhost";
  #資料庫使用者帳號
  $db_user = "root";
  #資料庫使用者密碼
  $db_password = "";
  #資料庫名稱
  $db_name = "redhotel";
}else{
  #資料庫伺服器
  $db_host = "";
  #資料庫使用者帳號
  $db_user = "";
  #資料庫使用者密碼
  $db_password = "";
  #資料庫名稱
  $db_name = "";
}
// dj1ugm_redtea
#PHP 5.2.9以後
$db = new mysqli($db_host, $db_user, $db_password, $db_name); 
if ($db->connect_error) {
  die('無法連上資料庫 (' . $db->connect_errno . ') '
        . $db->connect_error);
}
#設定資料庫語系
$db->set_charset("utf8");
