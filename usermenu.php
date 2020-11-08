<?php
/* 引入檔頭，每支程都會引入 */
require_once 'head.php';
 
if($_SESSION['user']['kind'] !== 1)redirect_header("index.php", '您沒有權限', 3000,0);

/* 過濾變數，設定預設值 */
$op = system_CleanVars($_REQUEST, 'op', 'op_list', 'string');
$sn = system_CleanVars($_REQUEST, 'sn', '', 'int');
$kind = system_CleanVars($_REQUEST, 'kind', 'mainMenu', 'string');

$kinds[] = array(
  "value" => "mainMenu",
  "title" => "主要選單"
);
$kinds[] = array(
  "value" => "secMenu",
  "title" => "次要選單"
);
$smarty->assign("kinds", $kinds);

#防呆
$kind = (array($kind, array($kinds))) ? $kind : "mainMenu";
 
/* 程式流程 */
switch ($op){
  case "op_delete" :
    $msg = op_delete($kind,$sn);
    redirect_header("usermenu.php?kind={$kind}", $msg, 3000,1);
    exit;

  case "op_insert" :
    $msg = op_insert($kind);
    redirect_header("usermenu.php?kind={$kind}", $msg, 3000,1);
    exit;

  case "op_update" :
    $msg = op_insert($kind,$sn);
    redirect_header("usermenu.php?kind={$kind}", $msg, 3000,1);
    exit;

  case "op_form" :
    $msg = op_form($kind,$sn);
    break;
 
  default:
    $op = "op_list";
    op_list($kind);
    break;  
}
/*---- 將變數送至樣版----*/

$mainMenus = getMenus("mainMenu");
$smarty->assign("mainMenus", $mainMenus);

$secMenus = getMenus("secMenu");
$smarty->assign("secMenus", $secMenus);


$smarty->assign("WEB", $WEB);
$smarty->assign("op", $op);
 
/*---- 程式結尾-----*/
$smarty->display('admin.tpl');
 
/*---- 函數區-----*/
function op_delete($kind,$sn){
  global $db;

  #刪除選單資料表
  $sql="DELETE FROM `kinds`
        WHERE `sn` = '{$sn}'
  ";
  $db->query($sql) or die($db->error() . $sql);
  return "選單資料刪除成功";
}

function op_insert($kind,$sn=""){
  global $db;						 
 
  $_POST['sn'] = $db->real_escape_string($_POST['sn']);
  $_POST['ofsn'] =$db->real_escape_string($_POST['ofsn']);
  $_POST['title'] = $db->real_escape_string($_POST['title']);
  $_POST['kind'] = $db->real_escape_string($_POST['kind']);
  $_POST['enable'] = $db->real_escape_string($_POST['enable']);
  $_POST['sort'] = $db->real_escape_string($_POST['sort']);
  $_POST['url'] = $db->real_escape_string($_POST['url']);
  $_POST['target'] = $db->real_escape_string($_POST['target']);

  if($sn){
    $sql="UPDATE  `kinds` SET
                  `title` = '{$_POST['title']}',
                  `enable` = '{$_POST['enable']}',
                  `ofsn` = '{$_POST['ofsn']}',
                  `sort` = '{$_POST['sort']}',
                  `kind` = '{$_POST['kind']}',
                  `url` = '{$_POST['url']}',
                  `target` = '{$_POST['target']}'
                  WHERE `sn` = '{$_POST['sn']}'    
    ";
    $db->query($sql) or die($db->error() . $sql);
    $msg = "選單資料更新成功";
  }else{
    $sql="INSERT INTO `kinds` 
    (`title`,`ofsn`, `enable`, `sort`, `kind`, `url`, `target`)
    VALUES 
    ( '{$_POST['title']}','{$_POST['ofsn']}', '{$_POST['enable']}', '{$_POST['sort']}', '{$_POST['kind']}', '{$_POST['url']}', '{$_POST['target']}')    
    "; //die($sql);  
    $db->query($sql) or die($db->error() . $sql);
    $sn = $db->insert_id;
    $msg = "選單資料新增成功"; 
  }
  return $msg;

}

/*===========================
  用sn取得選單檔資料
===========================*/
function getKindsBySn($sn){
  global $db;
  $sql="SELECT *
        FROM `kinds`
        WHERE `sn` = '{$sn}'
  ";//die($sql);
  
  $result = $db->query($sql) or die($db->error() . $sql);
  $row = $result->fetch_assoc();
  return $row;

}

/*================================
  用kind 取得數量的最大值
================================*/
function getKindMaxSortByKind($kind){
  global $db;
  $sql = "SELECT count(*)+1 as count
          FROM `kinds`
          WHERE `kind`='{$kind}'
  ";//die($sql);

  $result = $db->query($sql);
  if($result)
    $row = $result->fetch_assoc();
  else
    $row = [];
  return $row['count'];
}

function op_form($kind,$sn=""){
  global $smarty,$db;

  if($sn){
    $row = getKindsBySn($sn);
    $row['op'] = "op_update";
  }else{
    $row['op'] = "op_insert";
  }

  $row['sn'] = isset($row['sn']) ? $row['sn'] : "";
  $row['ofsn'] = isset($row['ofsn']) ? $row['ofsn'] : "";
  $row['kind'] = isset($row['kind']) ? $row['kind'] : $kind;
  $row['title'] = isset($row['title']) ? $row['title'] : "";
  $row['enable'] = isset($row['enable']) ? $row['enable'] : "1";
  $row['url'] = isset($row['url']) ? $row['url'] : "";
  $row['target'] = isset($row['target']) ? $row['target'] : "0";
  $row['sort'] = isset($row['sort']) ? $row['sort'] : getKindMaxSortByKind($kind);  

  $smarty->assign("row",$row);
}

function op_list($kind){
  global $smarty,$db;
  
  $sql = "SELECT *
          FROM `kinds`
          WHERE `kind`='{$kind}'
          ORDER BY `sort`
  ";

  $result = $db->query($sql) ;
  $rows=[];  

  while($row = $result->fetch_assoc()){ 
    $row['sn'] = (int)$row['sn'];    
    $row['ofsn'] = (int)$row['ofsn'];
    $row['title'] = htmlspecialchars($row['title']);
    $row['enable'] = (int)$row['enable'];
    $row['url'] = htmlspecialchars($row['url']);
    $row['target'] = (int)$row['target'];
    
    $rows[] = $row;
  }
  
  $smarty->assign("rows",$rows);
  $smarty->assign("kind",$kind);  

}



