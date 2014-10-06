<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<span class="pull-left">收藏本站︱移动客户端︱在线客服</span>
		</div>
		<div class="col-md-6">
			<c:choose>
				 <c:when test="${ENONG_USER ==null}">
				 	<div class="pull-right">易侬欢迎您！ <a href="${ctx}/login">登录</a>︱<a href="${ctx}/register">注册</a>︱<a href="${ctx}/myenong">我的账户<span class="caret"></span></a></div>
				 </c:when>
				 <c:otherwise>
				 	<div class="pull-right">易侬欢迎您！ ${ENONG_USER.email}︱<a href="${ctx}/user/logout">退出登录</a>︱<a href="${ctx}/myenong">我的账户<span class="caret"></span></a></div>
				 </c:otherwise>
			</c:choose>
		</div>
	</div>
	<br />
	<div class="row">
		<div class="col-md-3">
			<img alt="" src="${ctx}/static/images/enong.png" width="260">
		</div>
		<div class="col-md-4 top-span">
			<span>一站式︱批发价︱靓新鲜︱居家采︱免费送︱定时达</span><br /> <span>易侬365天悉心食材！</span>
		</div>
		<div class="col-md-3">
			<div class="input-group">
				<input type="text" class="form-control input-green input-sm"> <span class="input-group-btn">
					<button class="btn btn-success btn-sm" type="button">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
		<div class="col-md-2">
			<button type="button" class="btn btn-success btn-sm btn-block">购物车</button>
		</div>
	</div>
</div>
<br />
<div class="div-green">
	<div class="container">
		<div class="row">
			<div class="col-md-1">首页</div>
			<div class="col-md-1">蔬菜</div>
			<div class="col-md-1">肉禽</div>
			<div class="col-md-1">水产</div>
			<div class="col-md-1">蛋类</div>
			<div class="col-md-1">酒水</div>
			<div class="col-md-1">粮油</div>
			<div class="col-md-1">干调</div>
			<div class="col-md-1">国产水果</div>
			<div class="col-md-1">进口水果</div>
			<div class="col-md-1">全部分类</div>
			<div class="col-md-1">点评</div>
			
		</div>
	</div>
</div>
<br />


