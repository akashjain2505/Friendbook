<%-- 
    Document   : home.jsp
    Created on : May 10, 2020, 2:34:15 PM
    Author     : VSMPRS
--%>
<%@page import="com.luck.dto.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.luck.dto.User"%>
<%@page errorPage = "error.jsp" %>
<%
User u = (User)session.getAttribute("loginuser");
if(u == null)
{
response.sendRedirect("login.jsp");
}

%>




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
        
        
        <!-- nav-->
        <nav class="navbar navbar-expand-lg navbar-dark background-primary">
    <a class="navbar-brand 	" href="index.jsp"><span class="	fa fa-facebook-square"></span>Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link 	" href="#"><span class="	 fa fa-comment-o"></span>About</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link " href="#"><span class="	fa fa-phone"></span>Contact</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link " href="#" data-toggle="modal" data-target="#do-post"><span class="	fa fa-save"></span>Do Post</a>
      </li>
      
    </ul>
      <ul class="navbar-nav mr-right">
          <li class="nav-item active">
        <a class="nav-link 	" href="#" data-toggle="modal" data-target="#editss"><span class="	 	fa fa-user"><%=u.getName() %></span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link 	" href="Logout"><span class="	 	fa fa-user-times"></span>Log Out</a>
      </li>
      </ul>
  </div>
</nav>
      
      <main>
          <div class="container-fluid">
              <div class="row">
                  <div class="col-md-2">
                        <div class="list-group" >
                            <a href="home.jsp" onclick="show(0,this)" class=" c-link list-group-item list-group-item-dark active ">
    All Post
  </a>
                            <a  onclick="show(<%=u.getUser_id() %>,this)" class=" c-link list-group-item list-group-item-dark">My Post</a>
  <a href="#"data-toggle="modal" data-target="#profile" class=" c-link list-group-item list-group-item-dark">Change Profile</a>
  <a href="#!"data-toggle="modal" data-target="#changemail" class="c-link list-group-item list-group-item-dark">Change Email</a>
  
  
</div>
                  </div>
                  <div class="col-md-8 ">
                       <div class="container text-center" id="loader">
                           <i class="fa fa-refresh fa-4x fa-spin"></i>
                       </div>
                      <div class="container" id="post-container">
                          
                       </div>
                  </div>
                   <div class="col-md-2">
                      
                  </div>
              </div>
          </div>
          
      </main>
      
      
      
      
      
    
      
      
      
      
      <!-- Button trigger modal -->


<!-- Modal edit -->
<div class="container" >
<div class="modal fade" id="editss"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header background-primary " >
        <h5 class="modal-title " style="text-align: center" id="exampleModalLabel">MY PROFILE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
          <img src="picsss/<%=u.getProfile_pic() %>" style="border-radius: 50% ;height: 80px ; width: 80px" >
          <br>
         
          <h5 class="modal-title " style="text-align: center" id="exampleModalLabel"><%=u.getName() %></h5>
          <div class="container" id="details">
          <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Email</td>
      <td><%=u.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Mobile</td>
      <td><%=u.getMobile() %></td>
    </tr>
     
    
    </tbody>
</table>
          </div>
      
      <div class="container " id="edit" style="display: none">
          <h5>Edit Here</h5>
          
          <form  id="update" action="Update" method="POST" enctype="multipart/form-data" >
                 <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Name</td>
      <td> <input type="text" name="name" value="<%=u.getName() %>"></td>
      
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Mobile</td>
      <td> <input type="number" name="mobile" value="<%=u.getMobile() %>"></td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Password</td>
      <td> <input type="password" name="password" value="<%=u.getPassword() %>" ></td>
    </tr>
    
    
    </tbody>
</table>
     <button type="submit" class="btn btn-primary">save</button>
          </form>
          
      </div>
          
      </div>
    
        
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
</div>
    <!-- Modal change profile -->
    
                        <div class="container" >
<div class="modal fade" id="profile"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header background-primary " >
        <h5 class="modal-title " style="text-align: center" id="exampleModalLabel">Change Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
          <img src="picsss/<%=u.getProfile_pic() %>" style="border-radius: 50% ;height: 80px ; width: 80px" >
          <br>
          <form id="proc" action="Change" method="POST" enctype="multipart/form-data" >
              <table class="table">
  
  <tbody>
   
      <tr>
      <th scope="row"></th>
      <td>Select Image</td>
      <td><input type="file" name="profile_pic" required></td>
    </tr>
     
    
    </tbody>
