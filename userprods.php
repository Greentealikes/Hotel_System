<?php
require_once 'head.php';

/*--++++++++++++++++++++++++++++++++++++++++++ 
功能簡述:
產品設定頁面
基本資料:產品圖片、名稱、英文名稱、種類(1,0)、類別、定價、內容
詳細資料(床:1):面積、尺寸、數量、入住人數、是否加床
詳細資料(其他:0):尺寸、數量
資料表:prods(存放基本資料)、prods_full(存放詳細資料)
++++++++++++++++++++++++++++++++++++++++++--*/

/*--++++++++++++++++++++++++++++++++++++++++++ 
$en: 執行狀態(新增、刪除、....)
$sn: 該項目流水號 or 是否啟動搜尋
$present_sn: 副資料庫編號
++++++++++++++++++++++++++++++++++++++++++--*/

$en= system_CleanVars($_REQUEST, 'book', 'prods_list', 'string');
$sn = system_CleanVars($_REQUEST, 'sn', '', 'int');
$present_sn = system_CleanVars($_REQUEST, 'present_sn', '', 'string');

if($_SESSION['user']['kind'] !== 1)redirect_header("index.php", '您沒有權限', 3000,0);

switch ($en){
    case "prods_list":
        //這裡的$sn指的是是否按下搜尋鍵，而非流水號
        prods_list($sn);           
    break;

    case "op_insert_form":
        op_insert_form($sn);
    break;

    case "prods_insert":
        $msg = prods_insert($sn);
        redirect_header("userprods.php", $msg, 3000,1);
    exit; 

    case "prods_delete":
        $msg = prods_delete($sn,$present_sn);
        redirect_header("userprods.php", $msg, 3000,1);
    exit;
  
}

$smarty->assign("WEB", $WEB);  
$smarty->assign("book",$en);     
$smarty->display('admin.tpl');

/*--++++++++++++++++++++++++++++++++++++++++++ 
產品新增or更新 (使用sn流水號判定)
新增資料至資料庫 prods,prods_full,files
並將圖檔傳至uploads資料夾內，檔案名稱5位數亂數處理
 ++++++++++++++++++++++++++++++++++++++++++--*/

