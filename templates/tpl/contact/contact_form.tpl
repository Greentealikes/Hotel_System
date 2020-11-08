
    <div class="container mt-5" style="margin-top: 100px!important;>
        <h1 class="text-center">聯絡我們</h1>
			
        <!-- 表單返回頁，記得在表單加「 target='returnWin' 」 -->
        <iframe name="returnWin" style="display: none;" onload="this.onload=function(){window.location='index.php?op=ok'}"></iframe>

        

        <form  target='returnWin' role="form" action="https://docs.google.com/forms/u/0/d/e/1FAIpQLSdOgfcb0Oeap97lyazubwy0gLFjDuck0J6oo_R0Dk_db3B_9g/formResponse" method="post" id="myForm" >
            
            <div class="row">
                <!--姓氏-->              
                <div class="col-sm-4">
                    <div class="form-group">
                        <label><span class="title">姓氏First name</span><span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="entry.1145907389" id="1145907389" value="">
                    </div>
                </div>
                <!--名字-->              
                <div class="col-sm-4">
                    <div class="form-group">
                        <label><span class="title">名字Last name</span><span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="entry.95072906" id="95072906" value="">
                    </div>
                </div>
                <!--電話-->              
                <div class="col-sm-4">
                    <div class="form-group">
                        <label><span class="title">電話Phone</span><span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="entry.116597512" id="116597512" value="">
                    </div>
                </div>
                <!--email-->              
                <div class="col-sm-4">
                    <div class="form-group">
                        <label><span class="title">電子信箱Email</span><span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="entry.95109501" id="95109501" value="">
                    </div>
                </div>
            </div> 
            
            <div class="row">
                <div class="col-sm-12">  
                    <!-- 聯絡事項 -->
                    <div class="form-group">
                        <label class="control-label">聯絡事項Message</label>
                        <textarea class="form-control" rows="5" id="618446212" name="entry.618446212"></textarea>
                    </div>
                </div>
            </div>

            <div class="text-center pb-3">
                <button type="submit" class="btn btn-primary">送出</button>
            </div>
        </form>
    </div>
    
    <!-- 表單驗證 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
    <!-- 調用方法 -->
    <style>
    .error{
        color:red;
    }
    </style>
    <script>
    
    $(function(){
        $("#myForm").validate({
        submitHandler: function(form) {
            form.submit();
        },
        rules: {
            'entry.1145907389' : {
            required: true
            },
            'entry.95072906' : {
            required: true
            },
            'entry.116597512' : {
            required: true
            }
            'entry.95109501' : {
            required: true
            }
            'entry.618446212' : {
            required: true
            }
        },
        messages: {
            'entry.1145907389' : {
            required: "必填"
            },
            'entry.95072906' : {
            required: "必填"
            },
            'entry.116597512' : {
            required: "必填"
            }
            'entry.95109501' : {
            required: "必填"
            }
            'entry.618446212' : {
            required: "必填"
            }
        }
        });

    });
    </script>
    