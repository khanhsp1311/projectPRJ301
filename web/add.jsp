
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form by Colorlib</title>
     
        <script src ="ckeditor/styles.js" > </script>
        <!-- Font Icon -->
        
        
        <link rel="stylesheet" href="colorlib-regform-8/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="colorlib-regform-8/css/style.css">
        <style>
            body{
                background-image: url(colorlib-regform-8/images/signup-bg1.jpg)
            }
        </style>
      
    </head>
    <body>

        <div class="main">

            <section class="signup">
                <!--<img src="images/signup-bg.jpg" alt="">--> 
                <div class="container">
                    <div class="signup-content">
                        <form action ="add" id="signup-form" class="signup-form">
                            <h2 class="form-title">Add New Product</h2>
                            <c:if test="${requestScope.error != null}">
                                <div class = "alert alert-danger" role = "alert" style = " text-align: center">
                                    <p style = "color: red; font-weight: bolder"> ${requestScope.error} </p>
                                </div>
                            </c:if>
                            <div class="form-group">
                                Enter Product ID  <input type="number" class="form-input" name="productId"  />
                            </div>
                            <div class="form-input">
                                Select Category: 
                                <select name ="categoryId" style ="width: 450px; height: 40px; background-color: #00A2C1" >
                                    <option value = "1">Nike</option>
                                    <option value = "2">Camper</option>
                                    <option value = "3">Converse</option>
                                    <option value = "4">Puma</option>
                                    <option value = "5">Adidas</option>
                                </select>
                            </div>
                            <div class="form-group">
                                Enter title  <input type="text" class="form-input" name="title"  />
                            </div>
                            <div class="form-group">
                                Enter Price <input type="number" class="form-input" name="price" />
                            </div>
                            <div class="form-group">
                                Enter Discount <input type="number" class="form-input" name="discount" />
                            </div>
                            <div class="form-group">
                                Enter Thumbnail <input type="text" class="form-input" name="thumbnail" />
                            </div>
                            
                            <label>Enter Description</label>
                            <div class="form-group col-md-12">

                                <textarea name="description" class="form-control " id="editor1"></textarea>
                            </div>

                            <div class="form-group">
                                Enter Created at  <input type="date" class="form-input" name="created_at" />
                            </div>

                            <div class="form-group">
                                Enter Updated at  <input type="date" class="form-input" name="updated_at" />
                            </div>

                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="ADD"/>
                            </div>
                        </form>

                    </div>
                </div>
            </section>

        </div>
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script src="ckeditor/ckeditor.js"></script>
      <script src="ckfinder/ckfinder.js"></script>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) .mvn/wrapper/maven-wrapper.jar/maven-wrapper.properties -->
    <script> 
       var editor = CKEDITOR.replace('editor1');
       CKFinder.setupCKEditor(editor,'ckfinder');
    </script>
</html>
