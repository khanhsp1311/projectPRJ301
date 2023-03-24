
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Brnd-logo Website Template | Details :: w3layouts</title>
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
    <!----//End-top-nav-script---->
</head>
<body>
    <!----container---->
    <div class="container">
        <!----top-header---->
        <div class="top-header">
            <div class="logo">
                <a href="index.html"><img src="images/logo.png" title="barndlogo" /></a>
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
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!----//top-header---->
        <!---top-header-nav---->
        <div class="top-header-nav"> 
            <!----start-top-nav---->
            <nav class="top-nav main-menu">
                <ul class="top-nav">
                    <li><a href="product">PRODUCTS </a><span> </span></li>
                    <li><a href="product">CAMPAINGS</a><span> </span></li>
                    <li><a href="product">SERVICES</a><span> </span></li>
                       <li><a href="admin">DASHBOARD</a><span> </span></li>
                    <li><a href="product">ABOUT US</a></li>
                    <div class="clearfix"> </div>
                </ul>
                <a href="#" id="pull"><img src="images/nav-icon.png" title="menu" /></a>
            </nav>
            <!----End-top-nav---->
            <!---top-header-search-box--->
            <div class="top-header-search-box">
                <form>
                    <input type="text" placeholder="Search" required / maxlength="22">
                    <input type="submit" value=" " >
                </form>
            </div>
            <!---top-header-search-box--->
            <div class="clearfix"> </div>
        </div>
    </div>
    <!--//top-header-nav---->
    <!----content---->
    <div class="content">
        <div class="container">
            <!--- products ---->
            <div class="products">
                <div class="product-filter">

                    <div style = "display:flex">
                        <div>
                            <h1><a href="#">FILTER</a></h1>
                        </div>
                        <div>
                            <h1><a href="index">HOME</a></h1>
                        </div>

                    </div>
                    <div class="product-filter-grids"> 
                        <div class="col-md-3 product-filter-grid1-brands">
                            <h3>BRANDS</h3>
                            <ul class="col-md-6 unstyled-list b-list1">
                                <c:forEach items = "${sessionScope.list}" var = "i">
                                    <li><a href="product?cid=${i.categoryId}">${i.name}</a></li>
                                    <div class="clearfix"> </div>
                                </c:forEach>
                            </ul>
                            <div class="clearfix"> </div>
                        </div>
                        <!---->
                        <div class="col-md-6 product-filter-grid1-brands-col2">
                            <div class="producst-cate-grids">
                                <div class="col-md-4 producst-cate-grid text-center">
                                    <h2>WOMAN</h2>
                                    <img class="r-img text-center img-responsive" src="images/img-w.jpg" title="name">
                                    <span><img src="images/objs1.png" title="name"></span>
                                    <h4>TOTAL</h4>
                                    <label>357 PRODUCTS</label>
                                    <a class="r-list-w" href="#"><img src="images/list-icon.png" title="list"></a>
                                </div>
                                <div class="col-md-4 producst-cate-grid text-center">
                                    <h2>MAN</h2>
                                    <img class="r-img text-center img-responsive" src="images/man-r-img.jpg" title="name">
                                    <span><img src="images/objs2.png" title="name"></span>
                                    <h4>TOTAL</h4>
                                    <label>357 PRODUCTS</label>
                                    <a class="r-list-w" href="#"><img src="images/list-icon.png" title="list"></a>
                                </div>
                                <div class="col-md-4 producst-cate-grid text-center">
                                    <h2>KIDS</h2>
                                    <img class="r-img text-center img-responsive" src="images/kid-r-img.jpg" title="name">
                                    <span><img src="images/objs3.png" title="name"></span>
                                    <h4>TOTAL</h4>
                                    <label>357 PRODUCTS</label>
                                    <a class="r-list-w" href="#"><img src="images/list-icon.png" title="list"></a>
                                </div>
                            </div>
                        </div>
                        <!---->
                        <div class="product-filter-grid1-brands-col3">
                            <div class="products-colors">
                                <h3>SELECT COLOR </h3>
                                <li><a href="#"><span class="color1"> </span></a></li>
                                <li><a href="#"><span class="color2"> </span></a></li>
                                <li><a href="#"><span class="color3"> </span></a></li>
                                <li><a href="#"><span class="color4"> </span></a></li>
                                <li><a href="#"><span class="color5"> </span></a></li>
                                <li><a href="#"><span class="color6"> </span></a></li>
                                <li><a href="#"><span class="color7"> </span></a></li>
                                <li><a href="#"><span class="color8"> </span></a></li>
                                <li><a href="#"><span class="color9"> </span></a></li>
                                <li><a href="#"><span class="color10"> </span></a></li>
                                <li><a href="#"><span class="color11"> </span></a></li>
                                <li><a href="#"><span class="color12"> </span></a></li>
                                <li><a href="#"><span class="color13"> </span></a></li>
                                <li><a href="#"><span class="color14"> </span></a></li>
                                <li><a href="#"><span class="color15"> </span></a></li>
                                <li><a href="#"><span class="color16"> </span></a></li>
                                <li><a href="#"><span class="color17"> </span></a></li>
                                <li><a href="#"><span class="color18"> </span></a></li>
                                <li><a href="#"><span class="color19"> </span></a></li>
                                <li><a href="#"><span class="color20"> </span></a></li>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"> </div>
        <!-- //products ---->
        <!----product-details--->
        <div class="product-details">
            <div class="container">
                <div class="product-details-row1">
                    <div class="product-details-row1-head">
                        <c:forEach items = "${sessionScope.dataP}" var = "i">
                            <h2>${i.title}</h2>
                            <p>${i.description}</p>
                        </c:forEach>
                    </div>
                    <div class="col-md-4 product-details-row1-col1">
                        <!----details-product-slider--->
                        <!-- Include the Etalage files -->
                        <link rel="stylesheet" href="css/etalage.css">
                        <script src="js/jquery.etalage.min.js"></script>
                        <!-- Include the Etalage files -->
                        <script>
        jQuery(document).ready(function ($) {

            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,
                source_image_width: 900,
                source_image_height: 1000,
                show_hint: true,
                click_callback: function (image_anchor, instance_id) {
                    alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                }
            });
