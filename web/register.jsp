<%-- 
    Document   : register
    Created on : May 8, 2020, 9:57:19 AM
    Author     : VSMPRS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "error.jsp" %>
<%@page import="com.luck.dto.Message"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp Page</title>
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
          
          
          <main class="banner" style="background: silver; height: 130vh"  >
              <div class="container "  >
                  
                      <div class="col-md-6 offset-md-3" >
                          <div class="card  "  >
                              <div class="card-header text-white " style="text-align: center; background: slategrey;" >
                                  <span class="			fa fa-user-plus fa-3x"></span>
                                  <p>Register Here </p>
                                  
                   
                                  
                              </div>
                              
                               <%
               Message m =(Message)session.getAttribute("msg");
              
               if(m!=null)
               {
               %>
               <div class="container text-danger">
                   <span><%=m.getContent() %></span>
               </div>
                                  
                                  <%
                    session.removeAttribute("msg");
               }
            %>       
                               <%
               Message m1 =(Message)session.getAttribute("msg1");
              
               if(m1!=null)
               {
               %>
               <div class="container text-danger">
                   <span><%=m1.getContent() %></span>
               </div>
                                  
                                  <%
                    session.removeAttribute("msg1");
               }
            %>     
                              
                              <div class="card-body">
                                  <form id="reg-form" action="Register" method="POST" enctype="multipart/form-data">
                                      <div class="form-group">
    <label for="exampleInputEmail1">User Name</label>
    <input type="text" required class="form-control" name="name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">

  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" required name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" required name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
                                      <div class="form-group">
    <label for="exampleInputEmail1">Mobile number</label>
    <input type="number" required name="mobile" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Mobile Number">
  
  </div>
                                      <div class="form-group">
    <label for="exampleInputEmail1">Profile pic</label>
    <input type="file" class="form-control" name="profile_pic"  placeholder="Choose File">
   
  </div>
  <div class="form-check">
      <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Terms and Conditions</label>
  </div>
                                      <div class="container " style="text-align: center">
                                          <span class="fa fa-refresh fa-3x fa-spin"></span>
                                      <br>
                                      <button type="submit" class="btn btn-primary">Submit</button>
                                         </div>
                                  </form>
                                  
                              </div>
                              
                          </div>
                          
                      </div>
                      
                  </div>
                  
              
              
          </main>
        
        
         <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




    </body>
</html>
