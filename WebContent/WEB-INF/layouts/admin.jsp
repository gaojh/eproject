<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>ENONG-易农网:<sitemesh:title />
</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${ctx}/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/css/enong.css" type="text/css" rel="stylesheet" />

<script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
<script src="${ctx}/static/respond.min.js"></script>
<script src="${ctx}/static/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/jquery.json.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/jquery.anchor.1.0.js" type="text/javascript"></script>

<script src="${ctx}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/bootstrap3-validation.js" type="text/javascript"></script>
<script src="${ctx}/static/js/enong.js" type="text/javascript"></script>
<sitemesh:head />
</head>

<body>
	<div>
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
		<div class="container">
			<div class="row enong-crumb">
				<span id="crumb"><a href="${ctx}/index">首页</a> ﹥ 我的易侬</span>
			</div>
			<br>
			<div class="row">
				<%@ include file="/WEB-INF/layouts/left.jsp"%>
				<div class="enong-right">
					<sitemesh:body />
				</div>
			</div>
		</div>
		<br>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	</div>
</body>
</html>