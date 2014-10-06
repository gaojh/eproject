<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="count" value="${obj.size()}" />

<!DOCTYPE html>
<html>
<head>

<title>配送地址</title>
<style type="text/css">
<!--
.p_h_x {
	float: right;
	text-align: center;
	height: 30px;
	width: 30px;
	padding-right: 30px;
	line-height: 30px;
	color: #000;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	line-height: 30px;
}
-->
</style>
<script type="text/javascript">
	$(function() {
		$("#menu_send_address").attr("class", "enong-menu-select");
		var crumb = createCrumb('首页', 'index') + " ﹥ "
				+ createCrumb('我的易侬', 'myenong') + " ﹥个人设置 ﹥ 配送地址";
		$("#crumb").empty();
		$("#crumb").append(crumb);
	});

	/*
	 *parms:
	 *@selector 下拉列表对象
	 *@parentId 上级地区ID 未传入 则取当前下拉列表所选值|parentId=0时说明收货地址未设置当前级别地区，隐藏该下拉列表
	 *@isLoadSelf 是否加载自己，false或者未传参数时，根据返回code决定加载哪一级下拉列表 code=1下载下一级，code=2 加载下下一级
	 *@setVal 根据此值设置下拉列表默认选中项，未传入或者setVal=0时不设置默认选中项
	 */
	//加载地区数据
	function init_selector(selector, parentId, isLoadSelf, setVal) {
		if (parentId == 0) {
			selector.parent().hide();
			return;
		}

		if (!parentId) {
			parentId = selector.val();
		}
		var args = {
			parentId : parentId
		};

		$.get("${ctx}/address/loadDistrict", args, function(data) {

			if (data.code == 0) {
				alter(data.message);
			}
			var obj = selector;
			if (data.content instanceof Array) {
				//加载自己
				if (isLoadSelf) {
					obj = selector;
					obj.parent().show();
					obj.children().remove("option[value!='']");
				} else {
					//加载下一级
					if (parentId > 0) {
						//code=2，obj指向相隔一位的select所在div
						if (data.content.length > 0 && data.code == 2) {

							obj = selector.parent().next().next().children(
									"select");
							selector.parent().next().hide();
						} else {
							//code=1，obj指向先一个select所在div
							obj = selector.parent().next().children("select");
							selector.parent().next().show();
						}
					}
				}

				for (var i = 0, len = data.content.length; i < len; i++) {
					var opt = $("<option></option>");
					opt.attr("value", data.content[i].id);
					opt.text(data.content[i].name);
					obj.append(opt);
				}

				if (setVal && setVal > 0) {
					obj.val(setVal);
				}
			}

		}, "json");
	}

	function cancel() {
		$("#address_id").val(null);
		$("#address").val(null);
		$("#symbolicBuilding").val(null);
		$("#consignee").val(null);
		$("#company").val(null);
		$("#phone").val(null);
		$("#isDefault").prop('checked', false);
		$("#address_create_date").val(null);
		$("#address_remark").val(null);
		$("#address_state").val(null);

		$("#s_province").get(0).selectedIndex = 0;
		$("#s_city").parent().show();
		$("#s_city").children().remove("option[value!='']");
		$("#s_dist").children().remove("option[value!='']");
		$("#s_town").children().remove("option[value!='']");

		closeDiv();
	}

	function save() {

		if ($("form").valid(this, "error!") == false) {
			return false;
		}
		var id = $("#address_id").val();

		var user_id = '${ENONG_USER.id}';
		var dist1 = $("#s_province").val();
		var dist2 = $("#s_city").val();
		var dist3 = $("#s_dist").val();
		var dist4 = $("#s_town").val();
		var address = $("#address").val();
		var symbolicBuilding = $("#symbolicBuilding").val();
		var consignee = $("#consignee").val();
		var company = $("#company").val();
		var phone = $("#phone").val();
		var isDefault = $("#isDefault").is(":checked") ? 'Y' : 'N';

		var createDate = $("#address_create_date").val();
		var remark = $("#address_remark").val();
		var state = $("#address_state").val();
		var args = {
			"id" : id,
			"userId" : user_id,
			"district1" : dist1,
			"district2" : dist2,
			"district3" : dist3,
			"district4" : dist4,
			"address" : address,
			"symbolicBuilding" : symbolicBuilding,
			"consignee" : consignee,
			"company" : company,
			"phone" : phone,
			"isDefault" : isDefault,
			"createDate" : createDate,
			"remark" : remark,
			"state" : state
		};

		var requestUrl;

		if (id == '' || id == null) {
			requestUrl = "${ctx}/address/add";
		} else {
			requestUrl = "${ctx}/address/update";
		}

		$.post(requestUrl, $.toJSON(args), function(data) {

			if (data.code == 1) {
				alert(data.message);
				window.location.reload();
				//cancel();
			} else if (data.code == 0) {
				alert(data.message);
				return false;
			} else {
				alert("操作失败！");
				return false;
			}
		}, "json");
	}

	function editAddress(addressId) {
		if (!addressId) {
			return;
		}
		showDiv();

		var args = {
			id : addressId
		};
		$.post("${ctx}/address/get", args, function(data) {
			if (data.code == 0) {
				alert(code.message);
				return;
			}
			var obj = data.content;
			var a_id = obj.id;
			var a_userId = obj.userId;

			vara_dist1_pid = obj.dist1 == null ? 0 : obj.dist1.parent_id;
			vara_dist2_pid = obj.dist2 == null ? 0 : obj.dist2.parent_id;
			vara_dist3_pid = obj.dist3 == null ? 0 : obj.dist3.parent_id;
			vara_dist4_pid = obj.dist4 == null ? 0 : obj.dist4.parent_id;

			var a_district1 = obj.district1;
			var a_district2 = obj.district2;
			var a_district3 = obj.district3;
			var a_district4 = obj.district4;
			var a_address = obj.address;
			var a_symbolicBuilding = obj.symbolicBuilding;
			var a_company = obj.company;
			var a_consignee = obj.consignee;
			var a_phone = obj.phone;
			var a_isDefault = obj.isDefault;
			var a_remark = obj.remark;
			var a_createDate = obj.createDate;
			var a_state = obj.state;

			//加载地区列表 并初始化选择列
			$("#s_province").val(a_district1);
			init_selector($("#s_city"), vara_dist2_pid, true, a_district2);
			init_selector($("#s_dist"), vara_dist3_pid, true, a_district3);
			init_selector($("#s_town"), vara_dist4_pid, true, a_district4);

			$("#address_id").val(a_id);
			$("#address").val(a_address);
			$("#symbolicBuilding").val(a_symbolicBuilding);
			$("#consignee").val(a_consignee);
			$("#company").val(a_company);
			$("#phone").val(a_phone);

			$("#address_create_date").val(a_createDate);
			$("#address_remark").val(a_remark);
			$("#address_state").val(a_state);

			//获取是否选中 
			//var isChecked = $('#cb').prop('checked'); 
			//或 
			//var isChecked = $('#cb').is(":checked"); 
			//设置选中 
			//$('#cb').prop('checked',true); 
			a_isDefault == 'Y' ? $("#isDefault").prop('checked', true) : $(
					"#isDefault").prop('checked', false);
			$("#isDefault").is(":checked")
		}, "json");
	}

	function delAddress(addressId) {
		if (!confirm("是否确认删除?")) {
			return;
		}

		var args = {
			"id" : addressId
		};
		$.post("${ctx}/address/delete", args, function(data) {
			if (data.code == 1) {
				alert(data.message);
				window.location.reload();
				//cancel();
			} else if (data.code == 0) {
				alert(data.message);
				return false;
			} else {
				alert("操作失败！");
				return false;
			}
		}, "json");
	}

	function showDiv() {
		$('#editDiv').addClass("popdiv");
		$("#titlediv").addClass("poptitle");
		$("#titlediv")
				.append(
						'<a class="p_h_x" id="a_closediv" onclick="closeDiv();" title="关闭窗口">X</a>');
		$('#editDiv').show();
		$('#bg').show();
	}
	function closeDiv() {
		$('#editDiv').hide();
		$('#bg').hide();
		$("div").removeClass("popdiv poptitle");
		$("#a_closediv").remove();
	}

	$(document).ready(function() {

		$('form').validation();
		init_selector($("#s_province"), -1);
		$("#s_province").bind("change", function() {
			init_selector($(this));
			//清除
			$("#s_city").children().remove("option[value!='']");
			$("#s_dist").children().remove("option[value!='']");
			$("#s_town").children().remove("option[value!='']");

		});
		$("#s_city").bind("change", function() {
			init_selector($(this));
			$("#s_dist").children().remove("option[value!='']");
			$("#s_town").children().remove("option[value!='']");
		});
		$("#s_dist").bind("change", function() {
			init_selector($(this));
			$("#s_town").children().remove("option[value!='']");
		});
		$("#s_town").bind("change", function() {
			init_selector($(this));
		});

		$("#save_btn").bind("click", function() {
			save();
		});
		$("#cancel_btn").bind("click", function() {
			cancel();
		});
		$("#add_btn").bind("click", function() {
			showDiv();
		});

		if ('${count}' > 0) {
			$("#canceldiv").show();
			$('#editDiv').hide();
		} else {
			$("#canceldiv").hide();
			$('#editDiv').show();
		}

		//$('#editDiv').hide();
		//$(".smooth").zxxAnchor({
		//	anchortag : "href"
		//});
		//$("#add_btn").zxxAnchor();
		//$('#myModal').modal({
		//	keyboard : true
		//})
	});
