<?php
require_once 'head.php';
require_once 'status.php';

/*--++++++++++++++++++++++++++++++++++++++++++ 
功能簡述:
使用者訂購系統
一、線上預訂->住宿預定 book=Page_date
    1.選擇機房下訂(book=Page_date) 2.注意事項(book=Page_date)
    3.填寫聯絡資料(book=Page_connection) 4.線上預訂完成(book=Page_success)

二、線上預訂->住宿查詢 book=booking_query_form&using=no
++++++++++++++++++++++++++++++++++++++++++--*/

/*--++++++++++++++++++++++++++++++++++++++++++ 
$op: 登入狀態
$book: 線上預訂行為狀態 
$using:使用狀態
++++++++++++++++++++++++++++++++++++++++++--*/

$op = system_CleanVars($_REQUEST, 'op', 'op_list', 'string');
$book = system_CleanVars($_REQUEST, 'book', 'Page_date', 'string');
$using = system_CleanVars($_REQUEST, 'using', '', 'string');
$usid = system_CleanVars($_REQUEST, 'usid', '', 'int');

global $error;
$bookpage = new Page_attr;

switch ($book){
    case "Page_date":
        $book = $bookpage->Page_date;
        reservation_date_form();
    break;

    case "on_dating":
        $book = $bookpage->Page_connection;
        reservation_dating();
        $_SESSION['user']['connect'] = 1;
        $smarty->assign("book", $book);
        $_SESSION['redirect'] = true;
        header("location:Onbooking.php?book=Page_connection");
        //redirect_header("Onbooking.php?book={$book}", "日期設定完畢", 3000,1);  圖示bug，找不到問題
        exit;

    case "Page_connection": 
        $contect_status = $_SESSION['user']['connect'];
        if($contect_status == '0'){
            redirect_header("Onbooking.php", '您沒有權限', 3000,0);
            exit;
        }else{
            $_SESSION['user']['connect'] = 0;
        }
        $book = $bookpage->Page_connection;
        reservation_connectpay_form();
    break;

    case "on_connecting": 
        $book = $bookpage->Page_success;
        reservation_connectpaying();
        $smarty->assign("book", $book);
        redirect_header("Onbooking.php?book={$book}", $msg, 3000,1);
    break;

    case "Page_success":
        $book = $bookpage->Page_success;
    break;

  
    case "visitbook":       
        $_POST['Inquiremail'] = isset($_POST['Inquiremail'])? $_POST['Inquiremail'] : 'false';   
        booking_result($_POST['Inquiremail']);       
    break; 
}


$mainMenus = getMenus("mainMenu");
$secMenus = getMenus("secMenu");

$smarty->assign("mainMenus", $mainMenus);
$smarty->assign("secMenus", $secMenus);

$smarty->assign("WEB", $WEB);
$smarty->assign("op", $op);

$smarty->assign("book", $book);

$smarty->assign("error", $error);
$smarty->assign("using", $using);   
$smarty->assign("ok_times", "");

$smarty->display('theme.tpl');

/*--++++++++++++++++++++++++++++++++++++++++++ 
使用者預約日期房型頁面
資料庫：prods prods_full
++++++++++++++++++++++++++++++++++++++++++--*/ 
function reservation_date_form(){
    global $db,$smarty;
    $kinds_sql="SELECT * FROM `prods` LEFT JOIN `prods_full` ON  prods.present_sn = prods_full.sn 
        WHERE prods.kind = 1";
       
    $kind_result = $db->query($kinds_sql) or die($db->error() . $kinds_sql);  
    $kind_rows=[];

    while($kind_row = $kind_result->fetch_assoc()){
        $kind_row['category'] = htmlspecialchars($kind_row['category']);
        $kind_row['title'] = htmlspecialchars($kind_row['title']);  
        $kind_row['kind'] = htmlspecialchars($kind_row['title']); 
        $kind_row['people_num'] = htmlspecialchars($kind_row['people_num']); 
        $kind_row['room_extra'] = htmlspecialchars($kind_row['room_extra']);  
        $kind_row['enable'] = htmlspecialchars($kind_row['enable']);
        $kind_rows[] = $kind_row;
    }
  
    $smarty->assign("kind_rows",$kind_rows); 
}  


