
<!--++++++++++++++++++++++++++++++++++++++++++++++
功能介紹：
此頁面為管理者資訊管理(顯示:帳號、姓名、電話、EMAIL、狀態、功能)  
管理者可登入後台
使用套件：
          tablesorter..資料排列
          sweetalert2..彈出視窗
++++++++++++++++++++++++++++++++++++++++++++++++-->

<{if $op == "op_list"}>
  <table class="table table-striped table-bordered table-hover table-sm myTable" id="myTable">
    <thead>
    <tr>
      <th scope="col">帳號</th>
      <th scope="col">姓名</th>
      <th scope="col">電話</th>
      <th scope="col">EMAIL</th>
      <th scope="col">狀態</th>
      <th scope="col">功能</th>
    </tr>
    </thead>
    <tbody>
      <{foreach $rows as $row}>
        <tr>
          <td><{$row.uname}></td>
          <td><{$row.name}></td>
          <td><{$row.tel}></td>
          <td><{$row.email}></td>
          <td>
            <{if $row.kind == 1}>
              <a href="user.php?op=op_form&uid=<{$row.uid}>"><i class="fas fa-user-check"></i></a>
            <{/if}>
          <td>
            <a href="user.php?op=op_form&uid=<{$row.uid}>"><i class="far fa-edit"></i></a>
            <a href="javascript:void(0)" onclick="op_delete(<{$row.uid}>);"><i class="far fa-trash-alt"></i></a>
          </td>
        </tr>
      <{foreachelse}>
        <tr>
          <td colspan=6>目前沒有資料</td>
        </tr>
      <{/foreach}>
    </tbody>
  </table>

 <!-- sweetalert2 -->
    <link rel="stylesheet" href="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.css">
    <script src="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.js"></script>
    <script>
        function op_delete(uid){
            Swal.fire({
                title: '你確定嗎？',
                text: "您將無法還原！",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '是的，刪除它！',
                cancelButtonText: '取消'
                }).then((result) => {
                if (result.value) {
                    document.location.href="user.php?op=op_delete&uid="+uid;
                }
            })
        }
    </script>
<{/if}>

<!--++++++++++++++++++++++++++++++++++++++++++++++
功能介紹：
此頁面為管理者新增、更新頁面(顯示:帳號、姓名、密碼、電話、EMAIL、狀態)  
管理者可登入後台
使用套件：
          sweetalert2..彈出視窗
++++++++++++++++++++++++++++++++++++++++++++++++-->
<{if $op == "op_form"}>    
  <div class="container mt-5">
    <h1 class="text-center">會員表單</h1>
    <form action="user.php" method="post" id="myreg" class="mb-20" enctype="multipart/form-data">
      <div class="row">         
        <!--帳號-->              
        <div class="col-sm-4">
          <div class="form-group">
          <label>會員帳號</label>
          <input type="text" class="form-control" name="uname" id="uname" value="<{$row.uname}>" readonly>
          </div>
        </div>         
        <!--密碼-->              
        <div class="col-sm-4">
          <div class="form-group">
          <label>會員密碼<span class="text-danger">*</span></label>
          <input type="text" class="form-control" name="pass" id="pass" value="">
          </div>
        </div>
        <!-- 會員狀態  -->
        <div class="col-sm-4">
          <div class="form-group">
            <label style="display:block;">會員狀態<span class="text-danger">*</span></label>
            <input type="radio" name="kind" id="kind_1" value="1" <{if $row.kind=='1'}>checked<{/if}> >
            <label for="kind_1" style="display:inline;">管理員</label>&nbsp;&nbsp;
            
            <input type="radio" name="kind" id="kind_0" value="0" <{if $row.kind=='0'}>checked<{/if}> >
            <label for="kind_0" style="display:inline;">會員</label>
          </div>
        </div>  
        <!--姓名-->              
        <div class="col-sm-4">
          <div class="form-group">
          <label>會員真實姓名</label>
          <input type="text" class="form-control" name="name" id="name" value="<{$row.name}>" readonly>
          </div>
        </div>         
        <!--電話-->              
        <div class="col-sm-4">
          <div class="form-group">
          <label>會員電話</label>
          <input type="text" class="form-control" name="tel" id="tel" value="<{$row.tel}>"readonly>
          </div>
        </div>             
        <!--信箱-->              
        <div class="col-sm-4">
          <div class="form-group">
          <label>會員信箱</label>
          <input type="text" class="form-control" name="email" id="email" value="<{$row.email}>"readonly>
          </div>
        </div> 

        <div class="col-sm-12 text-left">
          <input type="hidden" name="op" value="op_update">
          <input type="hidden" name="uid" value="<{$row.uid}>">
          <button type="submit" class="btn btn-primary">送出</button>
          <a class="btn btn-danger" href="user.php" role="button">返回</a>
        </div>
      </div>
    </form>
  </div>

<!--++++++++++++++++++++++++++++++++++++++++++++++
套件名稱：Typed.js..打字機效果
++++++++++++++++++++++++++++++++++++++++++++++++-->

  <script src="<{$xoImgUrl}>js/jquery-3.3.1.min.js"></script>
  <script src="<{$xoImgUrl}>js/typed.js"></script>
  <script>
    !function ($) {
      var typed = new Typed('.typed-words', {
        strings: ["Business", " Startups", " Organization", " Company"],
        typeSpeed: 80,
        backSpeed: 80,
        backDelay: 4000,
        startDelay: 1000,
        loop: true,
        showCursor: true
      })
    };
  </script>

<!--++++++++++++++++++++++++++++++++++++++++++++++
套件名稱：jquery.validate..表單js驗證
++++++++++++++++++++++++++++++++++++++++++++++++-->

  <script src="<{$xoImgUrl}>js/jquery.validate.min.js"></script>
  <script>
    $(function(){
      $("#myreg").validate({
        submitHandler: function(form) {
        form.submit();},
      rules: {
        'uname':{
          required: true}},
          
      messages: {
        'uname' : {
          required: "必填"}}        
        }
      );
    });
  </script>
<{/if}>

<!--++++++++++++++++++++++++++++++++++++++++++++++
套件名稱：tablesorter
套用基本設定以及藍色主題css
++++++++++++++++++++++++++++++++++++++++++++++++-->

<script src='//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
  <link rel="stylesheet" href="<{$xoAppUrl}>class/tablesorter/css/theme.blue.min.css"></link>
  <script type="text/javascript" src="<{$xoAppUrl}>class/tablesorter/jquery.tablesorter.min.js"></script>
  <script>
    $("#myTable").tablesorter({
    theme: "blue",
    widgets: ['zebra']
    });
</script>