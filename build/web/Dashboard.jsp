<%-- 
    Document   : Admin
    Created on : Oct 30, 2022, 10:07:53 AM
    Author     : DELL
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
       <script src="js/stats.js"></script>
    </head>
    
    <body>
<!--        <nav class="navbar bg-light">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Thống kê sản phẩm theo danh mục</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Thống kê doanh thu theo từng sản phẩm</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Thống kê doanh thu theo thời gian</a>
    </li>
  </ul>

</nav>-->
 <div style="width: 55%; float:left">
            <canvas id="myCateStatsChart"></canvas>
        </div>
       <h1>Thong ke cac san pham ban chay theo thoi gian</h1>
        
        <form action="DashboardP" method = "post">
            Form <input type = "Date" name = "date1"/><br/>
            To <input type = "Date" name = "date2"/><br/>
            <input type ="submit" value ="SEARCH"/>
        </form>
       <table border = "1px">
           <tr>
               <th>ProductId</th>
               <th>Sum Products buyed</th>
               <th>Name</th>
           </tr>

        <c:forEach items="${requestScope.list}" var = "i">
                <tr>
                    <td>${i.productId}</td>
                    <td>${i.sum}</td>
                    <td>${i.title}</td>
                </tr>
            </c:forEach>
                  </table>
       
        <script>
            let cateLabels=[], cateInfo=[];
                            <c:forEach items = "${requestScope.list}" var = "i" >
                                cateLabels.push('${i.title}')
                                cateInfo.push('${i.sum}')
                            </c:forEach>
            
            window.onload = function(){
                cateChart("myCateStatsChart",cateLabels,cateInfo)
            }
        </script>
    </body>
</html>
