<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="count" value="${obj.size()}" />

<!DOCTYPE html>
<html>
<head>
<title>银行账户</title>
<script type="text/javascript">
	$(function() {
		$("#menu_bank_account").attr("class", "enong-menu-select");
		var crumb = createCrumb('首页', 'index') + " ﹥ "
				+ createCrumb('我的易侬', 'myenong') + " ﹥个人设置 ﹥ 银行账户";
		$("#crumb").empty();
		$("#crumb").append(crumb);
	});
</script>
</head>
<body>

	<c:if test="${count = 0}">
		<div class="container">

			<div class="row enong-h-line" style="margin-bottom: 10px">


				<div class="col-sm-9">
					<label class="control-label smooth" style="margin-top: 10px">
						以下是您在采购过程中使用过的银行卡信息，维护银行卡有助您快速完成支付。 </label>
				</div>
				<div class="col-sm-2">
					<button id="add_btn"
						class="btn btn-default btn-sm btn-block col-left" type="button">添加信用卡</button>
				</div>
			</div>
		</div>
	</c:if>
	<div class="container">
		<div class="row">
			<span></span>
		</div>
	</div>
	<div id="editDiv">
		<!-- Edit area -->
		<div class="enong-h-line" id="titlediv">
			<label class="control-label">请填写信用卡信息(可方便用于在线支付订单)</label><input
				type="hidden" id="bankcard_id"> <input type="hidden"
				id="bankcard_create_date"> <input type="hidden"
				id="bankcard_is_easypay"> <input type="hidden"
				id="bankcard_state">
		</div>
		<div class="container">

			<form id="DataForm" method="post" class="form-horizontal" role="form">
				<div class="row form-group" style="padding-top: 20px;">
					<label class="col-sm-2 control-label text-right">信用卡卡种： </label>
					<div class="col-sm-3">
						<select class="form-control" id="bank_code">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="row form-group" style="padding-top: 20px;">
					<label class="col-sm-2 control-label text-right">信用卡卡号： </label>
					<div class="col-sm-3">
						<input id="bankcard_code" type="text"
							class="form-control input-sm ">
					</div>
				</div>
				<div class="row form-group" style="padding-top: 20px;">
					<label class="col-sm-2 control-label text-right">持卡人姓名： </label>
					<div class="col-sm-3">
						<input id="bankcard_holder" type="text"
							class="form-control input-sm ">
					</div>
				</div>
				<div class="row form-group" style="padding-top: 20px;">
					<label class="col-sm-2 control-label text-right">信用卡有效期： </label>
					<div class="col-sm-3">
						<input id="bankcard_validity" type="text"
							class="form-control input-sm ">
					</div>
				</div>
				<div class="row form-group" style="padding-top: 20px;">
					<label class="col-sm-2 control-label text-right">证件类型： </label>
					<div class="col-sm-3">
						<input id="credential_type" type="text"
							class="form-control input-sm ">
					</div>
				</div>
				<div class="row form-group" style="padding-top: 20px;">
					<label class="col-sm-2 control-label text-right">证件号码： </label>
					<div class="col-sm-3">
						<input id="credential_code" type="text"
							class="form-control input-sm ">
					</div>
				</div>
				<div class="row checkbox form-group	" style="padding-bottom: 15px;">
					<div class="col-sm-2 col-sm-offset-1">
						<label><input type="checkbox" id="isEasyPay">下次使用只需要提供信用卡卡号的末四位！
						</label>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

