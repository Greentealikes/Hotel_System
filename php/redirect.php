<?php

#動畫視窗轉向使用
$_SESSION['redirect'] = isset($_SESSION['redirect']) ? $_SESSION['redirect'] : "";
$_SESSION['message'] = isset($_SESSION['message']) ? $_SESSION['message'] : "";
$_SESSION['time'] = isset($_SESSION['time']) ? $_SESSION['time'] : "";
$_SESSION['sn'] = isset($_SESSION['sn']) ? $_SESSION['sn'] : "";

$smarty->assign("redirect",$_SESSION['redirect']);  
$smarty->assign("message",$_SESSION['message']);  
$smarty->assign("time",$_SESSION['time']); 
$smarty->assign("sn",$_SESSION['sn']);

$_SESSION['redirect'] = "";
$_SESSION['message'] = "";
$_SESSION['time'] = "";
$_SESSION['sn'] = "";