function reservation_dating(){
    global $db,$smarty;
    $_POST['post_datein'] =  isset( $_POST['post_datein'])? $db->real_escape_string($_POST['post_datein']) : "";
    $_POST['post_dateout'] =  isset( $_POST['post_dateout'])? $db->real_escape_string($_POST['post_dateout']) : "";
    $_POST['post_title'] =  isset( $_POST['post_title'])? $db->real_escape_string($_POST['post_title']) : "";
  
    $_POST['post_category'] =  isset( $_POST['post_category'])? $db->real_escape_string($_POST['post_category']) : "";
    $_POST['post_num'] =  isset( $_POST['post_num'])? $db->real_escape_string($_POST['post_num']) : "";
    $_POST['post_price'] =  isset( $_POST['post_price'])? $db->real_escape_string($_POST['post_price']) : "";
    $_POST['post_roomextra'] =  isset( $_POST['post_roomextra'])?  $db->real_escape_string($_POST['post_roomextra']) : "";
    $_POST['post_roomnum'] =  isset( $_POST['post_roomnum'])?  $db->real_escape_string($_POST['post_roomnum']) : "";
    $_POST['post_roomsum'] =  isset( $_POST['post_roomsum'])?  $db->real_escape_string($_POST['post_roomsum']) : "";

    $_POST['post_peoplesum'] =  isset( $_POST['post_peoplesum'])?  $db->real_escape_string($_POST['post_peoplesum']) : "";
    $_POST['post_totalprice'] =  isset( $_POST['post_totalprice'])?  $db->real_escape_string($_POST['post_totalprice']) : "";
   
    $post_json = array('post_datein'=>$_POST['post_datein'],'post_dateout'=>$_POST['post_dateout'],
                'post_title'=>$_POST['post_title'],'post_category'=>$_POST['post_category'],
                'post_num'=>$_POST['post_num'],'post_price'=>$_POST['post_price'],
                'post_roomextra'=>$_POST['post_roomextra'],'post_roomnum'=>$_POST['post_roomnum'],
                'post_roomsum'=>$_POST['post_roomsum'],'post_peoplesum'=> $_POST['post_peoplesum'],
                'post_totalprice'=>$_POST['post_totalprice']);

    $_SESSION['cudate_json'] = $post_json;
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
使用者填寫聯絡方式、付款方式頁面
資料庫：prods prods_full
++++++++++++++++++++++++++++++++++++++++++--*/ 
function reservation_connectpay_form(){
    global $db,$smarty;
 
    $POST_JSON = $_SESSION['cudate_json'];
    $DATE_IN = $POST_JSON['post_datein'];
    $DATE_OUT = $POST_JSON['post_dateout'];

    //讀取表單資料
    $DATE_TITLE = preg_split("[,]",$POST_JSON['post_title']);//四人房 三人房
    $DATE_CATEGORY =  preg_split("[,]",$POST_JSON['post_category']); //優雅類型 , 優雅類型
    $DATE_NUM = preg_split("[,]",$POST_JSON['post_num']);   //2, 1
    $DATE_PRICE = preg_split("[,]",$POST_JSON['post_price']);   //1000, 800
    $DATE_ROOMEXTEA = preg_split("[,]",$POST_JSON['post_roomextra']); //1, 0
    $DATE_ROOMNUMSUM = preg_split("[,]",$POST_JSON['post_roomnum']);    //2 , 1
    $DATE_ROOMPRICESUM = preg_split("[,]",$POST_JSON['post_roomsum']); //2000,800

    $DATE_NUMSUM = $POST_JSON['post_peoplesum'];    //6
    $DATE_PRICESUM = $POST_JSON['post_totalprice']; //3600

    $sql = "SELECT `sn`,`title`,`category`,`kind`,`enable` FROM `prods` WHERE prods.enable = 1
        AND prods.kind = 1";  

    $result = $db->query($sql) or die($db->error() . $sql);  

    
    $RESULT_SN = 0; $row_times = 0;
    $json_table_rows=[]; $rows=[];

    
    while($row = $result->fetch_assoc()){
        $row['sn'] = htmlspecialchars($row['sn']);
        $row['title'] = htmlspecialchars($row['title']);
        $row['catrgory'] = htmlspecialchars($row['category']);
        for($times = 0;$times < count($DATE_TITLE)-1 ;$times ++ ){
            $json_table_row['DATE_TITLE'] = $DATE_TITLE;
            $json_table_row['DATE_CATEGORY'] = $DATE_CATEGORY;
            $json_table_row['DATE_NUM'] = $DATE_NUM;
            $json_table_row['DATE_PRICE'] = $DATE_PRICE;
            $json_table_row['DATE_ROOMEXTRA'] = $DATE_ROOMEXTEA;
            $json_table_row['DATE_ROOMNUMSUM'] = $DATE_ROOMNUMSUM;
            $json_table_row['DATE_ROOMPRICESUM'] = $DATE_ROOMPRICESUM;
            $json_table_rows[] = $json_table_row;
            if (strcmp($row['title'],$DATE_TITLE[$times]) == 0 && strcmp($row['catrgory'],$DATE_CATEGORY[$times]) == 0 
                && $json_table_row['DATE_ROOMPRICESUM'][$row_times] != 0){
                $RESULT_SN = $row['sn'];
            }
        }
        $row_times ++ ;
    }
   
    $json_row=[];
    $json_row['DATE_IN'] =  date("yy/m/d",strtotime($POST_JSON['post_datein']));
    $json_row['DATE_OUT'] = date("yy/m/d",strtotime($POST_JSON['post_dateout']));
    $json_row['DATE_NUMSUM'] = $DATE_NUMSUM;
    $json_row['DATE_PRICESUM'] = $DATE_PRICESUM;

    $_SESSION['cudate_json'] = "";

    $smarty->assign("sn", $RESULT_SN);
    $smarty->assign("length",count($DATE_TITLE)-1);
    $smarty->assign("json_table_rows", $json_table_rows); 
    $smarty->assign("json_row", $json_row); 
    return "預定表單內容"; 
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
使用者填寫聯絡方式、付款方式，紀錄在資料庫內
++++++++++++++++++++++++++++++++++++++++++--*/ 
function reservation_connectpaying(){
    global $db,$smarty;

    $user_name = $_SESSION['user']['uname'];
    
    //聯絡資訊
    $_POST['cuname'] =  isset( $_POST['cuname'])? $db->real_escape_string($_POST['cuname']) : "";
    $_POST['cuphone'] =  isset( $_POST['cuphone'])? $db->real_escape_string($_POST['cuphone']) : "";
    $_POST['cuemail'] =  isset( $_POST['cuemail'])? $db->real_escape_string($_POST['cuemail']) : "";
    $_POST['cupeople'] =  isset( $_POST['cupeople'])? $db->real_escape_string($_POST['cupeople']) : "";
    $_POST['datein'] =  isset( $_POST['datein'])? $db->real_escape_string($_POST['datein']) : "";
    $_POST['dateout'] =  isset( $_POST['dateout'])?  $db->real_escape_string($_POST['dateout']) : "";
    $_POST['cuaddress'] =  isset( $_POST['cuaddress'])?  $db->real_escape_string($_POST['cuaddress']) : "";
    $_POST['cuadd'] =  isset( $_POST['cuadd'])?  $db->real_escape_string($_POST['cuadd']) : "";
 
    #訂購房型
    $_POST['book_kind'] =  isset( $_POST['book_kind'])?  $db->real_escape_string($_POST['book_kind']) : "";
    $_POST['book_category'] =  isset( $_POST['book_category'])?  $db->real_escape_string($_POST['book_category']) : "";
    $_POST['ta_roomextra'] =  isset( $_POST['ta_roomextra'])?  $db->real_escape_string($_POST['ta_roomextra']) : "";
    
    //房型訂單編號
    $_POST['reservation_sn'] =  isset( $_POST['reservation_sn'])?  $db->real_escape_string($_POST['reservation_sn']) : "";

    $sql="INSERT INTO userdb
    (`cu_sn`,`usname`,`usphone`,`usemail`,`datein`,`dateout`,`usnum`,`usarea`,`usadd`,
        `title`,`category`,`user_extra`,`user_name`) 
    VALUES ('{$_POST['reservation_sn']}','{$_POST['cuname']}','{$_POST['cuphone']}',
    '{$_POST['cuemail']}','{$_POST['datein']}','{$_POST['dateout']}','{$_POST['cupeople']}',
    '{$_POST['cuaddress']}','{$_POST['cuadd']}','{$_POST['book_kind']}','{$_POST['book_category']}',
    '{$_POST['ta_roomextra']}','$user_name')";
    
    $db->query($sql) or die($db->error() . $sql); 
    $userdb_sn = mysqli_insert_id($db);

    //信用卡付款
    $_POST['agency'] =  isset( $_POST['agency'])?  $db->real_escape_string($_POST['agency']) : "";
    $_POST['credit_num1'] =  isset( $_POST['credit_num1'])?  $db->real_escape_string($_POST['credit_num1']) : "";
    $_POST['credit_num2'] =  isset( $_POST['credit_num2'])?  $db->real_escape_string($_POST['credit_num2']) : "";
    $_POST['credit_num3'] =  isset( $_POST['credit_num3'])?  $db->real_escape_string($_POST['credit_num3']) : "";
    $_POST['credit_num4'] =  isset( $_POST['credit_num4'])?  $db->real_escape_string($_POST['credit_num4']) : "";
    $_POST['credit_Last'] =  isset( $_POST['credit_Last'])?  $db->real_escape_string($_POST['credit_Last']) : "";
    $_POST['validity_begin'] =  isset( $_POST['validity_begin'])?  $db->real_escape_string($_POST['validity_begin']) : "";
    $_POST['validity_last'] =  isset( $_POST['validity_last'])?  $db->real_escape_string($_POST['validity_last']) : "";
    $_POST['id_card'] =  isset( $_POST['id_card'])?  $db->real_escape_string($_POST['id_card']) : "";
   
    $credit_sql = "INSERT INTO usercredit() VALUES";

    //預約者付費資訊
    $_POST['ta_title'] =  isset( $_POST['ta_title'])?  $db->real_escape_string($_POST['ta_title']) : "";
    $_POST['ta_category'] =  isset( $_POST['ta_category'])?  $db->real_escape_string($_POST['ta_category']) : "";
    $_POST['ta_num'] =  isset( $_POST['ta_num'])?  $db->real_escape_string($_POST['ta_num']) : "";
    $_POST['ta_price'] =  isset( $_POST['ta_price'])?  $db->real_escape_string($_POST['ta_price']) : "";
    $_POST['ta_romextra'] =  isset( $_POST['ta_romextra'])?  $db->real_escape_string($_POST['ta_romextra']) : "";
    $_POST['ta_romesum'] =  isset( $_POST['ta_romesum'])?  $db->real_escape_string($_POST['ta_romesum']) : "";
    $_POST['ta_total'] =  isset( $_POST['ta_total'])?  $db->real_escape_string($_POST['ta_total']) : "";
    $_POST['ta_sumpeople'] =  isset( $_POST['ta_sumpeople'])?  $db->real_escape_string($_POST['ta_sumpeople']) : "";
    $_POST['ta_sumtotal'] =  isset( $_POST['ta_sumtotal'])?  $db->real_escape_string($_POST['ta_sumtotal']) : "";

}