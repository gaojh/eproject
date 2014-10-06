<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<script type="text/javascript">
	$(function(){
		$('form').validation();
		
		$("#login").bind("click",function(){
			dologin();
		});
	});
	
	function dologin(){
		if ($("form").valid(this,"error!")==false){
			return false;
		}
		
		var arg1 = $("#username").val();
		var arg2 = $("#password").val();
		
		var args = {
			"loginuser" : arg1,
			"password" : arg2
		};
		
		$.post("${ctx}/user/login", args, function(result) {
			var data = eval("(" + result + ")");
			if (data.code == 1) {
				window.location.href = "${ctx}/index";
			} else if(data.code == 0){
				alert(data.message);
				return false;
			}else{
				alert("登录失败");
				return false;
			}
		});
	}
</script>

<style type="text/css">
.span-title {
	color: #4cae4c;
	padding-bottom: 30px;
}

.side {
	padding-left: 20px;
}

.padding {
	padding-top: 30px;
	padding-bottom: 53px;
}

.container-padding {
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
</head>

<body>
	<div class="container container-padding">
		<div class="col-md-6 enong-v-line side">
			<div class="row span-title">
				<h1>已是易侬会员</h1>
			</div>
			<div class="row">
				<div class="col-sm-8">
					<form id="loginForm" method="post" class="form" role="form">
						<div class="form-group">
							<label for="username"> 手机/邮箱： </label> <input type="email" class="form-control" id="username" name="username" placeholder="手机/邮箱" check-type="required" required-message="请输入登录邮箱">
						</div>

						<div class="form-group">
							<label for="password"> 密码： </label> <input type="password" class="form-control" id="password" name="password" placeholder="密码" check-type="required" required-message="请输入登录密码">
						</div>

						<div class="form-group">
							<button id="login" class="btn btn-success btn-block" type="button">登录</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-6 side">
			<div class="row span-title">
				<h1>还不是易侬会员</h1>
			</div>
			<div class="row">
				<div class="col-sm-8">
					<ul class="padding">
						<li>轻松预订积分回赠！</li>
						<li>享受易侬完善、体贴的订购服务！</li>
						<li>详尽的果蔬品类，让您足不出行全面掌握！</li>
					</ul>
					
					<a href="${ctx}/register" class="btn btn-success btn-block">立即注册</a>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
