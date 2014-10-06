<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.enong.utils.UtilDate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rdate" value="${ENONG_USER.registerDate}" scope="page" />
<!DOCTYPE html>
<html>
<head>
<title>个人资料</title>
<script type="text/javascript">
	var is_edit_userdata = false;

	$(function() {
		$("#menu_personaldata").attr("class", "enong-menu-select");
		var crumb = createCrumb('首页', 'index') + " ﹥ "
				+ createCrumb('我的易侬', 'myenong') + " ﹥个人设置 ﹥ 个人资料";
		$("#crumb").empty();
		$("#crumb").append(crumb);
	});

	function editUserData() {
		//edit
		is_edit_userdata = true;
		/*
		 $("#name").val("${ENONG_USER.name}");
		 $("#phone").val("${ENONG_USER.phone}");
		 $("#email").val("${ENONG_USER.email}");
		 */
		$("#name").val($("#s_name").text());
		$("#phone").val($("#s_phone").text());
		$("#email").val($("#s_email").text());
		editUserDataAction();
		//return false;
	}

	function editUserDataAction() {
		$("#userDataTable").hide("slow");
		$("#editUserDataTable").show();
		$("#editUserData").toggle();
	}

	function showUserDataAction() {
		$("#editUserDataTable").hide();
		$("#userDataTable").slideDown();
		$("#editUserData").toggle();
	}

	function saveUserData() {
		var arg1 = $("#name").val();
		var arg2 = $("#phone").val();
		var arg3 = $("#email").val();

		var args = {
			"name" : arg1,
			"phone" : arg2,
			"email" : arg3
		};

		$.post("${ctx}/user/updateUserData", args, function(result) {
			var data = eval("(" + result + ")");

			if (data.code == 1) {
				$("#s_name").text(data.content.name);
				$("#s_phone").text(data.content.phone);
				$("#s_email").text(data.content.email);

				showUserDataAction();

			} else if (data.code == 0) {
				alert(data.message);
				return false;
			} else {
				alert("操作失败！");
				return false;
			}
		});

	}

	function cacelUserdata() {
		showUserDataAction();
	}

	$(document).ready(function() {
		$("#editUserData").bind("click", function() {
			editUserData();
		});
		$("#save_userdata").bind("click", function() {
			saveUserData();
		});
		$("#cancel_userdata").bind("click", function() {
			cacelUserdata();
		});
	});
</script>
<%
	String dd = UtilDate.getChinaFormatDate((Date) pageContext
			.findAttribute("rdate"));
%>

<style type="text/css">
div .table {
	padding-top: 20px;
}

div .row {
	padding: 20px;
}

div .col-left {
	float: left;
	margin-left: 10px
}

div .col-right {
	
}
</style>

</head>
<body>
	<div>
		<div class="enong-h-line">

			<label>基本信息</label> (注册时间:<%=dd%>) <a id="editUserData"
				class="pull-right " href="Javascript: void(0)">编辑>></a>
		</div>



		<div id="userDataTable" class="table">
			<div class="row">
				<label class="col-left">姓名：</label>
				<div class="col-left col-sm-4">
					<span id="s_name">${ENONG_USER.name}</span>
				</div>
			</div>

			<div class="row">
				<label class="col-left">手机：</label>
				<div class="col-left col-sm-4">
					<span id="s_phone">${ENONG_USER.phone}</span>
				</div>
			</div>
			<div class="row">
				<label class="col-left">邮箱：</label>
				<div class="col-left col-sm-4">
					<span id="s_email">${ENONG_USER.email}</span>
				</div>
			</div>
		</div>

		<div id="editUserDataTable" class="table" hidden="true">
			<form id="userDataForm" method="post" class="form-horizontal"
				role="form">

				<div class="row">
					<label class="col-left">姓名：</label>
					<div class="col-left col-sm-4">
						<input id="name" type="text" class="form-control input-sm">
					</div>
				</div>

				<div class="row">
					<label class="col-left">手机：</label>
					<div class="col-left col-sm-4">
						<input id="phone" type="text" class="form-control input-sm ">
					</div>
				</div>
				<div class="row">
					<label class="col-left">邮箱：</label>
					<div class="col-left col-sm-4">
						<input id="email" type="email" class="form-control input-sm">
					</div>
				</div>
			</form>
			<div class="row ">
				<div class="col-sm-2">
					<button id="cancel_userdata"
						class="btn btn-success btn-sm btn-block col-left" type="button">取消</button>
				</div>
				<div class="col-sm-2">
					<button id="save_userdata"
						class="btn btn-success btn-sm btn-block col-left" type="button">保存</button>
				</div>
			</div>
		</div>
		<div class="enong-h-line">

			<label>采购习惯</label> (完善以下信息有助于为您提供更周到的服务，同时可获赠1000点积分) <a
				id="editUserHabit" class="pull-right " href="Javascript: void(0)">编辑>></a>
		</div>
		<div id="userHabitTable" class="table"></div>
		<div id="editUserHabitTable" class="table" hidden="true"></div>
	</div>

</body>
</html>