</table>
              
              <button type="submit" class="btn-primary">Update</button>
          </form>
     
      </div>
     
    </div>
  </div>
</div>
</div>
    
    <!-- Modal dopost -->
    <div class="container" >
<div class="modal fade" id="do-post"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header background-primary " >
        <h5 class="modal-title " style="text-align: center" id="exampleModalLabel">DO POST</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
          <form  id="do" action="Do_post" method="POST" enctype="multipart/form-data" >
              <table class="table">
  
  <tbody>
    
    <tr>
      <th scope="row"></th>
      <td>Caption</td>
      <td><input type="text" name="caption" required></td>
    </tr>
      <tr>
      <th scope="row"></th>
      <td>Select Image</td>
      <td><input type="file" name="pic" required></td>
    </tr>
     
    
    </tbody>
</table>
              
              <button  type="submit" class="btn-primary">POST</button>
          </form>
     
      </div>
     
    </div>
  </div>
</div>
</div>
    
    
                         <div class="container" >
<div class="modal fade" id="changemail"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header background-primary " >
        <h5 class="modal-title " style="text-align: center" id="exampleModalLabel">Change Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
          <img src="picsss/<%=u.getProfile_pic() %>" style="border-radius: 50% ;height: 80px ; width: 80px" >
          <br>
          <form  id="cemail" action="Cemail" method="POST"  >
              <table class="table">
  
  <tbody>
   
      <tr>
      <th scope="row"></th>
      <td>Change Email</td>
      <td><input type="email" name="email" required></td>
    </tr>
     
    
    </tbody>
</table>
              
              <button class="btn-primary">Update</button>
          </form>
     
      </div>
     
    </div>
  </div>
</div>
</div>
    
        
        
         <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        let status = false;
        
       $("#edit-button").click(function(){
           if(status == false)
           {
               $("#details").hide();
               $("#edit").show();
               status = true;
               $(this).text("Back")
           }
           else
               {
               $("#details").show();
               $("#edit").hide();
               status = false;
               $(this).text("Edit")
           }
           
           
       }); 
    });
    
</script>

<script>
    
    function show(id,temp){
         $('#loader').show();
                        $('#post-container').hide();
                        $(".c-link").removeClass('active');
         $.ajax({
            url : "loadpost.jsp",
            data: {id: id},
            success: function (data, textStatus, jqXHR) {
                        
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        console.log("error");
                    }
        })
    }
    
    $(document).ready(function(e){
       let ref = $('.c-link')[0]
      show(0,ref);
    })
</script>

<script>
    $(document).ready(function(){
        $("#proc").on("submit",function(event){
            let form = new FormData(this);
            event.preventDefault();
            $.ajax({
                url:"Change",
                data:form,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                       
                        swal("GOOD JOB!", "Updated Successfully", "success");
                        window.location = "home.jsp";
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Sorry!", "Try Again!", "error");
                    },
                    processData: false,
                    contentType: false
                
            })
        })
    })
    
</script>

<script>
    $(document).ready(function(){
        $("#update").on("submit",function(event){
            let form = new FormData(this);
            event.preventDefault();
            $.ajax({
                url:"Update",
                data:form,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                       
                        swal("GOOD JOB!", "Updated Successfully", "success");
                        window.location = "home.jsp";
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Sorry!", "Try Again!", "error");
                    },
                    processData: false,
                    contentType: false
                
            })
        })
    })
    
</script>

<script>
    $(document).ready(function(){
        $("#cemail").on("submit",function(event){
            let form = new FormData(this);
            event.preventDefault();
            $.ajax({
                url:"Cemail",
                data:form,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                       
                        swal("GOOD JOB!", "Updated Successfully", "success");
                        window.location = "home.jsp";
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Sorry!", "Try Again!", "error");
                    },
                    processData: false,
                    contentType: false
                
            })
        })
    })
    
</script>


<script>
    $(document).ready(function(e){
        $("#do").on("submit",function(event){
            let form = new FormData(this);
            event.preventDefault();
            $.ajax({
                url:"Do_post",
                data:form,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                      
                        swal("GOOD JOB!", "Post Successfully", "success");
                        
                       window.location = "home.jsp";
                    
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Sorry!", "Try Again!", "error");
                    },
                    processData: false,
                    contentType: false
                
            })
        })
    })
    
</script>


    </body>
</html>
