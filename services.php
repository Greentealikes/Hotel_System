<?php
require_once 'head.php';

#登入狀態
$op = system_CleanVars($_REQUEST, 'op', 'service_list', 'string');

#主畫面切換變數
$switch_id = isset($_GET['pageid'])? $_GET['pageid'] : '';

switch ($op){
    case "room_type":
        $op = "room_type";
    break;

    case "checkin_info":
        $op = "checkin_info";
    break;

    default:
        $op = "service_list";
    break;
}

$mainMenus = getMenus("mainMenu");
$secMenus = getMenus("secMenu");

$smarty->assign("mainMenus", $mainMenus);
$smarty->assign("secMenus", $secMenus);


$smarty->assign("WEB", $WEB);
$smarty->assign("op", $op);
$smarty->assign("pageid", $switch_id);

$smarty->display('theme.tpl');

