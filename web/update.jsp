
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
                        <form action ="update" method="post" id="signup-form" class="signup-form">
                            <h2 class="form-title">Update Product</h2>
                            <c:set var = "p" value = "${requestScope.product}"/>
                            <div class="form-group">
                                Enter title  <input type="text" class="form-input" name="title"  value = "${p.title}"/>
                            </div>
                            <div class="form-group">
                                Enter Price <input type="number" class="form-input" name="price"  value = "${p.price}"/>
                            </div>
                            <div class="form-group">
                                Enter Discount <input type="number" class="form-input" name="discount" value = "${p.discount}"/>
                            </div>
                            <div class="form-group">
                                Enter Thumbnail <input type="text" class="form-input" name="thumbnail" value = "${p.thumbnail}"/>
                            </div>
                          

                             <label>Enter Description</label>
                            <div class="form-group col-md-12">

                                <textarea name="description" class="form-control " id="editor1">${p.description}</textarea>
                            </div>
                            <div class="form-group">
                                Enter Created at  <input type="date" class="form-input" name="created_at"  value = "${p.created_at}"/>
                            </div>

                            <div class="form-group">
                                Enter Updated at  <input type="date" class="form-input" name="updated_at" value = "${p.updated_at}"/>
                            </div>

                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="UPDATE"/>
                            </div>
                        </form>

                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
           <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script src="ckeditor/ckeditor.js"></script>
      <script src="ckfinder/ckfinder.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
    <script> 
       var editor = CKEDITOR.replace('editor1');
       CKFinder.setupCKEditor(editor,'ckfinder');
    </script>
</html>
