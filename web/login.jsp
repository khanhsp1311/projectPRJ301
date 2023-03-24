<%-- 
    Document   : login
    Created on : Oct 14, 2022, 4:59:39 PM
    Author     : DELL
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Simple Login Form</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.login-form {
    width: 340px;
    margin: 50px auto;
  	font-size: 15px;
}
.login-form form {
    margin-bottom: 15px;
    background: #f7f7f7;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;
}
.login-form h2 {
    margin: 0 0 15px;
}
.form-control, .btn {
    min-height: 38px;
    border-radius: 2px;
}
.btn {        
    font-size: 15px;
    font-weight: bold;
}
</style>
</head>

<body>
<div class="login-form">
    <form action="login">
        <h2 class="text-center">Log in</h2>  
        <c:if test="${requestScope.err != null}">
        <div class = "alert alert-danger" role = "alert">
            <p> ${requestScope.err} </p>
        </div>
        </c:if>
        <div class="form-group">
            <input type="text" value ="${cookie.email.value}" class="form-control" placeholder="Email" required="required" name = "email">
        </div>
        <div class="form-group">
            <input type="password" value ="${cookie.pass.value}" class="form-control" placeholder="Password" required="required" name = "pass">
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Log in</button>
        </div>
        <div class="clearfix">
            <label class="float-left form-check-label"><input ${(cookie.rem.value eq 'on') ? "checked":""} name ="rem" value ="on" type="checkbox"> Remember me</label>
            <a href="#" class="float-right">Forgot Password?</a>
        </div>        
            
<!--            khi đăng nhập nếu nguwoif dùng là admin thì sẽ hiển thị ra nó
            còn không thì sẽ ko thể được
            . khi đăng kí mình cũng sẽ lấy được tên email; khi ấy nó cũng sẽ chạy đến file sign up rồi check dữ liệu 
            rồi chạy qua list-->
            
    </form>
    <p class="text-center"><a href="register.jsp">Create an Account</a></p>
</div>
</body>
</html>