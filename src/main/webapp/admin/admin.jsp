<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>admin.html</title>

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" type="text/css" href="../css/bootstrap-3.2.0/dist/css/bootstrap.min.css"/>
    <script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/angular.js/1.3.15/angular.min.js"></script>
    <style>
        .bs-example {
            position: relative;
            padding: 45px 15px 15px;
            margin: 0 -15px 15px;
            border-color: #E5E5E5 #EEE #EEE;
            border-style: solid;
            border-width: 1px 0;
            -webkit-box-shadow: inset 0 3px 6px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 3px 6px rgba(0, 0, 0, 0.05);
        }
    </style>
</head>

<body>
    <div class="container" ng-app="app">
        <div class="row">
            <h2>
              	<a href="../index.do">首页</a>
            </h2>
        </div>
        <div class="row">
            <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                <ul id="myTabs" class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a id="tab0" href="#orderform" id="home-tab" role="tab" data-toggle="tab" aria-controls="orderform" aria-expanded="true">所有订单</a>
                    </li>
                    <li role="presentation">
                        <a id="tab1" href="#types" id="types-tab" role="tab" data-toggle="tab" aria-controls="types" aria-expanded="true">商品类型编辑</a>
                    </li>
                    <li role="presentation">
                        <a id="tab2" href="#pro" role="tab" id="pro-tab" data-toggle="tab" aria-controls="pro">商品编辑</a>
                    </li>
                    <li role="presentation">
                        <a id="tab3" href="#about" role="tab" id="about-tab" data-toggle="tab" aria-controls="about">所有评论</a>
                    </li>
                </ul>

                <div id="myTabContent" class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active orderform" id="orderform" aria-labelledby="home-tab"   ng-controller="orderform">
                    	<table class="table table-hover table-bordered">
					      <thead>
					        <tr>
					          <th>订单id</th>
					          <th>地址</th>
					          <th>总金额</th>
					          <th>手机</th>
					          <th>详细信息</th>
					        </tr>
					      </thead>
					      <tbody>
					        <tr ng-repeat="item in orderforms">
					          <th scope="row">{{item.id}}</th>
					          <td>{{item.address}}</td>
					          <td>{{item.totalPrice}}</td>
					          <td>{{item.phone}}</td>
					          <th>
					          	<a ng-click="showInfo(item.orderlist)" href="###">
					          	  查看订单详细信息
					          	</a>
					          </th>
					        </tr>
					        <tr>
					      </tbody>
					    </table>
				        <div class="row">
				        	<ul class="list-group">
				        		<li  class="list-group-item" ng-repeat="com in commoditys">
				        			<p>第{{$index+1}}条: 商品id为{{com.commodityId}}, 的总数是为{{com.commodityCount}}</p>
				        			<div commodity-directive id="{{com.commodityId}}">
				        				<p>商品名字{{res.name}}</p>
				        				<p>商品描述{{res.depict}}</p>
				        				<p>商品厂商{{res.manufacturer}}</p>
				        				<p>商品价格{{res.price}}</p>
				        				<p>商品logo<img ng-src={{res.img}}  width=50 height=50/></p>
				        			</div>
				        		</li>
				        	</ul>
				        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane fade types" id="types" aria-labelledby="type-tab" ng-controller="types">
                        <div class="row">
                        	<ul class="list-group">
                        		<li  class="list-group-item">类型</li>
                        		<li  class="list-group-item" ng-repeat="type in types">
                        			<div >
                        				<p>
                        					{{type.name}}
                        				 	<button class="btn btn-default pull-right" ng-click="delType( type.id )">删除该类型</button>
                        				</p>
                        			</div>
                        		</li>
                        	</ul>
                        </div>
                        <div class="row">
                        	<input placeholder="新类型名字" id="new_type" ng-model="new_type">
                        	<button class="btn btn-default" ng-click="new_type_fn()">创建新类型</button>
                        </div>
                    </div>
                    <div id="pro" role="tabpanel" class="tab-pane fade" id="pro" aria-labelledby="pro-tab" ng-controller="pros">
                   		<br>
                    	<p>
	                    	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
							  	创建新商品
							</button>
                    	</p>
                        <ul class="list-group">
                        	<li class="list-group-item" ng-repeat="com in coms">
		        				<p>商品名{{com.name}}</p>
		        				<p>商品描述{{com.depict}}</p>
		        				<p>商品公司{{com.manufacturer}}</p>
		        				<p>商品价格{{com.price}}</p>
		        				<p>商品logo<img ng-src={{com.img}} width=50 height=50 /></p>
		        				<p>
		        					<button class="btn btn-default" ng-click="removePro(com.id)">
		        						删除该商品
		        					</button>
		        				</p>
                        	</li>
                        </ul>
                    </div>
                    <div  role="tabpanel" class="comments tab-pane fade" id="about" aria-labelledby="about-tab" ng-controller="comments">
                        <ul class="list-group">
                        	<li class="list-group-item" ng-repeat="comment in comments">
                        		<p>评论列表:</p>
								<div commodity-directive id="{{comment.commodityId}}">
			        				<p>商品名字{{res.name}}</p>
			        				<p>商品描述{{res.depict}}</p>
			        			</div>
			        			<div>
			        				<strong>{{comment.userName}} <b>说</b></strong>
			        				<span>{{comment.comment}}</span>
			        			</div>
                        	</li>
                        </ul>
                </div>
            </div>
        </div>
    </div>
    
    
	<!-- Modal start -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">创建商品</h4>
	      </div>
	      <div class="modal-body">
			<form>
			  <div class="form-group">
			    <label for="name">name</label>
			    <input type=text class="form-control" id="name" placeholder="商品名">
			  </div>
			  <div class="form-group">
			    <label for="depict">depict</label>
			    <input type=text class="form-control" id="depict" placeholder="商品描述">
			  </div>
			  <div class="form-group">
			    <label for="price">price</label>
			    <input type=text class="form-control" id="price" placeholder="商品价格">
			  </div>
			  <div class="form-group">
			    <label for="amount">amount</label>
			    <input type="text" class="form-control" id="amount" placeholder="商品个数">
			  </div>
			  <div class="form-group">
			    <label for="manufacturer">manufacturer</label>
			    <input type="text" class="form-control" id="manufacturer"" placeholder="商品厂商">
			  </div>
			  <div class="form-group">
			    <label for="img">img</label>
			    <input type="text" class="form-control" id="img" readonly=true placeholder="图片路径">
			    <input type="file" value=上传文件 id="upload">
			  </div>
			  <select id="select" ng-controller="select">
			  	<option ng-repeat="type in types" value="{{type.name}}">
			  		{{type.name}}
			  	</option>
			  </select>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button id="submit"  type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal end-->
	
    <script>
        var app = angular.module("app", []);
        app.directive("commodityDirective", function() {
        	return {
        		restrict : "EA",
        		scope : true,
	        	link : function( $scope ,$el, $iattrs) {
	        		$.post("../getComById.do", {id:$iattrs.id},function( res ) {
		        		$scope.res = res[0];
		        		$scope.$apply();
	        		});
	        	}
        	}
        });
        

        app.controller("orderform", function($scope) {
        
        	$scope.orderforms = [];
        	$scope.commoditys = [];
        	$scope.showInfo = function( info ) {
        		$scope.commoditys = JSON.parse(info);
        	};
        	
        });

        $("#tab0").click(function() {
            ajaxModule.getFormAllList(".orderform");
        });
        
        app.controller("types",function($scope) {
        	$scope.types = [];
        	$scope.new_type = "";
        	$scope.delType = function(id) {
        		ajaxModule.delType(id, function(res) {
        			if(res === true) {
        				$("#tab1").click();
        			}else{
        				alert("删除失败");
        			};
        		});
        	};
        	$scope.new_type_fn = function() {
        		ajaxModule.addType($scope.new_type, function(res) {
        			if(res === true) {
        				$("#tab1").click();
        			}else{
        				alert("创建失败");
        			};
        		});
        	};
        });
		$("#tab1").click(function() {
			ajaxModule.getTypes(".types");
		});
		
		

		app.controller("pros", function($scope) {
			$scope.coms = [];
			$scope.removePro = function(id) {
				ajaxModule.delPro(id, function(res) {
					if(res) {
						$("#tab2").click();
					}else{
        				alert("删除成功");
					};
				});
			};
		});
		app.controller("select", function($scope) {
			$scope.types = [];
		})
		
		$("#tab2").click(function() {
			ajaxModule.getAllCom("#pro");
			ajaxModule.getTypes("#select");
		});
		
        $("#submit").click(function() {
        	ajaxModule.addPro({
        		name:$("#name").val(),
        		depict:$("#depict").val(),
        		price:$("#price").val(),
        		amount:$("#amount").val(),
        		manufacturer:$("#manufacturer").val(),
        		img:$("#img").val(),
        		type:$("#select").val()
        	},function(res) {
        		if(res) {
        			$('#myModal').modal('hide');
        			$("#tab2").click();
        		}else{
        			alert("添加成功");
        			$('#myModal').modal('hide')
        		};	
        	});
        });
        
        app.controller("comments", function($scope) {
        	$scope.comments = [];
        });
        $("#tab3").click(function() {
        	ajaxModule.getComments(function( res ) {
        		$(".comments").scope().comments = res;
        		$(".comments").scope().$apply();
        	})
        });
        
        $("#upload").change(function(ev) {
        	formData = new FormData();
        	formData.append("name", ev.target.files[0]);
			var oReq = new XMLHttpRequest();
			oReq.open("POST", "../upload.do");
			oReq.onreadystatechange = function() {
				if( oReq.readyState === 4 ) {
					$("#img").val(  oReq.responseText  );
				};
			};
			oReq.send(formData);
        	
        });
        
        $(function() {
        	$("#tab0").click();
        });
        
        var ajaxModule = function() {
            return {
                getFormAllList : function( el ) {
                    $.post("../getFormAllList.do", function(res) {
                        $(el).scope().orderforms = res;
                        $(el).scope().$apply();
                    })
                },
                getTypes : function(el) {
                	$.post("getTypes.do", function(res) {
                		$(el).scope().types = res;
                		$(el).scope().$apply();
                	})
                },
                addType : function( type ,callback) {
                	$.post("addType.do", {type:type}, function(res) {
                		callback(res);
                	});
                },
                delType : function( id ,callback) {
                	$.post("delType.do", {id:id}, function(res) {
                		callback(res);
                	});
                },
                getAllCom : function(el) {
                	$.post("./getAllCom.do", function( res ) {
                		$(el).scope().coms = res;
                		$(el).scope().$apply();
                	});
                },
                delPro : function(id ,callback) {
                       	$.post("./delPro.do",{id:id} , function( res ) {
                		callback(res);
                	});
                	
                },
                addPro : function(json, callback) {
		            $.post("./addPro.do",json, function(res) {
		        		callback(res);
		        	});
                },
                getComments : function( callback ) {
                	$.post("./getComments.do", function(res) {
                		callback(res);
                	});
                },
                getCommentById : function( id, callback ) {
	                $.post("./getCommentById.do",{commodityId:id}, callback);
                }
            };
        }();
    </script>
</body>
</html>
