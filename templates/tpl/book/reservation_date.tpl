
<!--+++++++++++++++++++++++++++++++
使用套件：My97DatePicker 小月曆
+++++++++++++++++++++++++++++++++-->

<script type="text/javascript" src="<{$xoAppUrl}>class/My97DatePicker/WdatePicker.js"></script>

<div class = "container" id="container">
    <div class="row">
        <div> <span>預約日期 </span> </div>
        <div class="col-sm-4 col-8">  
            <input type="text" class="form-control" id="date" name="date" value="" autocomplete="off" onClick="WdatePicker()" >
        </div>
        <div>
            <div type="button" id="datequery" class = "btn btn-primary"">查詢</div>
        </div>
        <br><br><br>
        <div class="col-sm-12 col-12">
            <div class="d-flex justify-content-left">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item ">
                        <a class="nav-link check_in_time active" href="javascript:;">入住時間</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link check_out_time" href="javascript:;">退房時間</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link cancel_time" href="javascript:;">取消</a>
                    </li>
                </ul>
            </div>
            <table id="table_date" class="table table-striped table-bordered table-hover table-sm tablesorter"  id="myTable" >
                <thead>
                    <tr>    
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                    </tr>
                </thead>
                <tbody>
                    <{for $times = 1 to 5}>
                    <tr>
                        <td class="hotel_td"><a href="javascript:; return false"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                    </tr>
                    <tr>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                        <th scope="col" class="date_th"></th>
                    </tr>
                    <{/for}>
                     <tr>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                        <td class="hotel_td"><a href="javascript:;"><i class="fas"></i> </a></td>
                    </tr>
                </tbody>
            </table>

            <div class = "row">
                <div id="up_link" class = "col-sm-6 col-6 text-left">
                    <a href="javascript:;" class="stretched-link" aria-pressed="true">上一頁 </a>
                </div>
                <div id="down_link" class = "col-sm-6 col-6 text-right">
                    <a href="javascript:;" class="stretched-link" aria-pressed="true"> 下一頁</a>
                </div>
            </div>

            <br> <br> <br>
                 <table id="table-room" class="table table-striped table-bordered table-hover table-sm tablesorter " >
                <thead>
                    <tr>
                        <th scope="col">選擇房型</th>
                        <th scope="col">房型種類</th>
                        <th scope="col">房型類別</th>
                        <th scope="col">人數</th>
                        <th scope="col">單價</th>
                        <th scope="col">加床</th>
                        <th scope="col">數量</th>
                        <th scope="col">總金額</th>
                    </tr>
                </thead>
                <tbody>
                   
                    <{foreach $kind_rows as $kind_row}>
                        <tr>
                            <{if $kind_row.kind == 0 && $kind_row.enable == 1 && $kind_row.room_num > 0}>
                            <td><div class="radio">
                                <input type="radio" name="Radioroom" class="optionsRadios" disabled="disabled" value="option">
                            </div></td>
                            <th scope="row">
                                <div class = "ta_title"><{$kind_row.title}></div>
                            </th>
                            <td>
                                <div class = "ta_category"><{$kind_row.category}></div>
                            </td> 
                            <td><div class="ta_num"><{$kind_row.people_num}></div></td>
                            <td><div class="ta_price"><{$kind_row.price}></div></td>  
                                <td>
                                <{if $kind_row.room_extra == 1}>
                                    <a href="javascript:;"><i class="fas fa-bed fa-bed-yes ta_roomextra"></i>
                                    <span> </span><span class= "bed_add_counter">0</span>
                                    </a>
                                <{else}>
                                    <i class="fas fa-bed fa-bed-no"></i><span> </span><span class= "bed_add_counter">0</span>
                                <{/if}></td>
                                <td>
                                    <{if $kind_row.room_num}>
                                    <select id="selectrome" class="form-control ta_room_num disabled" >
                                        <{for $foo = 0 to $kind_row.room_num}>
                                        <{if $foo != 0}>
                                            <option><{$foo}></option>
                                        <{else}>
                                            <option selected="true"><{$foo}></option>
                                        <{/if}>
                                        <{/for}>
                                    </select>
                                    <{/if}>
                                </td>
                                <td><div class="ta_total">0</div></td>
                            <{/if}>
                        </tr>
                    <{/foreach}>
                    <tr>
                        <td scope="row" colspan="4"></td>
                        <td>人數：</td>
                        <td><span id = "ta_sumpeople">0</span></td>
                        <td>總計：</td>
                        <td><i id="ta_sumtotal">0</i></td>
                    </tr>
                </tbody>
            </table>
        </div> 
    </div>
