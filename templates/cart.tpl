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
    <thead> <tr>
        <th scope="col">商品名稱</th>
        <th scope="col">商品種類</th>
        <th scope="col">商品類別</th>
        <th scope="col">價格</th>
        <th scope="col">數量</th>
        <th scopt="col">功能</th>
    </tr> </thead>

    <tbody>
        <td>商品名稱</td>
        <td>商品種類</td>
        <td>商品類別</td>
        <td><span class="price">100</span></td>
        <td>
            <select class="selectpicker">
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
        </td>
        <td>
            <a href="javascript:void(0)" onclick="prods_delete(<{$row.sn}>,<{$row.present_sn}>);">
                <i class="far fa-trash-alt"></i>
            </a>
        </td>
    </tbody>   
  </table>

    <div id="total" class="" >總金額：
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