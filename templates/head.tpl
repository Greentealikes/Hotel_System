<head>    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,900|Source+Serif+Pro&display=swap" rel="stylesheet">
     <title><{$WEB.web_title}></title>

    <link rel="stylesheet" href="<{$xoImgUrl}>fonts/icomoon/style.css">
   
    <link rel="stylesheet" href="<{$xoImgUrl}>css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="<{$xoImgUrl}>css/jquery.fancybox.min.css">   
    <link rel="stylesheet" href="<{$xoImgUrl}>css/owl.theme.default.min.css">
    
    <link rel="stylesheet" href="<{$xoImgUrl}>css/aos.css">   
    
    <link rel="stylesheet" href="<{$xoImgUrl}>css/selfstyle.css">
    <link href="<{$xoImgUrl}>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<{$xoImgUrl}>css/menu_style.css">
      
    <link rel="icon" href="<{$xoImgUrl}>image/favicon.png" type="image/png">      
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<{$xoImgUrl}>css/bootstrap.min.css">
    <link rel="stylesheet" href="<{$xoImgUrl}>vendor/linericon/style.css">   
    <link rel="stylesheet" href="<{$xoImgUrl}>css/owl.carousel.min.css">
  
    <link rel="stylesheet" href="<{$xoImgUrl}>vendor/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="<{$xoImgUrl}>vendor/owl-carousel/owl.carousel.min.css">
    <!-- main css -->
    <link rel="stylesheet" href="<{$xoImgUrl}>css/style.css">
    <link rel="stylesheet" href="<{$xoImgUrl}>css/responsive.css">
    
  </head>

  <style>

    #gotop {
        position:fixed;
        z-index:90;
        right:30px;
        bottom:31px;
        display:none;
        width:50px;
        height:50px;
        color:#fff;
        background:#33b5e5;
        line-height:50px;
        border-radius:50%;
        transition:all 0.5s;
        text-align: center;
        box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
    }
    
    #gotop :hover{
        background:#0099CC;
    }
    
    .wrap{
        max-width: 500px;
        margin: 0 auto;
    }
    body{
        line-height: 1.5;
    }
    .top{
        position: fixed;
        right: 0;
        bottom: 0;
    }


    .slider_container{
        position: relative;
    }

    .slider_container .overlay {
        position: absolute;
        top: 0;
        left: 0;
        opacity: 0;
        filter: alpha(opacity=0);
    }

    .slider_container .overlay {
        -webkit-animation: round 25s linear infinite;
                animation: round 25s linear infinite;
    }

    @-webkit-keyframes round {
        4% {
            opacity: 0.8;
            filter: alpha(opacity=100);
            /* 0 - 1秒 淡入*/
        }
        20% {
            opacity: 0.8;
            filter: alpha(opacity=100);
            /* 1- 5秒靜止*/
        }
        24% {
            opacity: 0;
            filter: alpha(opacity=0);
            /* 5-6秒淡出*/
        }
    }
    @keyframes round {
        4% {
            opacity: 0.8;
            filter: alpha(opacity=100);
            /* 0 - 1秒 淡入*/
        }
        20% {
            opacity: 0.8;
            filter: alpha(opacity=100);
            /* 1- 5秒靜止*/
        }
        24% {
            opacity: 0;
            filter: alpha(opacity=0);
            /* 5-6秒淡出*/
        }
    }

    .slider_container .overlay:nth-child(5) {
        -webkit-animation-delay: 0s;
                animation-delay: 0s;
        }

        .slider_container .overlay:nth-child(4) {
            -webkit-animation-delay: 5s;
                    animation-delay: 5s;
        }

        .slider_container .overlay:nth-child(3) {
            -webkit-animation-delay: 10s;
                    animation-delay: 10s;
        }

        .slider_container .overlay:nth-child(2) {
            -webkit-animation-delay: 15s;
                    animation-delay: 15s;
        }

        .slider_container .overlay:nth-child(1) {
            -webkit-animation-delay: 20s;
                    animation-delay: 20s;
        }

        

  </style>


