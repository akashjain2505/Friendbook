

<%@page import="com.luck.dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "error.jsp" %>
<%@page import="com.luck.dto.Message"%>

<%
User u1=(User)session.getAttribute("loginuser");
if(u1!=null){
response.sendRedirect("home.jsp");
}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
          
          <main class="d-flex align-items-center banner" style="height: 80vh ; background: silver">
              <div class="container">
                  <div class="row">
                      <div class="col-md-4 offset-md-4">
                          <div class="card">
                              <div class="card-header text-white " style="text-align: center; background: slategrey;" >
                                  <span class="			fa fa-user-circle fa-3x"></span>
                                  <p>Login Here </p>
                                  
                              </div>
                              
                              
                                   <%
               Message m =(Message)session.getAttribute("msg2");
              
               if(m!=null)
               {
               %>
               <div class="container text-danger">
                   <span><%=m.getContent() %></span>
               </div>
                                  
                                  <%
                    session.removeAttribute("msg2");
               }
            %>       
             <%
               Message m3 =(Message)session.getAttribute("msg3");
              
               if(m3!=null)
               {
               %>
               <div class="container text-success">
                   <span><%=m3.getContent() %></span>
               </div>
                                  
                                  <%
                    session.removeAttribute("msg3");
               }
            %>       
              
                              <div class="card-body">
                                  <form action="Login" method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  
  <button type="submit" class="btn btn-primary">Login</button>
</form>
                                  
                              </div>
                              
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

    </body>
</html>
