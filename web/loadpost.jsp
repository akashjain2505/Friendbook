<%@page import="com.luck.dao.LikeDaO"%>
<%@page import="com.luck.dto.User"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.luck.dao.UserDao"%>
<%@page import="com.luck.dto.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.luck.dao.DBConnection"%>
<%@page import="com.luck.dao.PostDao"%>
 <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v11.0" nonce="xm6jlerb"></script>
<div class="row ">
<%
    User uu = (User)session.getAttribute("loginuser");
     LikeDaO ld = new LikeDaO(); 
PostDao dao = new PostDao();
UserDao userd = new UserDao();

int id = Integer.parseInt(request.getParameter("id"));
List<Post> posts = null;
if(id==0){
 posts = dao.getAllPosts();
}else{
posts = dao.getMyPost(id);
}
for(Post p : posts){
%>
<div class="col-md-12 mt-3">
    <div class="card ">
        <div class="card-header text-white"style="background: slategray" >
             <img src="picsss/<%=userd.getUserByID(p.getSender()).getProfile_pic() %>" style="border-radius: 50% ;height: 40px ; width: 40px" >
            <b><%=userd.getUserByID(p.getSender()).getName() %> </b>     
        </div>
        <div class="card-body">
            <img class="card-img-top" src="posts/<%=p.getPic() %>" alt="Card image cap">
           <h5 class="card-text"><%=p.getCaption() %></h5>
        </div>
        <div class="card-footer">
            <% boolean b =ld.isLike(uu.getUser_id(), p.getPost_id());
            if(!b){
            %>
            
            <a   onclick="dolike(<%=uu.getUser_id() %>,<%=p.getPost_id() %>)"   ><span  id="likeid<%=p.getPost_id() %>" class="btn btn-danger fa fa-heart"><%=ld.countLike(p.getPost_id()) %></span></a>
            <%}
else{
            %>
             <a    onclick="dolike(<%=uu.getUser_id() %>,<%=p.getPost_id() %>)"   ><span  id="likeid<%=p.getPost_id() %>" class="btn btn-outline-success fa fa-heart"><%=ld.countLike(p.getPost_id()) %></span></a>
            <%
}
%>
             <a ><span class="btn btn-primary fa fa-comment"></span></a>
             <div style="float: right">
                 <b><%=p.getDate() %></b>
             </div>
        </div>
             <div class="card-footer">
                 <div class="fb-comments" data-href="http://localhost:9494/home.jsp" data-width="" data-numposts="5"></div>
             </div>
    </div>
</div>
            <br>
<%
}

%>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    function dolike(sender,post){
        console.log(post +","+ sender);
     
        const d={
            sender: sender,
            post: post
        };
        
        
        $.ajax({
            url:"LikeServlet",
            data: d,
            success: function (data, textStatus, jqXHR) {
                 
                 if($("#likeid"+post).hasClass("btn-danger")){
             
                   let c = $("#likeid"+post).html();
                    c++;
                    $("#likeid"+post).html(c);
                  
                    $("#likeid"+post).removeClass("btn-danger");
                     $("#likeid"+post).addClass("btn-outline-success");
                    
                     
                }else{
                    
                    let c = $("#likeid"+post).html();
                   c--;
                    $("#likeid"+post).html(c);
                   
                      $("#likeid"+post).removeClass("btn-outline-success");
                     $("#likeid"+post).addClass("btn-danger");
                    
                }
                    }, 
            error: function (jqXHR, textStatus, errorThrown) {
                        
                    }        
        });
    }
</script>




</div>
