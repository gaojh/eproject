<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>验证成功</title>
<style type="text/css">
.border-line {
	border: 2px solid #f0ad4e;
	padding-top: 30px;
	padding-bottom: 30px;
}
</style>
</head>

<body>
	<div class="row enong-crumb">
		<span>首页﹥注册﹥注册成功﹥邮箱验证﹥验证成功</span>
	</div>
	<div class="row rtitle"></div>
	<div class="col-md-10 col-md-offset-1 border-line">
		<div>
			<span>恭喜您已验证成功！</span><br /> <span>100元易侬消费券已发放到您的账户中，请您查收使用！</span><br /> <span><a href="#">现在去购买>></a></span>


		</div>
	</div>

</body>
</html>
