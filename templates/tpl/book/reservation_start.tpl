<div class="site-wrap" id="home-section">
  <form action="Onbooking.php" method="post" id="myForm" class="mb-20" enctype="multipart/form-data">
    <div class = "breadcrumb-container text-center">
      <div class="d-flex justify-content-center"><h2>訂房說明。BOOKING~</h2></div>   

        <!--預約系統導覽列-->              
          <div class="container"><br>
            <div class="d-flex justify-content-center">
              <ul class="nav nav-tabs" role="tablist">

              <{if $book == 'Page_connection' || $book == 'Page_success'}>
                <li class="nav-item">
                  <a class="nav-link reservation_link" href="javascript: void(0)">選擇房型下訂</a>
                </li>
               <{else}>
                <li class="nav-item">
                  <a class="nav-link reservation_link active" href="javascript: void(0)">選擇房型下訂</a>
                </li>
              <{/if}>

              <li class="nav-item">
                <a class="nav-link reservation_link" href="javascript: void(0)">注意事項</a>
              </li>

                <{if $book == 'Page_connection'}>
                  <li class="nav-item">
                    <a class="nav-link reservation_link active" href="javascript: void(0)" >填寫聯絡資訊</a>
                  </li>
                <{else}>
                  <li class="nav-item">
                    <a class="nav-link reservation_link" href="javascript: void(0)" >填寫聯絡資訊</a>
                  </li>
                <{/if}>
               
                <{if $book == 'Page_success'}>
                  <li class="nav-item">
                      <a class="nav-link reservation_link active" href="javascript: void(0)" >線上訂房完成</a>
                    </li>
                <{else}>
                  <li class="nav-item">
                    <a class="nav-link reservation_link" href="javascript: void(0)" >線上訂房完成</a>
                  </li>
                <{/if}>
               
              </ul>
            </div>
      
        <!--預約系統連結-->
        <div class="tab-content">

        <{if $book == 'Page_date'}>
          <div id="Page_date" class="container tab-pane active"><br>
            <{include file="tpl/book/reservation_date.tpl"}> 
          </div>

          <div id="Page_descrion" class="container tab-pane"><br>
            <{include file="tpl/book/reservation_note.tpl"}> 
          </div>
        <{/if}>

        <{if $book == 'Page_connection'}>
          <div id="Page_connection" class="container tab-pane active"><br>
            <{include file="tpl/book/reservation_connection.tpl"}> 
          </div>
        <{/if}>

        <{if $book == 'Page_success'}>
          <div id="Page_connection" class="container tab-pane active"><br>
            <{include file="tpl/book/reservation_success.tpl"}> 
          </div>
        <{/if}>
          
          <div id="Page_payment" class="container tab-pane"><br>
            <{include file="tpl/book/reservation_payment.tpl"}> 
          </div>
          <div id="Page_success" class="container tab-pane"><br>
            <{include file="tpl/book/reservation_success.tpl"}> 
          </div>

          <div id="Page_send" class="container tab-pane"><br>
            <{include file="tpl/book/reservation_success.tpl"}> 
          </div>
        </div>
      </div>
    </div>
  </form>
</div>

<div class="wrap">
  <div class="top">
    <a href="https://www.blogger.com/blogger.g?blogID=2031514508322140995#" id="gotop">
     <i class="fa fa-angle-up"></i>
      </a>
  </div>
</div>

<!-- 向上滾輪按鈕-->
<script>
$(document).ready(function($) {
	$('.top a').click(function(event) {
		event.preventDefault();
		$('html, body').animate({	scrollTop: 0},500);
	});
});

$(window).scroll(function() {
    if ( $(this).scrollTop() > 400){
        $('#gotop').fadeIn();
    } else {
        $('#gotop').fadeOut();
    }
});

</script>