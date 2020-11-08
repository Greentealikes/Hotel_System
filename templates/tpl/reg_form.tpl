<style>
  .error{
    color:red;
  }
</style>

<div class="container mt-5">
  <h1 class="text-center">註冊表單</h1>
  <form action="login.php" method="post" id="myreg" class="mb-20" enctype="multipart/form-data">
  <div class="row"> 
    <div class="col-sm-4">
      <div class="form-group">
        <label>帳號<span class="text-danger">*</span></label>
        <input type="text" class="form-control" name="uname" id="uname" value="" >
      </div>
    </div>

    <div class="col-sm-4">
      <div class="form-group">
        <label>密碼<span class="text-danger">*</span></label>
        <input type="password" class="form-control" name="pass" id="pass" value="" >
      </div>
    </div>         
                 
    <div class="col-sm-4">
      <div class="form-group">
        <label>確認密碼<span class="text-danger">*</span></label>
        <input type="password" class="form-control" name="chk_pass" id="chk_pass" value="" >
      </div>
    </div>         
                  
    <div class="col-sm-4">
      <div class="form-group">
        <label>姓名<span class="text-danger">*</span></label>
        <input type="text" class="form-control" name="name" id="name" value="" >
      </div>
    </div>         
                  
    <div class="col-sm-4">
      <div class="form-group">
        <label>電話<span class="text-danger">*</span></label>
        <input type="text" class="form-control" name="tel" id="tel" value="" >
      </div>
    </div>             
                    
    <div class="col-sm-4">
      <div class="form-group">
        <label>信箱<span class="text-danger">*</span></label>
        <input type="text" class="form-control" name="email" id="email" value="" >
      </div>
    </div> 

    <div class="col-sm-12">
      <div class="text-center pb-20">
        <input type="hidden" name="op" value="reg" id="op">
        <button type="submit" class="btn btn-primary">送出</button>
      </div>
    </div>
  </div>
  </form>
</div>
  
  

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

<script src="<{$xoImgUrl}>js/jquery-3.3.1.min.js"></script>
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

 
 