function prods_insert($sn=""){
    global $db,$smarty,$present_sn;
    /*prods-資料表*/
    $_POST['title'] = db_filter($_POST['title']);
    $_POST['title_en'] = db_filter($_POST['title_en']);
    $_POST['kind'] = db_filter($_POST['kind']);
    $_POST['category'] = db_filter($_POST['category']);
    $_POST['price'] = db_filter($_POST['price']);
    $_POST['content'] = db_filter($_POST['content']);

    /*prods_full-資料表*/
    if($_POST['kind'] == 1){
        $_POST['present_sn'] = db_filter($_POST['present_sn']);
        $_POST['area'] = db_filter($_POST['area']);
        $_POST['size'] = db_filter($_POST['size']);
        $_POST['room_num'] = db_filter($_POST['room_num']);
        $_POST['people_num'] = db_filter($_POST['people_num']);
        $_POST['room_extra'] = db_filter($_POST['room_extra']);
    }
   
    $_POST['enable'] = db_filter($_POST['enable']);

    if($sn){   
        $datenow = strtotime('now');
        $datenow = (int)$datenow;

        $sql="UPDATE  `prods` SET
            `kind` = '{$_POST['kind']}',
            `category` = '{$_POST['category']}',
            `title` = '{$_POST['title']}',
            `title_en` = '{$_POST['title_en']}',
            `price` = '{$_POST['price']}',
            `content` = '{$_POST['content']}',
            `enable` = '{$_POST['enable']}',
            `date_update` = '{$datenow}'
            WHERE `sn` = '{$sn}'";     

        $db->query($sql) or die($db->error() . $sql); 

        $sql_full=" UPDATE  `prods_full` SET
           `area` = '{$_POST['area']}',
           `size` = '{$_POST['size']}',
           `room_num` = '{$_POST['room_num']}',
           `people_num` = '{$_POST['people_num']}',
           `room_extra` = '{$_POST['room_extra']}',
           `enable` = '{$_POST['enable']}',
           `date` = '{$datenow}'
            WHERE `sn` = '{$_POST['present_sn']}'";  

        $db->query($sql_full) or die($db->error() . $sql_full);  
    }else{
        $datenow = strtotime('now');
        $datenow = (int)$datenow;
        $insertfull_sql = "INSERT INTO `prods_full` (`area`,`size`,`room_num`,`people_num`,`room_extra`)
        VALUES ('{$_POST['area']}','{$_POST['size']}','{$_POST['room_num']}','{$_POST['people_num']}',
            '{$_POST['room_extra']}') ";

        $db->query($insertfull_sql) or die($db->error() . $insertfull_sql); 
        $present_sn = mysqli_insert_id($db);

        $insert_sql = "INSERT INTO `prods`(`present_sn`,`kind`,`category`,`title`,`title_en`,`price`,
            `content`,`enable`,`date`,`date_update`) 
            VALUES ( $present_sn,'{$_POST['kind']}','{$_POST['category']}',
            '{$_POST['title']}','{$_POST['title_en']}','{$_POST['price']}',
            '{$_POST['content']}','{$_POST['enable']}','{$datenow}','{0}');";

        $db->query($insert_sql)or die($db->error() . $insert_sql); 
    }    

    if ($_FILES['my_file']['error'] === UPLOAD_ERR_OK){
        $sub_dir = "/"."img";
        $sort = 1;

        mk_dir(_WEB_PATH . "/uploads");
        mk_dir(_WEB_PATH . "/uploads" . $sub_dir);
        $path = _WEB_PATH . "/uploads" . $sub_dir . "/";

        $rand = substr(md5(uniqid(mt_rand(), 1)), 0, 5);//取得一個5碼亂數

        $ext = pathinfo($_FILES["my_file"]["name"], PATHINFO_EXTENSION); 
        $ext = strtolower($ext);

        if ($ext == "jpg" or $ext == "jpeg" or $ext == "png" or $ext == "gif") 
            $file_kind = "img";
        else 
            $file_kind = "file";

        $file_name = $rand . "_" . $sn . "." . $ext; 
       
        if(move_uploaded_file($_FILES['my_file']['tmp_name'], $path . $file_name)){

            $sql="SELECT *
                FROM `files`
                WHERE `col_sn` = '{$present_sn}'";

            if(mysqli_query($db,$sql)->num_rows > 0){                

                delFilesBypresent_sn($present_sn); 

                $sql = "UPDATE `files` SET 
                `col_sn` = '{$present_sn}',                  
                `sort` = '{$sort}',
                `file_kind` = '{$file_kind}',
                `file_name` = '{$_FILES['my_file']['name']}',
                `file_type` = '{$_FILES['my_file']['type']}',
                `file_size` = '{$_FILES['my_file']['size']}',
                `description` = 'NULL', 
                `counter` = '0',
                `name` = '{$file_name}',  
                `download_name` = '', 
                `sub_dir` = '{$sub_dir}'
                WHERE `files`.`col_sn` = '{$_POST['col_sn']}'"; 
            
                $db->query($sql) or die($db->error() . $sql);
                
            }else{
                $sql="INSERT INTO `files` 
                (`col_sn`, `sort`, `file_kind`, `file_name`, `file_type`, `file_size`, `description`, `counter`, `name`, `download_name`, `sub_dir`) 
                VALUES 
                ('{$present_sn}', '{$sort}', '{$file_kind}', '{$_FILES['my_file']['name']}', '{$_FILES['my_file']['type']}', '{$_FILES['my_file']['size']}', NULL, '0', '{$file_name}', '', '{$sub_dir}')
            ";             
              
                $db->query($sql) or die($db->error() . $sql);
            }        
            
        }
        else {
            die("圖片上傳失敗");
        }
    }
    return "新增資料成功";
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
刪除產品資訊
在這裡要刪除三個資料庫的資訊prods_full、prods、files
以及刪除實體檔案
++++++++++++++++++++++++++++++++++++++++++--*/

function prods_delete($sn,$present_sn=null){
    global $db; 

    $sql_full = "DELETE FROM `prods_full`
    WHERE `sn` = '{$present_sn}'";

    $sql="DELETE FROM `prods`
          WHERE `sn` = '{$sn}'";

    delFilesBypresent_sn($present_sn,$delete=true);  

    $db->query($sql) or die($db->error() . $sql);
    $db->query($sql_full) or die($db->error() . $sql_full);

    return "房型資料刪除成功";
  }


/*--++++++++++++++++++++++++++++++++++++++++++ 
Querykindvalue class
對應其資料庫prods->kind..int 轉換
++++++++++++++++++++++++++++++++++++++++++--*/ 
class Querykindvalue{

    //對應kind..房型
    public $Room_type = "房型";
    //對應kind..其他
    public $Other_type = "其他";

