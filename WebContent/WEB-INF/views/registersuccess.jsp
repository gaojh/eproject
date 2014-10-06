<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>注册成功</title>
<style type="text/css">
.border-line {
	border: 2px solid #f0ad4e;
	padding-top: 30px;
	padding-bottom: 30px;
}

.color-div {
	background-color: #FFECEC;
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>
</head>

<body>
	<div class="row enong-crumb">
		<span>首页﹥注册﹥注册成功</span>
	</div>
	<div class="row rtitle"></div>
	<div class="col-md-10 col-md-offset-1 border-line">
		<div>
			<span>恭喜您，注册成功！ </span><br /> <span>蛇年惊喜，恭喜您获得1000元易侬消费券和1000积分！</span><br /> <span><a href="#">现在去购买>></a></span>
		</div>
		<br /> <br />
		<div class="color-div">
			<span class="glyphicon glyphicon-envelope"><a href="${ctx}/user/sendverifymail">立即验证邮箱>></a>进行邮箱验证，可获赠100元伊侬消费券！</span><br /> <span>进行邮箱验证，帮助您快速找回密码，并及时了解订单处理/账户等信息！</span>
		</div>
	</div>

</body>
</html>
