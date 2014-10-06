<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>邮箱验证</title>
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
		<span>首页﹥注册﹥注册成功﹥邮箱验证</span>
	</div>
	<div class="row rtitle"></div>
	<div class="col-md-10 col-md-offset-1 border-line">
		<div>
			<span style="font-weight: bold;">已发送邮件至:邮箱(显示注册时的邮箱)</span><br /> <span>验证邮件24小时内有效，请尽快登陆您的邮箱，点击验证链接完成验证！</span><br />
		</div>
		<br /> <br />
		<div class="color-div">
			<span><a href="#">进入我的邮箱，进行邮件认证！</a></span><br /> <span>没收到邮件：请检查您的垃圾箱，邮件有可能被误认为垃圾或广告邮件。</span>
		</div>
	</div>

</body>
</html>
