<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>login.html</title>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-3.2.0/dist/css/bootstrap.min.css" />
    <script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  </head>
  <body>
  	<div class="container">
  		<div class="row">
		  	<form action="user/login.do" method="post">
			  <div class="form-group">
			    <label for="user">user</label>
			    <input type="text" class="form-control" id="user" placeholder="user">
			  </div>
			  <div class="form-group">
			    <label for="password">Password</label>
			    <input type="password" class="form-control" id="password" placeholder="password">
			  </div>
			  <a href="###" id="submit" class="btn btn-default">Submit</a>
			</form>
  		</div>
  	</div>
  	
        <script>
        	$("#submit").click(function() {
        		/* $.post("user/login.do", {username : $("#user").val(), password : $("#password").val() }, function(res) {
        			if( res ) {
        				//location.href = "index.jsp";
        			}else{
        				alert("登陆失败");
        			}; */
        			$("form").submit();

        	});
        	
        </script>
        
  </body>
</html>
