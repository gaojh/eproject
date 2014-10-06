<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>我的易侬</title>
<script type="text/javascript">
	$(function() {
		$("#menu_myenong").attr("class", "enong-menu-select");
		var crumb = createCrumb('首页', 'index') + " ﹥ 我的易侬";
		$("#crumb").empty();
		$("#crumb").append(crumb);
	});
</script>

<style type="text/css">
.e-border {
	border: 1px solid #c0c0c0;
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-5">
			<div class="row e-border">
				<div class="col-sm-3">我的余额：</div>
				<div class="col-sm-4">100</div>
				<div class="col-sm-3">查看 提现</div>
			</div>
		</div>
		<div class="col-md-5 col-md-offset-2">
			<div class="row e-border">
				<div class="col-sm-3">我的积分：</div>
				<div class="col-sm-4">100</div>
				<div class="col-sm-3">查看 兑换</div>
			</div>
		</div>
	</div>
	<br>
	<div class="row">
		<span>未完成订单</span>
		<table class="table table-bordered table-condensed text-center">
			<thead>
				<tr>
					<td>订单号</td>
					<td>订单金额</td>
					<td>下单时间︱配送时间</td>
					<td>订单状态</td>
					<td>订单操作</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>201405080001</td>
					<td>200</td>
					<td>2014-05-08 18:31:23 | 2014-05-09 08-12点</td>
					<td>等待确认</td>
					<td>订单详情 再次购买 取消订单 修改订单</td>
				</tr>
				<tr>
					<td>201405080001</td>
					<td>200</td>
					<td>2014-05-08 18:31:23 | 2014-05-09 08-12点</td>
					<td>等待确认</td>
					<td>订单详情 再次购买 取消订单 修改订单</td>
				</tr>
				<tr>
					<td>201405080001</td>
					<td>200</td>
					<td>2014-05-08 18:31:23 | 2014-05-09 08-12点</td>
					<td>等待确认</td>
					<td>订单详情 再次购买 取消订单 修改订单</td>
				</tr>
				<tr>
					<td>201405080001</td>
					<td>200</td>
					<td>2014-05-08 18:31:23 | 2014-05-09 08-12点</td>
					<td>等待确认</td>
					<td>订单详情 再次购买 取消订单 修改订单</td>
				</tr>
			</tbody>
		</table>
	</div></div>
</body>
</html>

