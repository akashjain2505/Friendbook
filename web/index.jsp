<%-- 
    Document   : index
    Created on : May 8, 2020, 7:21:16 AM
    Author     : VSMPRS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FriendBook</title>
       <link href="mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <style>
           .banner{
          clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0 0, 23% 0);
           }
       </style>
    </head>
    
    <body>
        <%@include file="navbar.jsp"%>
        
        <div class="container-fluid p-0 m-0" >
            <div class="jumbotron banner " style="background: silver">
                <div class="container">
                    
                    <h3 class="display-3 " style="color: darkblue; font-weight: 500 "><span class="	fa fa-facebook-square"></span>FRIENDBOOK</h3>
                    <h3 >luck.com</h3>
                    <p>Connecting people</p>
                        
                   
                    
                </div>
            </div>
        </div>
        
       
        <div class="container">
            <div class="row">
        <div class="col-md-4">
            <img src="image/image1.jpg" height="200px" width="350px">
        </div>
        <div class="container-fluid col-md-4 offset-md-4">
            <img src="image/image3.jpg" height="200px" width="350px">
        </div>
            </div>
        </div>


    
        
    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
    
   
  
</html>
