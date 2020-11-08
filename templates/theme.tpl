<!doctype html>
<html lang="en">

    <!--  導覽頁面&css  -->
    <{include file="head.tpl"}>
   
    <!-- 點選導覽頁面切換內容 -->    
    <{if $WEB.file_name == "index.php"}>
      <{include file="tpl/index/index_fom.tpl"}>

    <{elseif $WEB.file_name == "about.php"}>
      <{include file="tpl/about/about_fom.tpl"}>

     <{elseif $WEB.file_name == "Onbooking.php"}>
      <{include file="tpl/book/book_fom.tpl"}>

    <{elseif $WEB.file_name == "services.php"}>
      <{include file="tpl/services/services_fom.tpl"}>

    <{elseif $WEB.file_name == "contact.php"}>
      <{include file="tpl/contact/contact_fom.tpl"}>

    <{elseif $WEB.file_name == "news.php"}>
      <{include file="tpl/news/news_fom.tpl"}>
   
    <{elseif $WEB.file_name == "login.php"}>
      <{if $smarty.session.user.kind === 1}>          
        <{include file="tpl/admin_form.tpl"}>
      <{else}>
        <{if $op == reg_form}>
          <{include file="tpl/reg_form.tpl"}>     
        <{else}>
          <{include file="tpl/login_form.tpl"}>
        <{/if}>
      <{/if}>
    <{/if}>
 

  <!-- 頁尾畫面 -->
  <{include file="footer.tpl"}>  

  </body>
</html> 

<{* 引入js檔案 *}>
<{include file="tpl/head_js.tpl"}>
  






