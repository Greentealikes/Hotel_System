<?php
require_once 'head.php';
    
#登入狀態
$op = system_CleanVars($_REQUEST, 'op', 'cart_list', 'string');


switch ($op){
    default:
        $op = "cart_list";
    break;
}

$smarty->assign("WEB", $WEB);
$smarty->assign("op", $op);
$smarty->display('cart.tpl');