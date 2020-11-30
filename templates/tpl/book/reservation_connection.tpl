<script type="text/javascript" src="<{$xoAppUrl}>class/My97DatePicker/WdatePicker.js"></script>

<-- 填寫聯絡資訊 -->

<div class = "container text-left ">
  <div class ="alert" role = "alert">
    <h4 class="alert-heading">聯絡資訊</h4>
    <hr>
    <div class = "row">
      <div class="col-sm-5 col-12">
        <div class="form-group">
          <label>預約者姓名<span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="cuname" name="cuname" autocomplete="off">
        </div>
      </div>

      <div class="col-sm-5 col-12">
        <div class="form-group">
          <label>聯繫電話<span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="cuphone" name="cuphone" autocomplete="off">
        </div>
      </div>

      <div class="col-sm-5 col-12">
        <div class="form-group">
          <label>聯繫郵件 <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="cuemail" name="cuemail" autocomplete="off">
        </div>
      </div> 

       <div class="col-sm-5 col-12">
        <div class="form-group">
          <label>預約人數<span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="cupeople" value="<{$json_row.DATE_NUMSUM}>" name="cupeople" autocomplete="off"  >
        </div>
      </div>

      <div class="col-sm-5 col-12">
        <div class="form-group datetest" >
          <label>入房時間<span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="datein" name="datein" value="<{$json_row.DATE_IN}>" autocomplete="off" onClick="WdatePicker()" >
        </div>
      </div>  

      <div class="col-sm-5 col-12">
        <div class="form-group datetest" >
          <label>退房時間<span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="dateout" name="dateout" value="<{$json_row.DATE_OUT}>" autocomplete="off" onClick="WdatePicker()" >
        </div>
      </div>

      <div class="col-sm-10 col-12">
        <div class="form-group">
          <label>聯繫地址<span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="cuaddress" name="cuaddress" autocomplete="off" placeholder="(縣市)/(區)">
        </div>
      </div> 

      <div class="col-sm-12">
        <div class="form-group">
          <label class="control-label">備註欄</label>
          <textarea class="form-control" rows="4" id="cuadd" value="" name="cuadd" placeholder="No more than 100 words."></textarea>
        </div>
      </div>
      <br><br><br>
    </div>
    
  </div>
</div>

<{include file="tpl/book/reservation_payment.tpl"}> 

<div class = "container text-left ">
  <div class ="alert" role = "alert">
    <h4 class="alert-heading">訂單確認</h4>
    <hr>
    <table id="table-room" class="table table-striped table-bordered table-hover table-sm tablesorter " >
      <thead>
          <tr>
              <th scope="col">房型種類</th>
              <th scope="col">房型類別</th>
              <th scope="col">房間人數</th>
              <th scope="col">單價</th>
              <th scope="col">加床</th>
              <th scope="col">數量</th>
              <th scope="col">總金額</th>
          </tr>
      </thead>
  
      <tbody>

      <!-- 顯示表格並傳輸隱藏資訊(整個表格的資料:訂房名稱、訂房種類、訂房數量、訂房單價) -->

          <{for $var = 0 to $length}>
          <tr>
            <th scope="row" class = "ta_title"><{$json_table_rows[0]['DATE_TITLE'][$var]}></th>
            <input type="hidden" name="ta_title" value="<{$json_table_rows[0]['DATE_TITLE'][$var]}>" id="ta_title">

            <td><div class = "ta_category"><{$json_table_rows[0]['DATE_CATEGORY'][$var]}></div></td> 
            <input type="hidden" name="ta_category" value="<{$json_table_rows[0]['DATE_CATEGORY'][$var]}>" id="ta_category">

            <td><div class="ta_num"><{$json_table_rows[0]['DATE_NUM'][$var]}></div></td>
            <input type="hidden" name="ta_num" value="<{$json_table_rows[0]['DATE_NUM'][$var]}>" id="ta_num">
            
            <td><div class="ta_price"><{$json_table_rows[0]['DATE_PRICE'][$var]}></div></td>  
            <input type="hidden" name="ta_price" value="<{$json_table_rows[0]['DATE_PRICE'][$var]}>" id="ta_price">

            <td><div class="ta_price"><{$json_table_rows[0]['DATE_ROOMEXTRA'][$var]}></div></td>  
            <input type="hidden" name="ta_price" value="<{$json_table_rows[0]['DATE_ROOMEXTRA'][$var]}>" id="ta_price">

            <td><div class="ta_roomsum"><{$json_table_rows[0]['DATE_ROOMNUMSUM'][$var]}></div></td>
            <input type="hidden" name="ta_roomsum" value="<{$json_table_rows[0]['DATE_ROOMNUMSUM'][$var]}>" id="ta_roomsum">

            <td><div class="ta_total"><{$json_table_rows[0]['DATE_ROOMPRICESUM'][$var]}></div></td>
            <input type="hidden" name="ta_total" value="<{$json_table_rows[0]['DATE_ROOMPRICESUM'][$var]}>" id="ta_total">

          </tr>
          <{/for}>
          
          <tr>
            <td scope="row" colspan="3"></td>
            <td>人數：</td>
            <td><span id = "ta_sumpeople"><{$json_row['DATE_NUMSUM']}></span></td>
            <input type="hidden" name="ta_sumpeople" value="<{$json_row['DATE_NUMSUM']}>" id="ta_sumpeople">

            <td>總計：</td>
            <td><i id="ta_sumtotal"><{$json_row['DATE_PRICESUM']}></i></td>
            <input type="hidden" name="ta_sumpeople" value="<{$json_row['DATE_PRICESUM']}>" id="ta_sumpeople">
          </tr>
      </tbody>
    </table>
  </div>
</div>

 <!-- 傳輸隱藏資訊(訂房名稱、訂房種類、加床數量)-->
<input type="hidden" class="form-control" id="book_kind" name="book_kind" autocomplete="off" 
  value = "<{for $var = 0 to $length}><{if $json_table_rows[0]['DATE_ROOMNUMSUM'][$var] > 0}><{$json_table_rows[0]['DATE_TITLE'][$var]}><{/if}><{/for}>">

<input type="hidden" class="form-control" id="book_category" name="book_category" autocomplete="off" 
  value = "<{for $var = 0 to $length}><{if $json_table_rows[0]['DATE_ROOMNUMSUM'][$var] > 0}><{$json_table_rows[0]['DATE_CATEGORY'][$var]}><{/if}><{/for}>">

<input type="hidden" name="ta_roomextra" id="ta_roomextra" autocomplete="off"
  value="<{for $var = 0 to $length}><{if $json_table_rows[0]['DATE_ROOMNUMSUM'][$var] > 0}><{$json_table_rows[0]['DATE_ROOMEXTRA'][$var]}><{/if}><{/for}>" >
           

<input type="hidden" name="book" value="on_connecting" id="book">
<input type="hidden" name="reservation_sn" value="<{$sn}>" id="reservation_sn">

<button type="submit" class="btn btn-primary">確認表單</button>    
<button type="button" class="btn btn-danger">取消</button>   

<script src="<{$xoImgUrl}>js/jquery-3.3.1.min.js"></script>