</script>
</head>
<body>


	<c:if test="${count > 0}">
		<div class="row" style="margin-bottom: 10px">
			<div class="col-sm-2">
				<!-- <button id="add_btn" anchor="editDiv"
					class="btn btn-default btn-sm btn-block col-left" type="button">新增配送地址</button> -->

				<button id="add_btn"
					class="btn btn-default btn-sm btn-block col-left" type="button">新增配送地址</button>
			</div>

			<div class="col-sm-4">
				<label class="control-label smooth" style="margin-top: 10px">
					您已创建${count}个收货地址，最多可创建<%=com.enong.utils.Cons.address.MAX%>个
				</label>
			</div>
		</div>
	</c:if>
	<c:forEach items="${obj}" var="address">
		<div class=" panel panel-default" id="addressDiv${address.id} }">
			<div class=" panel-heading">
				<span class="panel-title">${address.consignee}</span>
				<div style="float: right; margin-top: 10px;">
					<a href="javascript:void(0);" id="edit" style="margin-left: 10px"
						onclick="editAddress('${address.id}')">编辑</a><a
						href="javascript:void(0);" id="delete" style="margin-left: 10px"
						onclick="delAddress('${address.id}')">删除</a>

				</div>
			</div>
			<div class="panel-body">
				<div class="container">
					<div class="row">
						<label class="col-sm-1 control-label text-right">所在地区： </label>
						<div class="col-sm-4">${address.dist1.name}${address.dist2.name}${address.dist3.name}${address.dist4.name}</div>
					</div>
					<div class="row">
						<label class="col-sm-1 control-label text-right">地址： </label>
						<div class="col-sm-4">${address.address}</div>
					</div>
					<div class="row">
						<label class="col-sm-1 control-label text-right">手机： </label>
						<div class="col-sm-4">${address.phone}</div>
					</div>
					<div class="row">
						<label class="col-sm-1 control-label text-right">单位： </label>
						<div class="col-sm-4">${address.company}</div>
					</div>
					<div class="row">
						<label class="col-sm-1 control-label text-right">标志建筑： </label>
						<div class="col-sm-4">${address.symbolicBuilding}</div>
					</div>

				</div>
			</div>
		</div>
	</c:forEach>

	<div id="editDiv">

		<!-- Edit area -->
		<div class="enong-h-line" id="titlediv">
			<label class="control-label">配送地址</label><input type="hidden"
				id="address_id"> <input type="hidden"
				id="address_create_date"> <input type="hidden"
				id="address_remark"> <input type="hidden" id="address_state">
		</div>
		<div class="container">
			<form id="userDataForm" method="post" class="form-horizontal"
				role="form">
				<div class="row form-group" style="padding-top: 20px;">
					<label class="col-sm-1 control-label text-right">所在地区： </label>
					<div class="col-sm-2">
						<select class="form-control" id="s_province">
							<option value="">请选择</option>
						</select>
					</div>
					<div class="col-sm-2" id="cityDiv">
						<select class="form-control" id="s_city">
							<option value="">请选择</option>
						</select>
					</div>
					<div class="col-sm-2" id="distDiv">
						<select class="form-control" id="s_dist">
							<option value="">请选择</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select class="form-control" id="s_town">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="row form-group">
					<label class="col-sm-1 control-label text-right">详细地址： </label>
					<div class="col-sm-5">
						<input id="address" type="text" class="form-control input-sm ">
					</div>
					<label class="col-sm-1 control-label text-right">标志建筑： </label>
					<div class="col-sm-2">
						<input id="symbolicBuilding" type="text"
							class="form-control input-sm ">
					</div>
				</div>
				<div class="row form-group">
					<label class="col-sm-1 control-label text-right">收货人： </label>
					<div class="col-sm-2">
						<input id="consignee" type="text" class="form-control input-sm ">
					</div>
					<label class="col-sm-1 control-label text-right">手机： </label>
					<div class="col-sm-2">
						<input id="phone" type="text" class="form-control input-sm ">
					</div>
					<label class="col-sm-1 control-label text-right">收货单位： </label>
					<div class="col-sm-2">
						<input id="company" type="text" class="form-control input-sm ">
					</div>
				</div>
				<div class="row checkbox form-group	" style="padding-bottom: 15px;">
					<div class="col-sm-2 col-sm-offset-1">
						<label><input type="checkbox" id="isDefault">设置为默认
						</label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" id="canceldiv">
						<button id="cancel_btn"
							class="btn btn-success btn-sm btn-block col-left" type="button">取消</button>
					</div>
					<div class="col-sm-2">
						<button id="save_btn"
							class="btn btn-success btn-sm btn-block col-left" type="button">保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="bg" class="popbg" style="display: none;"></div>





</body>
</html>

