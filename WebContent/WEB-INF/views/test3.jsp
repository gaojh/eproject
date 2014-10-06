<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.pop-box {
	z-index: 9999; /*这个数值要足够大，才能够显示在最上层*/
	margin-bottom: 3px;
	display: none;
	position: absolute;
	background: #FFF;
	border: solid 1px #6e8bde;
}

.pop-box h4 {
	color: #FFF;
	cursor: default;
	height: 18px;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	padding-left: 8px;
	padding-top: 4px;
	padding-bottom: 2px;
	background: url("../images/header_bg.gif") repeat-x 0 0;
}

.pop-box-body {
	clear: both;
	margin: 4px;
	padding: 2px;
}

.mask {
	color: #C7EDCC;
	background-color: #C7EDCC;
	position: absolute;
	top: 0px;
	left: 0px;
	filter: Alpha(Opacity = 60);
	opacity: 0.5;
	-moz-opacity: 0.5;
}

.popbg {
	BACKGROUND: #000;
	FILTER: alpha(opacity = 50);
	LEFT: 0px;
	WIDTH: 100%;
	POSITION: absolute;
	TOP: 0px;
	HEIGHT: 100%;
	opacity: 0.5;
	z-index: 9999998;
	display: none;
	-moz-opacity: 0.5;
}
</style>
<script language=javascript type="text/javascript">
	function popupDiv(div_id) {
		var div_obj = $("#" + div_id);
		var windowWidth = document.body.clientWidth;
		var windowHeight = document.body.clientHeight;
		var popupHeight = div_obj.height();
		var popupWidth = div_obj.width();
		alert("windowWidth:" + windowWidth + "document.body.scrollWidth"
				+ document.body.scrollWidth);
		alert("windowHeight:" + windowHeight + "document.body.scrollHeight"
				+ document.body.scrollHeight);
		//添加并显示遮罩层   
		$("<div id='mask'></div>").addClass("popbg").width(
				windowWidth ).height(
				windowHeight ).click(function() {
			hideDiv(div_id);
		}).appendTo("body").fadeIn();
		div_obj.css({
			"position" : "absolute"
		}).animate({
			left : windowWidth / 2 - popupWidth / 2,
			top : windowHeight / 2 - popupHeight / 2,
			opacity : "show"
		}, "slow");

	}

	function hideDiv(div_id) {
		$("#mask").remove();
		$("#" + div_id).animate({
			left : 0,
			top : 0,
			opacity : "hide"
		}, "slow");
	}
</script>


</head>

<body>

	<div id='pop-div' style="width: 300px;" class="pop-box">
		<h4>标题位置</h4>
		<div class="pop-box-body">
			<p>正文内容</p>
			<input id=btnClose type=button onclick="hideDiv('pop-div');"
				value="关闭" />
		</div>
	</div>

	<input type=button id=btnTest value='test'
		onclick="popupDiv('pop-div');" />
	<div style="margin-top: 2000px;">dsadsa</div>
</body>
</html>