</div>


  <input type="hidden" name="post_datein" value="" id="post_datein">
  <input type="hidden" name="post_dateout" value="" id="post_dateout">
  <input type="hidden" name="post_title" value="" id="post_title">
  <input type="hidden" name="post_category" value="" id="post_category">
  <input type="hidden" name="post_num" value="" id="post_num">
  <input type="hidden" name="post_price" value="" id="post_price">
  <input type="hidden" name="post_roomextra" value="" id="post_roomextra">
  <input type="hidden" name="post_roomnum" value="" id="post_roomnum">
  <input type="hidden" name="post_roomsum" value="" id="post_roomsum">

  <input type="hidden" name="post_peoplesum" value="" id="post_peoplesum">
  <input type="hidden" name="post_totalprice" value="" id="post_totalprice">
  

<a href="#Page_descrion" id="date_note_btn" class="btn btn-primary disabled" data-toggle="tab" >下一步</a>
<a href="Onbooking.php" id="date_note_cancel" class="btn btn-danger disabled">取消</a>
 
<!--++++++++++++++++++++++++++++++
function..計算日期
++++++++++++++++++++++++++++++++=-->
<script src="<{$xoImgUrl}>js/jquery-3.3.1.min.js"></script>

<script>
    $("#table-room").hide();

    var length = ($(".ta_room_num").length)/2 + 1;
    for(var times = 0 ; times < length ;times ++){
        $(".optionsRadios:eq(" + times + ")").attr('disabled',false);
    }

    //日期瀏覽確認，才可進行下一步
    function date_next_step(boolean){
        if (boolean === "true") {
            $("#date_note_btn").removeClass("disabled");
            return true;
        }else if(!$("#date_note_btn").is('.disabled')){
            $("#date_note_btn").addClass("disabled");
        }
        return false;
    }
   
    //選擇房型
    $(".optionsRadios").click(function(){
        var index = 2 * $(".optionsRadios").index(this) + 1; //select反應觸發是1,3,5
        var length = ($(".ta_room_num").length)/2;
        var option_times = 0;
       
        for(var times = 0 ; times < length ;times ++){
           option_times = 1 + 2 * times;
           $(".optionsRadios:eq(" + times + ")").attr('disabled',true);
           $(".ta_room_num:eq(" + option_times +")").addClass("disabled");
        }
        $(".ta_room_num:eq(" + index +")").removeClass("disabled");
        $("#date_note_cancel").removeClass("disabled");
    });
    
    //改變nav-link active
    $("#date_note_btn").click(function(){
        $(".reservation_link:eq(0)").removeClass("active");
        $(".reservation_link:eq(1)").addClass("active");
    });

    //計算現在日期並以此當作依據(上一頁、下一頁的依據)
    var d = new Date();
    var year = d.getFullYear();
    var month = d.getMonth() + 1;
    var day =  d.getDay(); //禮拜幾
    //var curMonthDays = new Date(year,month,0).getDate() + 1;

    //入住時間以及退房時間
    var check_in_Date = new Date();
    var check_out_Date = new Date();

    var cinmd = (check_in_Date.getMonth() + 1) + "/" + check_in_Date.getDate() ;
    var coutmd = check_out_Date.getMonth() + 1 + "/" + check_out_Date.getDate();
   
    //計算日期差用變數- 最小1 最大7
    var min_date = 1;
    var table_max = 42;
    
    //顯示今天禮拜幾
    function Day_week(day){
        var Day_for_week = ["(一)","(二)","(三)","(四)","(五)","(六)","(日)"];
        if(day >= 7) day = day % 7;
        result = Day_for_week[day];
        return result;
    }

    //於表格內顯示日期以及顏色
    function reservation_day_show(day){
        var gap = 0;
        var today = new Date();
        today = (today.getMonth() + 1) + "/" + today.getDate()+ "\n"; // "m/d"
        var datein_backcolor = "#bbded6";
        var dateout_backcolor = "#ffb6b9"; 
        var todat_backcolor = "#FAF1BE";
        var cancel_backcolor = "#f2f2f2";

        var original_color = "#0000ff";
        var unable_color = "#111111";
        var max_row_add = true;
        
        if( day.getDay() != 0) var gap = min_date - day.getDay();
            else var gap = min_date - 7;
        
        var time_gap = gap;  //利用gap算出實際日期
        if(gap > -5) max_row_add = false;

        for(var times = 0; times < table_max ; times ++){
            $(".date_th")[times].innerHTML = GetDate(day,gap,times) ;
            var Date_md = $(".date_th:eq(" + times + ")").html().split("(")[0];

            //欄位顯示處理
            if(max_row_add == false && times > 34){
                $("td:eq(" + times + ")").hide(); 
                $("th:eq(" + times + ")").hide();
            }else if (max_row_add == true && times > 34){
                $("td:eq(" + times + ")").show();
                $("th:eq(" + times + ")").show();
            }
         
            //背景顏色顯示處理
            if(Date_md == today)
                $(".hotel_td:eq(" + times + ")").css("background-color",todat_backcolor);
            else if (Date_md.indexOf(cinmd) == 0){
                $(".hotel_td:eq(" + times + ")").css("background-color",datein_backcolor);
            }else if(Date_md.indexOf(coutmd) == 0){
                $(".hotel_td:eq(" + times + ")").css("background-color",dateout_backcolor);
            }else{
                $(".hotel_td:eq(" + times + ")").css("background-color",cancel_backcolor);
            }
            
            //顏色顯示處理
            if(month < new Date().getMonth() + 1){
                $(".fas:eq(" + times + ")").parent().css("color",unable_color);
            }else if(month == new Date().getMonth() + 1 && times + time_gap < new Date().getDate() && times + time_gap >= 0){
                $(".fas:eq(" + times + ")").parent().css("color",unable_color);
            }
            else{
                $(".fas:eq(" + times + ")").parent().css("color",original_color);
            }

            //圖示顯示處理
            if($(".date_th")[times].innerHTML != '')
                $(".fas:eq(" + times + ")").addClass("fa-hotel");
            else{
                $(".fas:eq(" + times + ")").removeClass("fa-hotel");
            }
               
            gap = gap + 1;
        }
    }

     //取得當月份日期，如月份不符合指定月份則不顯示 
    function GetDate(SelectDate, cnt, times) {
        var date = new Date(SelectDate);
        var newdate = new Date(date);
       
        newdate.setDate(newdate.getDate() + cnt );
        var dd = newdate.getDate();
        var mm = newdate.getMonth() + 1;

        var result =  mm + '/' + dd + "\n" + Day_week(times);
        if(mm == month) return result; return '';
    }

    //點擊前往上個月
    $('#up_link').click(function(){
        if( month == 1 ) { year -= 1; month = 12; }else{  month -= 1;  } 
        var up_link_date = new Date(year + "-" + month + "-" + 1);
        reservation_day_show(up_link_date);
    });

    //點擊前往下個月
    $('#down_link').click(function(){
        if( month == 12 ) { year += 1; month = 1; }else{  month += 1;  } 
        var down_link_date = new Date(year + "-" + month + "-" + 1);
        reservation_day_show(down_link_date);
    });

    //決定入住時間並儲存時間至check_in_Date
    function Decidecheckin(index){
        var color = "#bbded6";
        var check_in_m = $(".date_th:eq(" + index + ")").html().split("/");
        var check_in_d = check_in_m[1].split("(");

        if(check_in_d[0] > check_out_Date.getDate() || check_in_m[0] > (check_out_Date.getMonth()+1)){
            check_in_Date = new Date(year + "-" + check_in_m[0] + "-" + check_in_d[0]);
            cinmd = check_in_m[0] + "/" + check_in_d[0];
        
            var check_in_Date_month = check_in_Date.getMonth() + 1;
            $("#post_datein").val(check_in_Date.getFullYear() + "-" + check_in_Date_month + "-" 
            + check_in_Date.getDate() );

            $(".check_in_time").removeClass("active");
            $(".check_out_time").addClass("active");
            $(".hotel_td:eq(" + index + ")").css("background-color",color);
        }
    }

    //決定退房時間並儲存時間至check_out_Date
    function Decidecheckout(index){
        var color = "#ffb6b9";
        var check_out_m = $(".date_th:eq(" + index + ")").html().split("/");
        var check_out_d = check_out_m[1].split("(");
        
        if(check_out_d[0] > check_in_Date.getDate() || check_out_m[0] > (check_in_Date.getMonth() + 1)){
            check_out_Date = new Date(year + "-" + check_out_m[0] + "-" + check_out_d[0]);
            coutmd = check_out_m[0] + "/" + check_out_d[0];
            
            var check_out_Date_month = check_out_Date.getMonth() + 1;
            $("#post_dateout").val(check_out_Date.getFullYear() + "-" + check_out_Date_month + "-" 
                + check_out_Date.getDate() );

            $("#table-room").show();
            $(".check_out_time").removeClass("active");
            $(".hotel_td:eq(" + index + ")").css("background-color",color);
        }
    }

     //取消入住時間
    function Cancelcheckin(index){
        var color = "#f1f1f1";
        $(".hotel_td:eq(" + index + ")").css("background-color",color);
        $(".check_in_time").addClass("active");
        $(".check_out_time").removeClass("active");
        check_in_Date = new Date();
        $("#post_datein").val(check_in_Date);
    }

   //取消退房時間
    function Cancelcheckout(index){
        var color = "#f1f1f1";
        $(".hotel_td:eq(" + index + ")").css("background-color",color);
        $(".check_out_time").addClass("active");
        $("#table-room").hide();
        check_out_Date = new Date();
        $("#post_dateout").val(check_out_Date) ;
    }

    //點擊觸發判定入住時間、退房時間
    $(".fas").click(function(){
        var index = $(".fas").index(this);
        var color =  $(".hotel_td:eq(" + index + ")").css("background-color");
       
        if( $(".fas:eq(" + index + ")").parent().css("color") != "rgb(17, 17, 17)"){
            if($(".check_in_time").is(".active"))
                Decidecheckin(index);
            else if ($(".check_out_time").is(".active"))
                if(color === "rgb(187, 222, 214)") Cancelcheckin(index); else  Decidecheckout(index); 
            else if(color === "rgb(255, 182, 185)")
                Cancelcheckout(index);
        }
    });

    //查詢點擊後改變表格內容
   $("#datequery").click(function(){
        
        var inputdate = $("#date").val();
        var input_year = inputdate.substr(0,4);
        var input_month = inputdate.substr(5,2) ;
        var input_day = inputdate.substr(8,2);

        year = parseInt(input_year);
        month = parseInt(input_month);

        var Date_input = new Date(input_year,input_month - 1,input_day);

        var input_all_day = new Date(input_year,input_month - 1 ,0);
        var input_first = new Date(input_year,input_month - 1 ,1);
        var input_Local = input_first.toLocaleDateString();
      
        if(inputdate != "") reservation_day_show(input_first);
       
   });

    // 計算金額 & 數量 (1個 select 所佔的index 為2)
    function Total_amount(){
        var length = ($(".ta_room_num").length)/2;
        var sum = 0, total = 0, sum_people = 0;
        for(var times = 0 ; times < length ; times ++){
            var price = $(".ta_price:eq(" + times + ")").html();
            var bed_counter = price / 2 * parseInt($(".bed_add_counter:eq(" + times + ")").html());
            var quantity = $(".ta_room_num:eq(" + (2 * times)+ ")").val();
            sum_people = parseInt($(".ta_num:eq(" + times + ")").html()) *  quantity + sum_people;
            total = price * quantity + bed_counter;
            sum += total;
            $(".ta_total:eq(" + times + ")").html(total) ;
        }
       
        if(sum != 0)date_next_step("true"); else date_next_step("false") ;
        
        $("#ta_sumtotal").html(sum) ;
        $("#ta_sumpeople").html(sum_people);
        Calculated_value();
    }

    Total_amount();

    // 點擊數量內容改變時重新計算
    $(document).ready(function(){
        $(".ta_room_num").change(function(){
            var index = $(".ta_room_num").index(this) / 2;
            var quantity = $(".ta_room_num:eq(" + (2 * index)+ ")").val();
            var bed_counter = parseInt($(".bed_add_counter:eq(" + index + ")").html());
            if(quantity < bed_counter)
                bed_counter = quantity;
            $(".bed_add_counter:eq(" + index + ")").html(bed_counter);
            Total_amount();
        });
    });

    //將數值傳入input hidden以便post傳送
    function Calculated_value(){
        var post_title = "";
        var post_category = "";
        var post_num = "";
        var post_price = "";
        var post_roomextra = "";
        var post_roomnum = "";
        var post_roomsum = "";

        var length =  $(".ta_title").length;
        for (var times = 0 ; times < length ; times ++){
            post_title = post_title + $(".ta_title:eq(" + times + ")").html() + ",";
            post_category = post_category + $(".ta_category:eq(" + times + ")").html() + ",";
            post_num = post_num + $(".ta_num:eq(" + times + ")").html() + ",";
            post_price = post_price + $(".ta_price:eq(" + times + ")").html() + ",";
            post_roomextra = post_roomextra + $(".bed_add_counter:eq(" + times + ")").html() + ",";

            post_roomnum = post_roomnum + $(".ta_room_num:eq(" + 2*times + ")").val() + ",";
            post_roomsum = post_roomsum + $(".ta_total:eq(" + times + ")").html() + ",";
        }

        $("#post_title").val(post_title);
        $("#post_category").val(post_category);
        $("#post_num").val(post_num);
        $("#post_price").val(post_price);
        $("#post_roomextra").val(post_roomextra);

        $("#post_roomnum").val(post_roomnum);
        $("#post_roomsum").val(post_roomsum);

        $("#post_totalprice").val($("#ta_sumtotal").html()) ;
        $("#post_peoplesum").val( $("#ta_sumpeople").html()) ;
    }

    //是否加床點擊效果&顯示
    $(".fa-bed-no").css("color","black");

    $(".fa-bed-yes").click(function(){
        var index = $(".fa-bed").index(this);
        var quantity = $(".ta_room_num:eq(" + (2 * index)+ ")").val();
        var bed_counter = parseInt($(".bed_add_counter:eq(" + index + ")").html());
        if(quantity > bed_counter)
            bed_counter += 1;
        else{
            bed_counter = 0;
        }

        $(".bed_add_counter:eq(" + index + ")").html(bed_counter);
        Total_amount();
    });

    //在這裡d必須要改成當月第一天
    var dt = new Date (year + "-" + month + "-" + 1);
    reservation_day_show(dt);
     

</script>




