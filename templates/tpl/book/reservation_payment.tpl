
<div class = "container text-left">
  <div class = "alert" role = "alert">
    <h4 class="alert-heading">信用卡付款</h4>
    <hr>
    <div class = "row">
      <div class="col-sm-4 col-12">
        <div class="form-group">
          <label> 信用卡機構<span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="agency" name="agency" autocomplete="off">
        </div>
      </div>

      <div class="col-sm-4 col-12">
        <label> 信用卡卡號<span class="text-danger">*</span></label>
        <div class="input-group">
          <input type="text" class="form-control" id="credit_num1" name="credit_num1" />
          <span class="input-group-addon">-</span>
          <input type="text" class="form-control" id="credit_num2" name="credit_num2" />
          <span class="input-group-addon">-</span>
          <input type="text" class="form-control" id="credit_num3" name="credit_num3"/>
          <span class="input-group-addon">-</span>
          <input type="text" class="form-control" id="credit_num4" name="credit_num4"/>
        </div>
      </div>

      <div class="col-sm-2 col-6">
        <label> 背面末3碼<span class="text-danger">*</span></label>
        <div class="input-group">
          <input type="text" class="form-control" id="credit_Last" name="credit_Last" />
          <i class="far fa-credit-card fa-3x"></i>
        </div>
      </div>

      <div class="col-sm-4 col-6">
        <label> 卡片有效期限<span class="text-danger">*</span></label>
        <div class="input-group">
          <input type="text" class="form-control validity_begin" name = "validity_begin" />
          <span class="input-group-addon">-</span>
          <input type="text" class="form-control" id="validity_last" name = "validity_last" />
        </div>
      </div>

      <div class="col-sm-4 col-12">
        <label> 持卡人身分證字號<span class="text-danger">*</span></label>
        <div class="input-group">
          <input type="text" class="form-control" id="id_card" name="id_card" />
        </div>
      </div>
    </div>
  </div>
</div>