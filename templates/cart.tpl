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
<div class = "container">
    <div class="text effect01 title_content">購物車系統</div> 

    <table class="table table-striped table-bordered table-hover table-sm tablesorter"  id="myTable" >
    <thead>
        <tr>
        <th scope="col">房型名稱</th>
        <th scope="col">房型種類</th>
        <th scope="col">數量</th>
        <th scope="col">金額</th>
        <th scope="col">加床</th>
        </tr>
    </thead>
    <tbody>
      <{foreach $rows as $row}>
        <tr>
            <td><{$row.title}></td>
            <td><{$row.category}></td>
            <td><{$row.usnum}></td>
            <td><{$row.price}></td>
            <td><{$row.user_extra}></td>
          
        </tr>
      <{foreachelse}>
        <tr>
          <td colspan=5>目前沒有資料</td>
        </tr>
      <{/foreach}>
    </tbody>
  </table>

    <div id="total">總金額：
        <span class="totalnum"></span>
    </div>
  
  <button id="cart_btn" class="cart_btn btn btn-primary">提交</button>
  <button class="btn btn-danger">取消</button>
   
</div>

</body>
</html>

<script src="<{$xoImgUrl}>js/jquery-3.3.1.min.js"></script>
<script>
    $(document).ready(function(){
        $("#cart_btn").click(function(){
            $(".totalnum").text("100");
        });
    });
  
  
</script>