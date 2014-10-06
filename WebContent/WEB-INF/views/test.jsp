<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>始终居中的弹出层</title>
<style type="text/css">
<!--
html, body {
	height: 100%;
	margin: 0px;
	font-size: 12px;
}

.popdiv {
	background-color: #FFF;
	border: 1px solid #f00;
	text-align: center;
	line-height: 40px;
	font-size: 12px;
	font-weight: bold;
	z-index: 999;
	width: 300px;
	height: 120px;
	left: 50%;
	top: 50%;
	margin-left: -150px !important; /*FF IE7 该值为本身宽的一半 */
	margin-top: -60px !important; /*FF IE7 该值为本身高的一半*/
	margin-top: 0px;
	position: fixed !important; /* FF IE7*/
	position: absolute; /*IE6*/
	_top: expression(eval(document.compatMode &&
            document.compatMode == 'CSS1Compat')?
            documentElement.scrollTop+ (document.documentElement.clientHeight-this.offsetHeight)/2:
		/*IE6*/
            document.body.scrollTop+ (document.body.clientHeight- this.clientHeight)/2);
	/*IE5 IE5.5*/
}

.bg, .popIframe {
	background-color: #666;
	display: none;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0; /*FF IE7*/
	filter: alpha(opacity = 50); /*IE*/
	opacity: 0.5; /*FF*/
	z-index: 1;
	position: fixed !important; /*FF IE7*/
	position: absolute; /*IE6*/
	_top: expression(eval(document.compatMode &&
            document.compatMode == 'CSS1Compat')?
            documentElement.scrollTop+ (document.documentElement.clientHeight-this.offsetHeight)/2:
		/*IE6*/
            document.body.scrollTop+ (document.body.clientHeight- this.clientHeight)/2);
}

.popIframe {
	filter: alpha(opacity = 0); /*IE*/
	opacity: 0; /*FF*/
}
-->
</style>
<script language="javascript" type="text/javascript">
	function showDiv() {
		document.getElementById('popDiv').style.display = 'block';
		//document.getElementById('popIframe').style.display = 'block';
		document.getElementById('bg').style.display = 'block';
	}
	function closeDiv() {
		document.getElementById('popDiv').style.display = 'none';
		document.getElementById('bg').style.display = 'none';
		//document.getElementById('popIframe').style.display = 'none';

	}
</script>
</head>
<body>
	<div id="popDiv" class="popdiv" style="display: none;">
		网页设计大本营欢迎你！<br />Q群号:29032448<br /> <a href="javascript:closeDiv()">关闭窗口</a>
	</div>
	<div id="bg" class="bg" style="display: none;"></div>
	<a href="javascript:showDiv()">点击这里弹出层</a>
	<div style="margin-top: 2000px;">dsadsa</div>
	<iframe id='popIframe' class='popIframe' frameborder='0'></iframe>
	
</body>
</html>