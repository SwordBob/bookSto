<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>index</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
   
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap-3.2.0/dist/css/bootstrap.min.css"/>
    <script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/angular.js/1.3.15/angular.min.js"></script>
  </head>
  <style>
  	.com{
  		margin:20px;
  		height:240px;
  		overflow:hidden;
  	}
  	.padding20{
  		padding:20px;
  	}
  	#index{
  		margin-top:100px;
  	}
  </style>
  <body ng-app="app">
  	<nav class="navbar navbar-default navbar-fixed-top">
	  <div class="container">
  		<div class="row">
			<ul class="nav navbar-nav">
				<li>
					<c:if test="${name!=null}">
						<a href="###">
							欢迎${name}角色${role }
						</a>
					</c:if>
				</li>
	          
	         </ul>
  		</div>
	  </div>
	</nav>
	
  	<div class="container">
  		<div id="index" class="row" ng-controller="index">
			<div class="panel panel-default">
			  <div class="panel-body">
			    <div class="thumbnail pull-left com" ng-repeat="com in coms">
			      <img ng-src="{{com.img}}"  width="40" height="40">
			      <div class="caption">
			        <h3>{{com.bookname}}</h3>
			        <p>{{com.author}}</p>
			        <p>
			        	<a href="#" class="btn btn-primary" role="button" ng-click="addToCart(com.id)">添加书品</a>
			        </p>
			        <p>
				        <button class="btn btn-default" ng-click="showDetail(com)">
	       					查看详细
	       				</button>
       				</p>
			      </div>
			    </div>
			     </div>
			    <div class="container">
  		<div class="row">
		  	<form>
			  <div class="form-group">
			    <label for="bookname">书名</label>
			    <input type="text" class="form-control" id="bookname" placeholder="bookname">
			  </div>
			  <div class="form-group">
			    <label for="author">作者</label>
			    <input type="password" class="form-control" id="author" placeholder="author">
			  </div>
			  <a href="###" class="btn btn-primary" id="submit" class="btn btn-default">添加图书</a>
			  			     
			</form>
  		</div>
  	</div>
  	
			 
			</div>
		  </div>
	  		
  		</div>
  	</div>
  	
	<!-- Modal --start  -->
	<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" ng-controller="detail">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">
	        	产品信息
	        </h4>
	      </div>
	      <div class="modal-body">
	      		<p>产品名字{{com.name}}</p>
				<p>产品描述{{com.depict}}</p>
				<p>产品公司{{com.manufacturer}}</p>
				<p>æ产品金额{{com.price}}</p>
				<p>产品缩略图<img ng-src={{com.img}} width=50 height=50 /></p>
				<div class="commentBody">
					<div ng-repeat="c in comments">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						{{c.userName}}
						<div class="alert" role="alert">
							{{c.comment}}
						</div>
					</div>
					<form>
						<label for="text"></label>
						<input type="text" name="text" id="text" placehoder="评论内容" ng-model="comment"/>
						<button id="submit" class="btn btn-success" ng-click="appendComment(com.id)">评论</button>
					</form>
				</div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal ---end  -->
	
  	<script>
  		var userId = "${id}";
  		var app = angular.module("app", []);
  		
  		app.controller("index", function( $scope ) {
  			$scope.coms = [];
  			$scope.addToCart = function( comId ) {
  				ajaxModule.addOrder(userId, comId);
  			};
			$scope.showDetail = function( com ) {
	
				$("#detail").modal('show');
				$("#detail").scope().com = com;
				ajaxModule.getCommentById(com.id, function(res) {
					$("#detail").scope().comments = res;
					$("#detail").scope().$apply();
				});
				
			};
  		});
  		
	  	app.controller("detail",function($scope) {
	  		$scope.comments = [];
	  		
	  		//添加评论
			$scope.appendComment = function( commodityID ) {
				if($scope.comment) {
					ajaxModule.addComment( commodityID, $scope.comment , function() {
						$scope.comments.push({
							userName : "${name}",
							commment : $scope.comment
						});
						$scope.$apply();
					});
				};
			};
	  	});
	  	
  		var ajaxModule = {
  			getAllCom : function( cb ) {
  				$.post("bookStore/getBooks.do",cb);
  			},
  			addOrder : function(userId, commodityIds ,cb) {
  				$.post("addOrder.do",{userId:userId, commodityIds:commodityIds, commodityCounts:"1"}, function(res) {
  					console.log("addOrder.do response is "+ res);
					if(res) {
						alert("添加成功");
					}else{
						alert("添加失败");
					};
  				});
  			},
			getCommentById : function(id, cb) {
				$.post("admin/getCommentById.do",{commodityId:id}, cb);
			},
			addComment : function(commodityID, comment ,cb) {
				$.post("./addComment.do", {userId : '${id}', userName : '${name}',commodityID : commodityID, comment: comment}, function( res ) {
					if(res) {
						cb&&cb();
					}else{
						alert("评论添加失败");
					}
				});
			}
  		};
	  	
  		function index() {
  			ajaxModule.getAllCom(function( res ) {
  				$("#index").scope().coms = res;
  				$("#index").scope().$apply();
  			});
  		};
  		$("#submit").click(function() {
    		$.post("bookStore/addBook.do", {bookname : $("#bookname").val(), author : $("#author").val() }, function(res) {
    			if( res ) {
    				location.href = "index.jsp";
    			}else{
    				alert("登陆失败");
    			};
    		});
    	});
  		$(function() {
  			index();
  		});
  		
  	</script>
  </body>
</html>
