
<!--++++++++++++++++++++++++++++++++++++++++++++++
  功能介紹：
      管理者簡易清單 提供產品名稱、種類...
  使用套件：
      tablesorter..資料排列
      sweetalert2..彈出視窗
      font awesome icon
++++++++++++++++++++++++++++++++++++++++++++++++-->

<{if $book == "book_list"}>
   <table class="table table-striped table-bordered table-hover table-sm tablesorter"  id="myTable" >
    <thead>
    <tr>
      <th scope="col">姓名</th>
      <th scope="col">電話</th>
      <th scope="col">信箱</th>
      <th scope="col">入住時間</th>
      <th scope="col">退房時間</th>
      <th scope="col">人數</th>
      <th scope="col">訂房種類</th>     
      <th scope="col">功能</th>
    </tr>
    </thead>
    <tbody>
      <{foreach $rows as $row}>
        <tr>
            <td><{$row.usname}></td>
            <td><{$row.usphone}></td>
            <td><{$row.usemail}></td>
            <td><{$row.datein}></td>
            <td><{$row.dateout}></td>
            <td><{$row.usnum}></td>
            <td><{$row.ustype}></td>           
            <td>
            <a href="userbook.php?book=book_form&usid=<{$row.usid}>"><i class="far fa-edit"></i></a>
            <a href="javascript:void(0)" onclick="op_delete(<{$row.usid}>);"><i class="far fa-trash-alt"></i></a>
            </td>
        </tr>
      <{foreachelse}>
        <tr>
          <td colspan=8>目前沒有資料</td>
        </tr>
      <{/foreach}>
    </tbody>
  </table>

  <!--++++++++++++++++++++++++++++++++++++++++++++++
  套件介紹：
      sweetalert2..彈出視窗
++++++++++++++++++++++++++++++++++++++++++++++++-->

  <link rel="stylesheet" href="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.css">
  <script src="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.js"></script>
  <script>
    function op_delete(usid){
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
                document.location.href="userbook.php?book=book_delete&usid="+usid;
            }
        })
      }
  </script>
<{/if}>

<!--++++++++++++++++++++++++++++++++++++++++++++++
功能介紹：
  此頁面為管理者新增、更新清單，還有book_list未紀錄的詳細內容
  管理者可登入後台
++++++++++++++++++++++++++++++++++++++++++++++++-->

<{if $book == "book_form"}>    
  <div class="container mt-5" >
    <h1 class="text-center">預約訂房資料表</h1>
    <form action="userbook.php" method="post" id="bookreg" class="mb-20" enctype="multipart/form-data">
      <div class="row">         
        <!--姓名-->              
        <div class="col-sm-3">
          <div class="form-group">
          <label>預約者姓名</label>
          <input type="text" class="form-control" name="usname" id="usname" value="<{$row.usname}>" readonly>
          </div>
        </div> 

        <!--電話-->              
        <div class="col-sm-3">
          <div class="form-group">
          <label>聯繫電話</label>
          <input type="text" class="form-control" name="usphone" id="usphone" value="<{$row.usphone}>"readonly>
          </div>
        </div> 

        <!--信箱-->              
        <div class="col-sm-6">
          <div class="form-group">
          <label>聯繫信箱</label>
          <input type="text" class="form-control" name="usemail" id="usemail" value="<{$row.usemail}>" autocomplete="off">
          </div>
        </div> 

        <div class="col-sm-3">
          <div class="form-group">
          <label>入住時間</label>
          <input type="text" class="form-control" name="datein" id="datein" value="<{$row.datein}>" autocomplete="off">
          </div>
        </div> 

        <div class="col-sm-3">
          <div class="form-group">
          <label>退房時間</label>
          <input type="text" class="form-control" name="dateout" id="dateout" value="<{$row.dateout}>" autocomplete="off">
          </div>
        </div> 

        <div class="col-sm-3">
          <div class="form-group">
          <label>預約訂房總人數</label>
          <input type="text" class="form-control" name="usnum" id="usnum" value="<{$row.usnum}>" autocomplete="off" placeholder="1-20">
          </div>
        </div> 

        <div class="col-sm-3 form-group">
          <label>訂房類型</label>
          <select name="ustypes" id="ustypes" class="wide">
            <{foreach $kind_rows as $kind_row}>
              <{if $kind_row.enable==1}>
                <option value=<{$kind_row.kind}> <{if $row.ustype == $kind_row.kind}>selected<{/if}>><{$kind_row.title}></option>
              <{/if}>
            <{/foreach}>
          </select>
        </div>  

        <div class="col-sm-6">
          <div class="form-group">
          <label>聯繫地址</label>
          <input type="text" class="form-control" name="usarea" id="usarea" value="<{$row.usarea}>" placeholder="縣市/區" autocomplete="off">
          </div>
        </div>

        <div class="col-sm-12">
          <div class="form-group">
          <label>備註欄</label>
          <textarea class="form-control" name="usadd" id="usadd"  placeholder="No more than 100 words."
            rows="4" cols="40" value=""><{$row.usadd}></textarea>        
          </div>
        </div> 

        
       
        <div class="col-sm-12 text-left ">
          <input type="hidden" name="book" value="book_update">
          <input type="hidden" name="usid" value="<{$row.usid}>">          
          <button type="submit" class="btn btn-primary">送出</button>
          <a class="btn btn-danger" href="userbook.php?book=book_list" role="button">返回</a>
        </div>
      </div>
    </form>
  </div>

<!--++++++++++++++++++++++++++++++++++++++++++++++
  套件名稱：Typed.js..打字機效果
++++++++++++++++++++++++++++++++++++++++++++++++-->
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
  <script src="<{$xoImgUrl}>js/jquery-3.3.1.min.js"></script>
  <script src="<{$xoImgUrl}>js/jquery.validate.min.js"></script>
  <script>
    $(function(){
      $("#bookreg").validate({
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

<!--++++++++++++++++++++++++++++++++++++++++++++++
  套件名稱：datepicker..小月曆
++++++++++++++++++++++++++++++++++++++++++++++++-->
  <script src="<{$xoImgUrl}>js/jquery-ui-1-11-4.js"></script>
  <script>
    $(function () {
        $("#datein,#dateout").datepicker({
            //可使用下拉式選單 - 月份
            changeMonth: true,
            //可使用下拉式選單 - 年份
            changeYear: true,
            //設定 下拉式選單月份 在 年份的後面
            showMonthAfterYear: true
            
        });
    });

    $(function () {
        (function (factory) {
            if (typeof define === "function" && define.amd) {
                // AMD. Register as an anonymous module.
                define(["../widgets/datepicker"], factory);
            } else {
                // Browser globals
                factory(jQuery.datepicker);
            }

        }(function (datepicker) {
            datepicker.regional["zh-TW"] = {
                closeText: "關閉",
                prevText: "&#x3C;上個月",
                nextText: "下個月&#x3E;",
                currentText: "今天",
                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月",
                    "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月",
                    "七月", "八月", "九月", "十月", "十一月", "十二月"],
                dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
                dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                weekHeader: "週",
                dateFormat: "yy-mm-dd",               
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: true,
                yearSuffix: "年"
            };
            datepicker.setDefaults(datepicker.regional["zh-TW"]);
            return datepicker.regional["zh-TW"];
            
            $('#datetimepicker11,#datetimepicker1').datetimepicker({
            daysOfWeekDisabled: [0, 6]
    });
        }));
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








