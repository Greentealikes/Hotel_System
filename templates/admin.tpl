<!doctype html>
<html lang="en">
  <head>
    <title><{$WEB.web_title}></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="<{$xoImgUrl}>fonts/googleapis.css" rel="stylesheet">
    
    <link rel="stylesheet" href="<{$xoImgUrl}>css/bootstrap.min.css">
    <link rel="stylesheet" href="<{$xoImgUrl}>css/jquery.fancybox.min.css">
 
    <link rel="stylesheet" href="<{$xoImgUrl}>fonts/flaticon/font/flaticon.css">
   
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<{$xoImgUrl}>css/style.css">
    <link rel="stylesheet" href="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.css"> 
    <link href="<{$xoImgUrl}>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<{$xoImgUrl}>css/backstage.css">
   
    <link rel="stylesheet" href="<{$xoImgUrl}>css/jquery-ui-1-11-4.css">
  
    <link rel="stylesheet" href="<{$xoImgUrl}>vendor/nice-select/css/nice-select.css">
  </head>
  
      
<body>
  <div class="text effect01 title_content">後台-管理系統</div> 
  <div class="container">
    <div class=" row">
      <div class="col-sm-8 ">
        <nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <a class="navbar-brand" href="#">管理員</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" 
                href="index.php" id="Back_home">首頁
              <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link "  
                href="user.php" >會員管理</a>
            </li>
            <li class="nav-item">
              <a class="nav-link "
                href="userbook.php">定房管理</a>   
            </li>

            <li class="nav-item">
              <a class="nav-link "
                href="userprods.php">房型管理</a>   
            </li>

            <li class="nav-item">
              <a class="nav-link "
                href="usermenu.php">選單管理</a>   
            </li>
            
            <li class="nav-item">
              <a class="nav-link " 
                href="http://127.0.0.1/phpmyadmin/index.php" target="_blank">資料庫管理</a>
            </li>

            <li class="nav-item">
              <a class="nav-link active"
                href="page_sw.php?op=logout&pageid=6" id="user_out">登出</a>
            </li>
           
            </ul>
          </div>
        </nav>
      </div>
      <div class="col-sm-4 ">
     
      <{if $WEB.file_name == "user.php"}>
          <form action='user.php' method="post" class="mb-20" enctype="multipart/form-data">
              <div class="input-group">
                 <div class="input-group-append">
                    <input type="text" name="qetxt" id="qetxt" value="" class="form-control" placeholder="關鍵字搜尋" aria-label="Query_SQL">
                    <input type="hidden" name="op" id="op" value="op_list">
                    <input type="hidden" name="uid" id="uid" value=1>
                    <input type='submit' value='提交'>
                 </div>
            </div>
          </form>
      <{elseif  $WEB.file_name == "userbook.php"}>
          <form action='userbook.php' method="post" class="mb-20" enctype="multipart/form-data">
              <div class="input-group">
                 <div class="input-group-append">
                    <input type="text" name="qetxt" id="qetxt" value="" class="form-control" placeholder="關鍵字搜尋" aria-label="Query_SQL">
                    <input type="hidden" name="book" id="book" value="book_list">
                    <input type="hidden" name="usid" id="usid" value=1>
                    <input type='submit' value='提交'>
                 </div>
            </div>
          </form>
      <{elseif  $WEB.file_name == "userprods.php"}>
          <form action="userprods.php" method="post" class="mb-20" enctype="multipart/form-data">
            <div class="input-group">
              <div class="input-group-append">
                <input type="text" name="qetxt" id="qetxt" value="" class="form-control" placeholder="關鍵字搜尋" aria-label="Query_SQL">
                <input type="hidden" name="book" id="book" value="prods_list">
                <input type="hidden" name="sn" id="sn" value=1>
                <input type='submit' value='提交'>
              </div>
            </div>
        </form>
      <{/if}>

      </div>

      <div class="col-sm-12 form_content">
        <{if $WEB.file_name == "user.php"}>
            <{include file="tpl/table_form/admin_member_form.tpl"}>
        <{elseif  $WEB.file_name == "userbook.php"}>
           <{include file="tpl/table_form/admin_book_form.tpl"}>
        <{elseif $WEB.file_name == "userprods.php"}>
           <{include file="tpl/table_form/admin_prods_form.tpl"}>
         <{elseif $WEB.file_name == "usermenu.php"}>
           <{include file="tpl/table_form/admin_menu_form.tpl"}>
        <{/if}>
      </div>
    </div>
  </div>
</body>

</html>

<script src="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.js"></script>

<script src="<{$xoImgUrl}>js/jquery-3.3.1.min.js"></script>
<script src="<{$xoImgUrl}>js/jquery.ajaxchimp.min.js"></script>
<script src="<{$xoImgUrl}>vendor/nice-select/js/jquery.nice-select.js"></script>

<{* 引入js檔案 *}>
<{include file="tpl/head_js.tpl"}>

<{if $redirect}>
  <script>
    window.onload = function(){
      Swal.fire({
        icon: 'success',
        title: "<{$message}>",
        showConfirmButton: false,
        timer: <{$time}>
      })
    }
  </script>
<{/if}>