// This is for the dropdown list example:
            $('.dropdownlist').change(function () {
                etalage_show($(this).find('option:selected').attr('class'));
            });

        });
                        </script>
                        <!----//details-product-slider--->
                       
                            <div class="details-left">
                                <div class="details-left-slider">
                                    <ul id="etalage">
                                        <li>
                                        <c:forEach items="${sessionScope.dataG}" var="i" end = "0">
                                            <a>
                                                <img class="etalage_thumb_image" src="${i.thumbnail}" />
                                            </a>
                                        </c:forEach>
                                        <c:forEach items="${sessionScope.dataG}" var="i" begin = "1" end = "1">
                                            <a>
                                                <img class="etalage_source_image" src="${i.thumbnail}" />
                                            </a>
                                        </c:forEach>
                                    </li>
                                    <c:forEach items="${sessionScope.dataG}" var="i">
                                        <li>
                                            <img class="etalage_thumb_image" src="${i.thumbnail}" />
                                        </li>
                                    </c:forEach>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 product-details-row1-col2">
                        <div class="product-rating">
                            <a class="rate" href="#"><span> </span></a>
                            <label><a href="#">Read <b>8</b> Reviews</a></label>
                        </div>
                        <div class="product-price">
                            <div class="product-price-left text-right">
                                <c:forEach items = "${sessionScope.dataP}" var = "i">
                                    <div style="margin-left: 100px">
                                        <h1 style = " text-align: center;width: 300px; height: 50px; background-color: red; color: white">${i.price} VND</h1>
                                    </div>
                                    <span>${i.discount} VND</span>
                                </c:forEach>
                            </div>
                            <div class="product-price-right">
                                <a href="#"><span> </span></a>
                                <label> save <b>40%</b></label>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="product-price-details">

                            <p class="text-right">This is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here,e </p>
                            <a class="shipping" href="#"><span> </span>Free shipping</a>
                            <div class="clearfix"> </div>
                            <div class="product-size-qty">

                                <div class="pro-size"> 
                                    <span style="color: orange">Size:<input type ="number" name ="numsize" value="7"/></span>

                                </div>


                                <form action="" method = "post" name = "f">
                                    <c:forEach items = "${sessionScope.dataP}" var = "i">
                                        <div class="pro-qty">
                                            <span style="color: orange">Quantity you buy:<input type ="number" name ="num" value="1"/></span><br/>
                                            <c:if test="${i.quantity == 0}">
                                            <span style="color: red;font-weight: bold">Quantity Of Products: Hết Hàng</span>
                                            </c:if>
                                             <c:if test="${i.quantity != 0}">
                                            <span style="color: red;font-weight: bold">Quantity Of Products: Còn Hàng</span>
                                            </c:if>
                                        </div> 

                                        <div class="clearfix"> </div>
                                </div>
                                <div class="clearfix"> </div>
                                <div class="product-cart-share">
                                    <div class="add-cart-btn">
                                        <input  type="submit" onclick="buy('${i.productId}')" value="Add to cart" />
                                    </div>
                                </c:forEach>

                                </form>  


                                <ul class="product-share text-right">
                                    <h3>Share This:</h3>
                                    <ul>
                                        <li><a class="share-face" href="#"><span> </span> </a></li>
                                        <li><a class="share-twitter" href="#"><span> </span> </a></li>
                                        <li><a class="share-google" href="#"><span> </span> </a></li>
                                        <li><a class="share-rss" href="#"><span> </span> </a></li>
                                        <div class="clear"> </div>
                                    </ul>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                    <!--//product-details--->
                </div>




                <div><h1>Sản Phẩm Liên Quan</h1></div>
                <div class="special-products-grids">
                    <c:forEach items = "${sessionScope.dataC}" var = "i">
                        <div class="col-md-3 special-products-grid text-center">

                            <a class="brand-name" href="detail?productId=${i.productId}" ><img src="${i.smallImage.galerySmall}" title="name"/></a>
                            <a class="product-here" href="detail?productId=${i.productId}"><img class ="img-responsive" style =" height: 200px; width: 180px" src="${i.thumbnail}" title="product-name" /></a>
                            <h4><a href="detail?productId=${i.productId}">${i.title}</a></h4>
                                <c:if test="${sessionScope.user.roleID == '1'}">

                                <div style = "margin-bottom: 15px">
                                    <a href ="delete?id=${i.productId}" onclick = "doDelete('${i.productId}')" style = "margin: 10px;width: 200px; height: 50px; border: 1px solid red; color: white; background-color: orange">Delete</a>
                                    <a href ="update?id=${i.productId}" style = "margin: 10px; width: 200px; height: 50px ;border: 1px solid red; color: white; background-color: orange" >Update</a>
                                </div>
                            </c:if>
                            <a class="product-btn" href="detail?productId=${i.productId}"><span>${i.price}</span><small>GET NOW</small><label> </label></a>
                        </div>

                    </c:forEach>
                    <div class="clearfix"> </div>
                </div>





                <!---- product-details ---->
                <div class="product-tabs">
                    <!--Horizontal Tab-->
                    <div id="horizontalTab">
                        <ul>
                            <li><a href="#tab-1">Product overwiev</a></li>
                            <li><a href="#tab-2">Features</a></li>
                            <li><a href="#tab-3">Customer reviews</a></li>
                        </ul>
                        <div id="tab-1" class="product-complete-info">
                            <h3>DESCRIPTION:</h3>
                            <p>With its beautiful premium leather, lace-up oxford styling, recycled rubber outsoles and 9-inch height, this Earthkeepers City Premium style is an undeniably handsome boot. To complement its rustic, commanding outer appearance, we've paid attention to the inside as well - by adding SmartWool® faux shearling to the linings and crafting the footbed using our exclusive anti-fatigue comfort foam technology to absorb shock. Imported.</p>
                            <span>DETAILS:</span>
                            <div class="product-fea">
                                <p>Premium burnished full-grain leather and suede upper</p>
                                <p>Leather is from a tannery rated Silver for its water, energy and waste-management practices</p>
                                <p>Leather lining and footbed for a premium feel and optimal comfort</p>
                                <p>SmartWool® faux shearling lining is made with 60% merino wool and 40% PET</p>
                                <p>Reflective insole board for additional warmth under foot</p>
                                <p>100% organic cotton laces</p>
                                <p>SmartWool® fabric-lined anti-fatigue footbed provides superior, all-day comfort and climate control</p>
                                <p>Timberland® exclusive Gripstick™ and Green Rubber™ outsole is made with 42% recycled rubber</p>
                            </div>
                        </div>
                        <div id="tab-2" class="product-complete-info">
                            <h3>DESCRIPTION:</h3>
                            <p>With its beautiful premium leather, lace-up oxford styling, recycled rubber outsoles and 9-inch height, this Earthkeepers City Premium style is an undeniably handsome boot. To complement its rustic, commanding outer appearance, we've paid attention to the inside as well - by adding SmartWool® faux shearling to the linings and crafting the footbed using our exclusive anti-fatigue comfort foam technology to absorb shock. Imported.</p>
                            <p>lace-up oxford styling, recycled rubber outsoles and 9-inch height, this Earthkeepers City Premium style is an undeniably handsome boot. To complement its rustic, commanding outer appearance,</p>
                            <span>DETAILS:</span>
                            <div class="product-fea">
                                <p>Premium burnished full-grain leather and suede upper</p>
                                <p>Leather is from a tannery rated Silver for its water, energy and waste-management practices</p>
                                <p>Leather lining and footbed for a premium feel and optimal comfort</p>
                                <p>SmartWool® faux shearling lining is made with 60% merino wool and 40% PET</p>
                                <p>Reflective insole board for additional warmth under foot</p>
                            </div>
                        </div>
                        <div id="tab-3"  class="product-complete-info">
                            <h3>DESCRIPTION:</h3>
                            <p>With its beautiful premium leather, lace-up oxford styling, recycled rubber outsoles and 9-inch height, this Earthkeepers City Premium style is an undeniably handsome boot. To complement its rustic, commanding outer appearance, we've paid attention to the inside as well - by adding SmartWool® faux shearling to the linings and crafting the footbed using our exclusive anti-fatigue comfort foam technology to absorb shock. Imported.</p>
                            <span>DETAILS:</span>
                            <div class="product-fea">
                                <p>100% organic cotton laces</p>
                                <p>SmartWool® fabric-lined anti-fatigue footbed provides superior, all-day comfort and climate control</p>
                                <p>Timberland® exclusive Gripstick™ and Green Rubber™ outsole is made with 42% recycled rubber</p>
                                <p>Premium burnished full-grain leather and suede upper</p>
                                <p>Leather is from a tannery rated Silver for its water, energy and waste-management practices</p>
                                <p>Leather lining and footbed for a premium feel and optimal comfort</p>
                                <p>SmartWool® faux shearling lining is made with 60% merino wool and 40% PET</p>
                                <p>Reflective insole board for additional warmth under foot</p>
                                <p>100% organic cotton laces</p>
                                <p>SmartWool® fabric-lined anti-fatigue footbed provides superior, all-day comfort and climate control</p>
                                <p>Timberland® exclusive Gripstick™ and Green Rubber™ outsole is made with 42% recycled rubber</p>
                            </div>
                        </div>
                    </div>
                    <!-- Responsive Tabs JS -->
                    <script src="js/jquery.responsiveTabs.js" type="text/javascript"></script>

                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('#horizontalTab').responsiveTabs({
                                                rotate: false,
                                                startCollapsed: 'accordion',
                                                collapsible: 'accordion',
                                                setHash: true,
                                                disabled: [3, 4],
                                                activate: function (e, tab) {
                                                    $('.info').html('Tab <strong>' + tab.id + '</strong> activated!');
                                                }
                                            });

                                            $('#start-rotation').on('click', function () {
                                                $('#horizontalTab').responsiveTabs('active');
                                            });
                                            $('#stop-rotation').on('click', function () {
                                                $('#horizontalTab').responsiveTabs('stopRotation');
                                            });
                                            $('#start-rotation').on('click', function () {
                                                $('#horizontalTab').responsiveTabs('active');
                                            });
                                            $('.select-tab').on('click', function () {
                                                $('#horizontalTab').responsiveTabs('activate', $(this).val());
                                            });

                                        });
                    </script>
                </div>
                <!-- //product-details ---->
            </div>
        </div>
        <!----content---->
        <div class="clearfix"> </div>
        <!----footer--->
        <div class="footer">
            <div class="container">
                <div class="col-md-3 footer-logo">
                    <a href="index.html"><img src="images/flogo.png" title="brand-logo" /></a>
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

<script type="text/javascript">
    function buy(id) {
//         gọi đến servlet buy
        document.f.action = "buy?productId=" + id;
        // sau đó submit cái form này
        document.f.submit();

    }
</script>
