<?php
#引入smarty物件
require_once _WEB_PATH . '/class/smarty/libs/Smarty.class.php';
$smarty = new Smarty;
#指定左標籤定義符
$smarty->left_delimiter = "<{"; //指定左標籤
#指定左標籤定義符
$smarty->right_delimiter = "}>"; //指定右標籤
#指定模版存放目錄
$smarty->template_dir = _WEB_PATH . '/templates/';
#指定編譯文件存放目錄
$smarty->compile_dir = _WEB_PATH . '/templates_c/';
#指定配置文件存放目錄
$smarty->config_dir = _WEB_PATH . '/configs/';
#暫存路徑
//$smarty->cache_dir = _WEB_PATH . '/cache/';
 
#開啟調試控制台，輸出變數
//$smarty->debugging = true;
#開啟緩存
//$smarty->caching = true;
#設定緩存時間，詳見 https://www.smarty.net/docs/zh_CN/caching.tpl
//$smarty->cache_lifetime = 120;
 
#定義模板URL 
$smarty->assign("xoImgUrl", _WEB_URL . '/templates/'); 
$smarty->assign("xoAppUrl", _WEB_URL."/");
$smarty->assign("tableshow", "");

