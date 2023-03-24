

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Brnd-logo Website Template | Home :: w3layouts</title>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <!---- start-smoth-scrolling---->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!---- start-smoth-scrolling---->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <!----webfonts--->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <!---//webfonts--->
    <!----start-top-nav-script---->
    <script>
        $(function () {
            var pull = $('#pull');
            menu = $('nav ul');
            menuHeight = menu.height();
            $(pull).on('click', function (e) {
                e.preventDefault();
                menu.slideToggle();
            });
            $(window).resize(function () {
                var w = $(window).width();
                if (w > 320 && menu.is(':hidden')) {
                    menu.removeAttr('style');
                }
            });
        });
    </script>
    <style>
        table{
            border-collapse: collapse;
        }


        .pagination {
            display: inline-block;
        }
        .pagination a {
            color: black;
            font-size: 22px;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
        }
        .pagination a.active {
            background-color: #4CAF50;
            color: white;
        }
        .pagination a:hover:not(.active) {
            background-color: chocolate;
        }


    </style>
    <!----//End-top-nav-script---->
</head>
<body>
    <!----container---->
    <div class="container">
        <!----top-header---->
        <div class="top-header">
            <div class="logo">
                <a href="index"><img  src="images/logo.png" title="barndlogo" /></a>
            </div>
            <div class="top-header-info">
                <div class="top-contact-info">
                    <ul class="unstyled-list list-inline">
                        <li><span class="phone"> </span>090 - 223 44 66</li>
                        <li><span class="mail"> </span><a href="#">help@trendd.com</a></li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>
                
                <div class="cart-details">
                   <div class="add-to-cart">
                        <ul class="unstyled-list list-inline">
                            <li>
                                
                                <a href ="MyEcart.jsp">  <span class="cart"> </span>  </a>
                                <c:if test="${size != null}">
                                    <c:if test="${size != 0}">
                                <p class="img-circle" style="border: 1px solid red; width: 18px; height: 20px ; padding-left: 4px; padding-bottom: 9px; background-color: red;position: relative;color:white; bottom: 41px; left: 17px"> ${size}</p>
                              </c:if>
                                </c:if>
                                <ul class="cart-sub">
                                  
                                    <c:set var = "size" value="${sessionScope.size}"/>
                                    <!--<li><p> Cart(${size})</p></li>-->
                                </ul>
                            </li>
                        </ul>
                    </div>
                                
                                
                                
                    <div class="login-rigister">
                        <ul class="unstyled-list list-inline">
                            <c:if test="${sessionScope.DataEmail == null}">
                                <li><a class="login" href="login.jsp">Login</a></li>
                                <li><a class="rigister" href="register.jsp">REGISTER <span> </span></a></li>
                                </c:if>
                                <c:if test="${sessionScope.DataEmail != null}">
                                <li>  <img src="images/IconUser.png" width ="80 px"  height = "80 px" alt="alt"/></li>
                                <li>${sessionScope.DataEmail}</li>
                                <li><a href = "logout" style ="font-weight: bold; color: orange" >LOG OUT</a></li>
                                </c:if>
                            <div class="clearfix"> </div>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!----//top-header---->
        <!---top-header-nav---->
        <c:if test="${sessionScope.checkout != null}">
        <div style="text-align: center">
          <p style="font-weight: bold; color: chocolate">${sessionScope.checkout} </p></div>
        </c:if>
        <div class="top-header-nav"> 
            <!----start-top-nav---->
            <nav class="top-nav main-menu">
                <ul class="top-nav">
                    <li><a href="product">PRODUCTS</a><span> </span></li>
                    <li><a href="product">CAMPAINGS</a><span> </span></li>
                    <li><a href="admin">DASHBOARD</a><span> </span></li>
                    <li><a href="DashboardP">DASHBOARD</a><span> </span></li>
                    <li><a href="product">BRANDS</a><span> </span></li>
                    <li><a href="product">ABOUT US</a></li>
                    <div class="clearfix"> </div>
                </ul>
                <a href="#" id="pull"><img src="images/nav-icon.png" title="menu" /></a>
            </nav>
            <!----End-top-nav---->
            <!---top-header-search-box--->
            <div class="top-header-search-box">
                <form action ="product" method ="post">
                    <input type="text" placeholder="Search" name ="title" required / maxlength="22">
                    <input type="submit" value="" >
                </form>
            </div>
            <!---top-header-search-box--->
        </div>
    </div>
    <!--//top-header-nav---->
    <!----start-slider-script---->
    <script src="js/responsiveslides.min.js"></script>
    <script>
