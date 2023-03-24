
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
       <script src="js/stats.js"></script>
      
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
    </head>
    <body>
       
      <div class="container">
        <!----top-header---->
        <div class="top-header">
            <div class="logo">
                <a href="index.jsp"><img src="images/logo.png" title="barndlogo" /></a>
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
                            <li><span class="cart"> </span>
                                <ul class="cart-sub">
                                    <li><p>0 Products</p></li>
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
        <div class="top-header-nav"> 
            <!----start-top-nav---->
            <nav class="top-nav main-menu">
                <ul class="top-nav">
                    <li><a href="product">PRODUCTS </a><span> </span></li>
                    <li><a href="product">CAMPAINGS</a><span> </span></li>
                    <li><a href="Admin">Dashboards</a><span> </span></li>
                    <li><a href="products.jsp">ABOUT US</a></li>
                    <li><a href="products.jsp">SERVICES</a><span> </span></li>
                    <div class="clearfix"> </div>
                </ul>
                <a href="#" id="pull"><img src="images/nav-icon.png" title="menu" /></a>
            </nav> 
            <br/>
            <!----End-top-nav---->
            <!---top-header-search-box--->

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
                                    </c:forEach>
                                <div class="clearfix"> </div>
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

                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        
        
        
        
        
        
        
        
        
        <div style="float:left"> 
        <div style="width: 55%; float:left">
            <canvas id="myCateStatsChart"></canvas>
        </div>
            <div style="width: 45%; float:left">
        <h1 style="color: orange; text-align: center">Thống kê sản phẩm theo danh mục</h1>
        
        <table border ="1px" style="border-collapse: collapse; width: 80%; margin-left: 50px">
            <tr>
                <th>Category id</th>
                <th> Name </th>
                <th> số lượng sản phẩm</th>
            </tr>
            <c:set var="k" value = "1"/>
            <c:forEach items = "${requestScope.data}" var = "i">
                
                <tr>
                    <td>${k}</td>
                    <td>${i.smallImage.name}</td>
                    <td>${i.quantity}</td>
                </tr>
                <c:set var = "k" value="${k+1}"/>
            </c:forEach>
           
        </table>
         
            </div>
     </div>
            
        <script>
            let cateLabels=[], cateInfo=[];
                            <c:forEach items = "${requestScope.data}" var = "i" >
                                cateLabels.push('${i.smallImage.name}')
                                cateInfo.push('${i.quantity}')
                            </c:forEach>
            
            window.onload = function(){
                cateChart("myCateStatsChart",cateLabels,cateInfo)
            }
        </script>
    </body>
</html>

