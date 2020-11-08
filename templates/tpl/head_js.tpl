  
    <script src="<{$xoImgUrl}>js/jquery-3.3.1.min.js"></script>
    <script src="<{$xoImgUrl}>js/jquery-migrate-3.0.0.js"></script>
    <script src="<{$xoImgUrl}>js/popper.min.js"></script>
    <script src="<{$xoImgUrl}>js/bootstrap.min.js"></script>
    <script src="<{$xoImgUrl}>js/owl.carousel.min.js"></script>
    <script src="<{$xoImgUrl}>js/jquery.sticky.js"></script>
    <script src="<{$xoImgUrl}>js/jquery.waypoints.min.js"></script>
    <script src="<{$xoImgUrl}>js/jquery.animateNumber.min.js"></script>
    <script src="<{$xoImgUrl}>js/jquery.fancybox.min.js"></script>
    <script src="<{$xoImgUrl}>js/jquery.stellar.min.js"></script>
    <script src="<{$xoImgUrl}>js/jquery.easing.1.3.js"></script>
    <script src="<{$xoImgUrl}>js/bootstrap-datepicker.min.js"></script>
    <script src="<{$xoImgUrl}>js/isotope.pkgd.min.js"></script>
    <script src="<{$xoImgUrl}>js/aos.js"></script>
    
    <script src="<{$xoImgUrl}>js/popper.js"></script>
  
    <script src="<{$xoImgUrl}>vendor/owl-carousel/owl.carousel.min.js"></script>
    <script src="<{$xoImgUrl}>js/jquery.ajaxchimp.min.js"></script>
    <script src="<{$xoImgUrl}>js/mail-script.js"></script>
    
    <script src="<{$xoImgUrl}>vendor/nice-select/js/jquery.nice-select.js"></script>
    <script src="<{$xoImgUrl}>js/mail-script.js"></script>
    <script src="<{$xoImgUrl}>js/stellar.js"></script>
    <script src="<{$xoImgUrl}>vendor/lightbox/simpleLightbox.min.js"></script>
    
    <script src="<{$xoImgUrl}>js/custom.js"></script>

     <script>
     $('.owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        nav:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:3
            },
            1000:{
                items:5
            }
        }
    })
     </script>

    
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
    <script src="<{$xoImgUrl}>js/main.js"></script>



    <script src="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.js"></script>
    
    <link rel="stylesheet" href="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.css"> 
    <{if $redirect}>
        <{if $sn == 1}>
            <script>
                window.onload = function(){
                    Swal.fire({
                    //position: 'top-end',
                    icon: 'success',
                    title: "<{$message}>",
                    showConfirmButton: false,
                    timer: <{$time}>
                    })
                }
            </script>
        <{else}>
            <script>
                window.onload = function(){
                    Swal.fire({
                    //position: 'top-end',
                    icon: 'error',
                    title: "<{$message}>",
                    showConfirmButton: false,
                    timer: <{$time}>
                    })
                }
            </script>
        <{/if}>
    <{/if}>



    
<link rel="stylesheet" href="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.css"> 


  <script src="<{$xoImgUrl}>js/jquery.validate.min.js"></script>
  <script>
    $(function(){
        $('#myForm').validate({
       
       onkeyup: function(element, event) {
        
         var value = this.elementValue(element).replace(/^\s+/g, "");
         $(element).val(value);
        },
        rules: {
          usname: {
            required: true
          },
          usphone:{
            required: true,
            minlength: 8,
            number: true
          }, 
          usemail: {
            required: true,
            email: true
          },
          usarea:{
            required:true
          },
          datein:{
            required:true
          },
          dateout:{
            required:true
          }
         
        },
        messages: {
          usname: {
            required:'必填'
          },
          usphone: {
            required:'必填',
            minlength:'不得少於8位',
            number:'電話需為數字'
          }, 
          usemail: {
            required:'必填',
            email:'Email格式不正確'
          },
          usarea:{
            required:'必填'
          },
          datein:{
            required:'必填'
          },
          dateout:{
            required:'必填  '
          }   
        },
        submitHandler: function(form) {
          form.submit();
        }
  });
});
</script>

<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
            
            $('#datetimepickerb1,#datetimepickerb2,#datetimepicker11,#datetimepicker1').datetimepicker({
            daysOfWeekDisabled: [0, 6]
            
            });
        }));
    });
</script>

<script>
  $(function(){
    $("#gotop").click(function(){
      $("html,body").animate({scrolTop:0},900);
      return false;
    });
  });
</script>




