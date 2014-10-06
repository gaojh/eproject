<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>余额提现</title>
<script type="text/javascript">
$(function(){
	$("#menu_balance_cash").attr("class","enong-menu-select");
	var crumb = createCrumb('首页','index')+" ﹥ "+createCrumb('我的易侬','myenong')+" ﹥账户管理﹥ 余额提现";
	$("#crumb").empty();
	$("#crumb").append(crumb);
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<span></span>
		</div>
	</div>
</body>
</html>

