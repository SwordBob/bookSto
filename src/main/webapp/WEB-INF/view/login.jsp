<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>login.html</title>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
 	<script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  </head>
  <body>
  	<div class="container">
  		<div class="row">
		  	<form>
			  <div class="form-group">
			    <label for="user">Username</label>
			    <input type="text" class="form-control" id="user" placeholder="user">
			  </div>
			  <div class="form-group">
			    <label for="password">Password </label>
			    <input type="password" class="form-control" id="password" placeholder="password">
			  </div>
		 	  <a href="###" id="submit" class="btn btn-default">Submit</a> 
			  <!-- <button type="submit" id="submit" class="btn btn-default">Submit</button> -->
			</form>
			
  		</div>
  	</div>
  	
        <script>
     	$("#submit").click(function() {
    		$.post("./getBook",function(res) {
    			if(res) {
    				alert(res[0].author);
    				alert("登陆成功");
    			}else{
    				alert("登陆失败");
    			};
    		});
    	});
        </script>
        
  </body>
</html>
