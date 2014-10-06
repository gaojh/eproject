<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>密码修改</title>
<script type="text/javascript">
	$(function() {
		$("#menu_change_password").attr("class", "enong-menu-select");
		var crumb = createCrumb('首页', 'index') + " ﹥ "
				+ createCrumb('我的易侬', 'myenong') + " ﹥个人设置 ﹥ 密码修改";
		$("#crumb").empty();
		$("#crumb").append(crumb);
	});

	//do cancel
	function cancel() {
		$("input").val(null);
		$("span.help-block:not(:contains('*'))").remove();
		$("div.form-group").removeClass('has-error has-success');

		hiddenMsg();
	}

	//do save
	function save() {

		$("span.help-block:not(:contains('*'))").remove();

		if ($("form").valid(this, "error!") == false) {
			return false;
		}
		if (validConfirmPwd() == false) {
			return false;
		}
		var args = {
			oldPassword : $("#oldpassword").val(),
			newPassword : $("#newpassword").val(),
			confirmpassword : $("#confirmpassword").val(),

		};

		$.post("${ctx}/user/changePassword", args, function(result) {
			var data = eval("(" + result + ")");
			showMsg(data.message, data.code);

			if (data.code == 1) {
				$("input").val(null);
				$("div.form-group").removeClass('has-error has-success');

			} else if (data.code == 0) {

				return false;
			} else {

				showMsg("操作失败！");
				return false;
			}
		});

	}

	//validate the new password inputed same or not
	function validConfirmPwd() {
		$("#valipwd").remove();
		var el = $("#confirmpassword");

		var newPassword = $("#newpassword").val();
		var confirmpassword = el.val();
		if (confirmpassword == null || confirmpassword.trim() == '') {
			return false;
		}

		var msg = "两次输入的密码不同，请重新输入!";
		if (newPassword.trim() != confirmpassword.trim()) {
			error = true;
			var controlGroup = el.parents('.form-group');
			controlGroup.removeClass('has-error has-success');
			controlGroup.addClass(error == false ? 'has-success' : 'has-error');

			el.parent()
					.after(
							'<span id="valipwd" class="help-block" >' + msg
									+ '</span>');

			return false;
		}
		return true;
	}

	function showMsg(msg, error) {
		if (!msg || msg == '') {
			return false;
		}

		if (error == 1) {
			error = false;
		} else if (error == 0) {
			error = true;
		} else {
			error = true;
		}

		$("#msgDiv").slideDown();

		$("#msgDiv").removeClass('alert-danger alert-info');

		if (error) {
			$("#msgDiv").addClass("alert-danger");
		} else {
			$("#msgDiv").addClass("alert-info");

			//$("#msgSpan").html('<span id="msgSpan"></span>');
		}

		$("#msgSpan").text(msg);
		return true;
	}

	function hiddenMsg() {
		//$("#msgSpan").remove();
		$("#msgDiv").slideUp();

	}

	$(document).ready(function() {
		$('form').validation();

		$("#confirmpassword,#newpassword").bind("blur", function() {
			validConfirmPwd();
		});

		$("#cancel").bind("click", function() {
			cancel();
		});

		$("#save").bind("click", function() {
			save();
		});
		$("#coloseMsg").bind("click", function() {
			hiddenMsg();
		});

	});
</script>
</head>
<body>
	<div id="msgDiv" class="alert alert-dismissable"
		style="text-align: center;" hidden="true">
		<button type="button" class="close" aria-hidden="true" id="coloseMsg">&times;</button>
		<span id="msgSpan"></span>
	</div>
	<div class="container">

		<div>

			<form id="registerForm" method="post" class="form-horizontal"
				role="form">
				<div class="form-group">
					<label class="col-sm-4 control-label"> 原密码： </label>
					<div class="col-sm-4">
						<input type="password" class="form-control input-sm"
							id="oldpassword" name="password" check-type="required"
							required-message="请输入原密码">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-4 control-label"> 新密码： </label>
					<div class="col-sm-4">
						<input type="password" class="form-control input-sm"
							id="newpassword" check-type="required" required-message="请输入新密码">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label"> 再次输入新密码： </label>
					<div class="col-sm-4">
						<input type="password" class="form-control input-sm"
							id="confirmpassword" check-type="required"
							required-message="请再次输入新密码">
					</div>
				</div>
			</form>

			<div class="row">
				<div class="col-sm-2 col-sm-offset-4">
					<button id="cancel" class="btn btn-success btn-sm btn-block"
						type="button">取消</button>
				</div>
				<div class="col-sm-2">
					<button id="save" class="btn btn-success btn-sm btn-block"
						type="button">保存</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