<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">  
   
    <!-- 導覽頁面 -->   
        <header class="header_area">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <!-- Brand and toggle get grouped for better mobile display -->
                   <a class="navbar-brand logo_h" href="index.php"><img src="<{$xoImgUrl}>image/Logo.png" alt=""></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto">

                        <{if $mainMenus}>
                            <{foreach $mainMenus as $mainMenu}>
                            <li class="nav-item submenu dropdown">
                                <a href="<{$mainMenu.url}>" <{if $mainMenu.target == 1}> target ="_blank"<{/if}> class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><{$mainMenu.title}></a>
                                <ul class="dropdown-menu">
                                    <{foreach $secMenus as $secMenu}>
                                        <{if $mainMenu.ofsn ==  $secMenu.ofsn}>
                                            <li class="nav-item"><a class="nav-link" href="<{$mainMenu.url}>?<{$secMenu.url}>" <{if $secMenu.target == 1}> target ="_blank"<{/if}> ><{$secMenu.title}></a></li>       
                                        <{/if}>
                                    <{/foreach}>
                                </ul>
                            </li> 
                            <{/foreach}>
                        <{/if}>

                        <!-- about.php?op=about_into -->  

                            <li class="nav-item submenu dropdown">
                                <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">公告消息</a>
                                <ul class= "dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="news.php">最新消息</a></li> 
                                </ul>
                            </li>            

                             <li class="nav-item submenu dropdown">
                                <a href="services.php" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">民宿服務</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="services.php">房型介紹</a></li>                           
                                    <li class="nav-item"><a class="nav-link" href="services.php?op=checkin_info">入住資訊</a></li> 
                                </ul>
                            </li>        
                          
                            
                            <li class="nav-item submenu dropdown">
                                <a href="Onbooking.php?book=booking_form" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">線上預訂</a>
                                <ul class="dropdown-menu">                                  
                                    <li class="nav-item"><a class="nav-link" href="Onbooking.php?book=Page_date">住宿預定</a></li>                               
                                    <li class="nav-item"><a class="nav-link" href="Onbooking.php?book=booking_query_form&using=no">住宿查詢</a></li>
                                    
                                </ul>
                            </li>

                            <li class="nav-item submenu dropdown">
                                <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">檔案下載</a>
                            </li>  

                            <{if $smarty.session.user.kind === 1}>      
                                 <li class="nav-item"><a href="cart.php" class="nav-link">購物車</a></li>
                                <li class="nav-item"><a href="user.php" class="nav-link">管理員</a></li>
                                <li class="nav-item"><a href="login.php?op=logout&pageid=6" class="nav-link">Logout</a></li>   
                            <{elseif  $smarty.session.user.kind === 0}> 
                                <li class="nav-item"><a href="login.php?op=logout&pageid=6" class="nav-link">Logout</a></li>                   
                            <{else}>
                                <li class="nav-item"><a href="login.php?op=op_list&pageid=6" id="userin" class="nav-link">Login</a></li>                     
                            <{/if}> 
                        </ul>
                    </div> 
                </nav>
            </div>  
        </header>


    <div class="booking_table slider_container d_flex align-items-center">
        <div class="overlay" >
            <img src="<{$xoImgUrl}>image/banner/banner-1.jpg" >
        </div>

        <div class="overlay" >
              <img src="<{$xoImgUrl}>image/banner/banner-2.jpg" >
        </div>

         <div class="overlay" >
              <img src="<{$xoImgUrl}>image/banner/banner-3.jpg" >
        </div>

         <div class="overlay" >
               <img src="<{$xoImgUrl}>image/banner/banner-4.jpg" >
        </div>

         <div class="overlay" >
              <img src="<{$xoImgUrl}>image/banner/banner-5.jpg" >
        </div>
               
        <div class="container">
            <div class="banner_content text-center" style="color:brown;">                
                <h6>住宿生活 & 休閒茶飲 RED & TEAING</h6>              
                <h2>你最好的選擇</h2>
                <p>從現在起遠離都市區的繁雜生活，開始享受每一天的自己.現在促銷優惠中，一晚最便宜只要$250.</p>
            </div>
        </div>
    </div>    
    