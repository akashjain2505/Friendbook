<%-- 
    Document   : error
    Created on : May 9, 2020, 9:01:52 PM
    Author     : VSMPRS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage = "true" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
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
       
        <div class="container-fluid m-0 p-0 text-center banner" style="background: silver ; height: 90vh">
            <img src="image/error.png" height="300px" width="600px" >
            
            <h3 class="display-3">SORRY! Something Went Wrong</h3>  
            <span><%=exception %></span>
            
        </div>
    </body>
</html>
