<?php
require_once 'head.php';
require_once 'status.php';
/*--++++++++++++++++++++++++++++++++++++++++++ 
功能簡述:
cart使用者購物車系統，紀錄該帳號訂購的商品種類
判斷帳號的方式 該登入帳號姓名是否有存有清單項目、流水號

購物車資訊
商品名稱、商品種類、商品類別、價格、數量、功能(只提供刪除)

++++++++++++++++++++++++++++++++++++++++++--*/

#登入狀態
$op = system_CleanVars($_REQUEST, 'op', 'cart_list', 'string');


switch ($op){
    default:
        $op = cart_list();
    break;
}

function cart_list(){
    global $smarty,$db;

    $uname = $_SESSION['user']['uname'];
    $email = $_SESSION['user']['email'];

    $cartlist_sql = "SELECT * FROM `userdb` AS A LEFT JOIN `prods` AS B ON A.cu_sn = B.present_sn 
    WHERE A.user_name = '$uname'";

    $result = $db->query($cartlist_sql) or die($db->error() . $cartlist_sql);
    $kind_rows = [];

    while($kind_row = $result->fetch_assoc()){
        $kind_row['category'] = htmlspecialchars($kind_row['category']);
        $kind_row['title'] = htmlspecialchars($kind_row['title']);  
        $kind_row['usnum'] = htmlspecialchars($kind_row['usnum']); 
        $kind_row['price'] = htmlspecialchars($kind_row['price']);  
        $kind_row['user_extra'] = htmlspecialchars($kind_row['user_extra']);  
        $kind_row['enable'] = htmlspecialchars($kind_row['enable']);
        $kind_rows[] = $kind_row;
    }

    $smarty->assign("rows",$kind_rows);  
    return true;
}

$smarty->assign("WEB", $WEB);
$smarty->assign("op", $op);
$smarty->display('cart.tpl');