    //資料庫儲存kind為int 需做轉換: 房型->1 其他->0
    public function gettype($type=null){
        if($type == $this->Room_type)
            return 1;
        else if($type == $this->Room_type)
            return 0;
        else
            return -1;
    }
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
產品顯示清單 (全部列出)
使用資料庫：files,prods
$sn啟動搜尋功能並結合Querykindvalue->class 
++++++++++++++++++++++++++++++++++++++++++--*/

function prods_list($sn=null){
    global $smarty,$db;  
    $sql = ""; $quertkind = -1;

    $Query = new Querykindvalue;
    $query_post = isset($_POST['qetxt']) ? db_filter($_POST['qetxt']) : ""; 

    if($sn && $query_post != ""){
        if($query_post == $Query->Room_type)
            $quertkind = $Query->gettype($Query->Room_type);
        else if($query_post == $Query->Other_type)
            $quertkind = $Query->gettype($Query->Other_type);
        else 
            $quertkind = $Query->gettype();

        $sql = "SELECT a.* , b.name FROM `prods` as a LEFT JOIN `files` as b on a.present_sn = b.col_sn 
            Where a.title = '$query_post' OR a.kind = $quertkind OR a.category = '$query_post' ";
    }else{
        $sql = "SELECT a.* , b.name FROM `prods` as a LEFT JOIN `files` as b on a.present_sn = b.col_sn ";
    }
   
    $result = $db->query($sql) or die($db->error() . $sql);
    $rows=[];
    while($row = $result->fetch_assoc()){   
        $row['sn'] = isset($row['sn']) ? (int)($row['sn']) : "";    
        $row['present_sn'] = isset($row['present_sn']) ? (int)($row['present_sn']) : "";  
        $row['name'] =  isset($row['name']) ? htmlspecialchars($row['name']) : "" ;   
        $row['category'] = isset($row['category']) ? htmlspecialchars($row['category']) : "";
        $row['title'] =  isset($row['title']) ? htmlspecialchars($row['title']) : "";
        $row['enable'] = isset($row['enable']) ? htmlspecialchars($row['enable']) : ""; 
        $row['date'] = isset($row['date']) ? htmlspecialchars(date("yy-m-d",$row['date'])) : "";  
        $row['date_update'] = isset($row['date_update']) ? htmlspecialchars(date("yy-m-d",$row['date_update'])) : ""; 
        $rows[] = $row;
    }  

    $smarty->assign("rows",$rows);  
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
產品(新增、更新)清單
資料庫：prods,prods_full,files
編輯時列出$sn的資料，如無$sn則空白
++++++++++++++++++++++++++++++++++++++++++--*/

function op_insert_form($sn=""){
    global $smarty,$db;   
    $sql= "SELECT a.*,b.area,b.size,b.room_num,b.people_num,b.room_extra FROM `prods` as a 
        LEFT JOIN `prods_full` as b ON a.present_sn = b.sn WHERE a.`sn` = '{$sn}'";
    
    $result = $db->query($sql) or die($db->error() . $sql);
    $row = $result->fetch_assoc(); 
    
    $row['sn'] = isset($row['sn']) ? (int)($row['sn']) : "";     
    $row['kind'] = isset($row['kind']) ? (int)($row['kind']) : "1";  
    $row['title'] =  isset($row['title']) ? htmlspecialchars($row['title']) : "";
    $row['title_en'] =  isset($row['title_en']) ? htmlspecialchars($row['title_en']) : "";
    $row['category'] = isset($row['category']) ? htmlspecialchars($row['category']) : "";   
    $row['price'] = isset($row['price']) ? htmlspecialchars($row['price']) : "";

    $row['present_sn'] = isset($row['present_sn']) ? htmlspecialchars($row['present_sn']) : "";   
    $row['area'] = isset($row['area']) ? htmlspecialchars($row['area']) : "";   
    $row['size'] = isset($row['size']) ? htmlspecialchars($row['size']) : "";   
    $row['room_num'] = isset($row['room_num']) ? htmlspecialchars($row['room_num']) : ""; 
    $row['people_num'] = isset($row['people_num']) ? htmlspecialchars($row['people_num']) : ""; 
    $row['room_extra'] = isset($row['room_extra']) ? htmlspecialchars($row['room_extra']) : "0"; 
    $row['date_update'] = isset($row['date_update']) ? htmlspecialchars(date("d-m-yy",$row['date_update'])) : "";  
    $row['date'] = isset($row['date']) ? htmlspecialchars(date("d-m-yy",$row['date'])) : "";  
    $row['content'] = isset($row['content']) ?  htmlspecialchars($row['content']) : "";
    $row['enable'] = isset($row['enable']) ? htmlspecialchars($row['enable']) : "1"; 
    $smarty->assign("row",$row);  
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
運用present_sn參數刪除對應的實體檔案
再刪除files資料庫資訊
++++++++++++++++++++++++++++++++++++++++++--*/

function delFilesBypresent_sn($present_sn,$delete=false){
    global $db;		
    $file_name = getFilesnameBypresent_sn($present_sn,false);
   
    if($file_name){
      unlink($file_name);   
    }   
    
    if($delete){        
        $sql="DELETE FROM `files`
        WHERE `col_sn` = '{$present_sn}' 
    ";
        $db->query($sql) or die($db->error() . $sql);	
    }
    return;	 
  }

/*--++++++++++++++++++++++++++++++++++++++++++ 
取得產品位置資訊
運用present_sn參數取得files資料庫相關資訊
並將檔名轉換成smarty需求的位址
++++++++++++++++++++++++++++++++++++++++++--*/ 
function getFilesnameBypresent_sn($present_sn,$url=true){
    global $db; 
    $sql="SELECT *
                 FROM `files`
                 WHERE `col_sn` = '{$present_sn}' 
    ";  

    $result = $db->query($sql) or die($db->error() . $sql);
    $row = $result->fetch_assoc();
    $file_name = "";
    
    if($row){
      if($url){
          $file_name = _WEB_URL . "/uploads" . $row['sub_dir'] . "/" . $row['name'];
      }else{
          $file_name = _WEB_PATH . "/uploads" . $row['sub_dir'] . "/" . $row['name'];
      }
    }   
    return $file_name;
  }