// You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 4
            $("#slider4").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });

        });
    </script>
    <!----//End-slider-script---->
    <!-- Slideshow 4 -->
    
    <div  id="top" class="callbacks_container">
        <ul class="rslides" id="slider4">
            <li>
                <img src="images/slide1.png" alt="">
                <div class="caption">
                    <div class="slide-text-info">
                        <h1>WILL HELM</h1>
                        <label>WINTER</label>
                        <a class="slide-btn" href="#"><span>99.90$</span> <small>GET NOW</small><label> </label></a>
                    </div>
                </div>
            </li>
            <li>
                <img src="images/slide2.png" alt="">
                <div class="caption">
                    <div class="slide-text-info">
                        <h1>FAST NER2</h1>
                        <label>Dress Shoe</label>
                        <a class="slide-btn" href="#"><span>99.90$</span> <small>GET NOW</small><label> </label></a>
                    </div>
                </div>
            </li>
            <li>
                <img src="images/slide1.png" alt="">
                <div class="caption">
                    <div class="slide-text-info">
                        <h1>WILL HELM</h1>
                        <label>WINTER</label>
                        <a class="slide-btn" href="#"><span>99.90$</span> <small>GET NOW</small><label> </label></a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="clearfix"> </div>
    <!----- //End-slider---->
    <!----content---->
    <div class="content">
        <div class="container">
            <!---top-row--->
            <div class="top-row">
                <div class="col-xs-4">
                    <div class="top-row-col1 text-center">
                        <h2>WOMAN</h2>
                        <img class="r-img text-center" src="images/img-w.jpg" title="name" />
                        <span><img src="images/obj1.png" title="name" /></span>
                        <h4>TOTAL</h4>
                        <label>357 PRODUCTS</label>
                        <a class="r-list-w" href="single-page.html"><img src="images/list-icon.png" title="list" /></a>
                    </div>
                </div>
                <div class="col-xs-4">
                    <div class="top-row-col1 text-center">
                        <h2>MAN</h2>
                        <img class="r-img text-center" src="images/man-r-img.jpg" title="name" />
                        <span><img src="images/obj2.png" title="name" /></span>
                        <h4>TOTAL</h4>
                        <label>357 PRODUCTS</label>
                        <a class="r-list-w" href="single-page.html"><img src="images/list-icon.png" title="list" /></a>
                    </div>
                </div>
                <div class="col-xs-4">
                    <div class="top-row-col1 text-center">
                        <h2>KIDS</h2>
                        <img class="r-img text-center" src="images/kid-r-img.jpg" title="name" />
                        <span><img src="images/obj3.png" title="name" /></span>
                        <h4>TOTAL</h4>
                        <label>357 PRODUCTS</label>
                        <a class="r-list-w" href="single-page.html"><img src="images/list-icon.png" title="list" /></a>
                    </div>
                </div>
                <vdi class="clearfix"> </div>
        </div>
        <!---top-row--->
        <div class="container"> 
            <!----speical-products---->
            <div class="special-products">
                <div class="s-products-head">
                    <div class="s-products-head-left">
                        <h3>All Of The <span>PRODUCTS</span></h3>
                    </div>
                     <div class="s-products-head-right">
                        <a href="product?cid=0"><span> </span>view all products</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
              

                <c:if test="${sessionScope.user.roleID == '1'}">

                    <div style = "margin-top: 15px; ">
                        <a href = "add.jsp" style = "background-color:orange">ADD NEW PRODUCT</a>
                    </div>
                </c:if>
                 <c:set var = "page" value = "${requestScope.page}"/>
                <!--sau đó lấy số lượng trang; rồi viết num đấy ra-->
                <div class = "pagination">
                    <c:forEach begin="${1}" end = "${requestScope.num}" var="i" >
                        <a class ="${i==page?"active":""}" href="paging?page=${i}">${i}</a>
                    </c:forEach>
                </div>


                <!----special-products-grids---->
                <div class="special-products-grids">
                      <c:forEach items = "${requestScope.data}" var = "i">
                        <div class="col-md-3 special-products-grid text-center">
                            <a class="brand-name" href="detail?productId=${i.productId}" ><img src="${i.smallImage.galerySmall}" title="name"/></a>
                            <a class="product-here" href="detail?productId=${i.productId}"><img class ="img-responsive" style =" height: 200px; width: 180px" src="${i.thumbnail}" title="product-name" /></a>
                            <h4><a href="detail?productId=${i.productId}">${i.title}</a></h4>
                                <c:if test="${sessionScope.user.roleID == '1'}">

                                <div style = "margin-bottom: 15px">
                                    <a href ="delete?id=${i.productId}" onclick="doDelete('${i.productId}')" style = "margin: 10px;width: 200px; height: 50px; border: 1px solid red; color: white; background-color: orange">Delete</a>
                                    <a href ="update?id=${i.productId}" style = "margin: 10px; width: 200px; height: 50px ;border: 1px solid red; color: white; background-color: orange" >Update</a>
                                </div>
                               
                            </c:if>
                            <a class="product-btn" href="detail?productId=${i.productId}"><span>${i.price}</span><small>GET NOW</small><label> </label></a>
                        </div>
                    </c:forEach>

                    <div class="clearfix"> </div>
                </div>

                <!--// phân trang chỗ này nhé-->






                <!---//special-products-grids---->

                <!---//speical-products---->
        </div>
        <!----content---->
        <!----footer--->
        <div class="footer">
            <div class="container">
                <div class="col-md-3 footer-logo">
                    <!--<a href="index"><img src="images/flogo.png" title="brand-logo" /></a>-->
                </div>
                <div class="col-md-7 footer-links">
                    <ul class="unstyled-list list-inline">
                        <li><a href="#"> Faq</a> <span> </span></li>
                        <li><a href="#"> Terms and Conditions</a> <span> </span></li>
                        <li><a href="#"> Secure Payments</a> <span> </span></li>
                        <li><a href="#"> Shipping</a> <span> </span></li>
                        <li><a href="contact.jsp"> Contact</a> </li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>
                <div class="col-md-2 footer-social">
                    <ul class="unstyled-list list-inline">
                        <li><a class="pin" href="#"><span> </span></a></li>
                        <li><a class="twitter" href="#"><span> </span></a></li>
                        <li><a class="facebook" href="#"><span> </span></a></li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="clearfix"> </div>
        <!---//footer--->
        <!---copy-right--->
        <div class="copy-right">
            <div class="container">
                <p>Template by <a href="http://w3layouts.com/">W3layouts</a></p>
                <script type="text/javascript">
                    $(document).ready(function () {
                        /*
                         var defaults = {
                         containerID: 'toTop', // fading element id
                         containerHoverID: 'toTopHover', // fading element hover id
                         scrollSpeed: 1200,
                         easingType: 'linear' 
                         };
                         */

                        $().UItoTop({easingType: 'easeOutQuart'});

                    });
                </script>
                <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
            </div>
        </div>
        <!--//copy-right--->
    </div>
    <!----container---->
</body>
</html>


