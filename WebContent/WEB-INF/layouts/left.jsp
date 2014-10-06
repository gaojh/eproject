<%@ page language="java" pageEncoding="UTF-8"%>
<div class="enong-left enong-v-line">
	<dl class="text-right" id="menu">
		<dt><a id="menu_myenong" href="${ctx}/myenong"><span class="glyphicon glyphicon-home"></span>&nbsp;我的易侬</a></dt>
		<dt><span class="glyphicon glyphicon-file"></span>&nbsp;订单管理</dt>
		<li><a id="menu_myorder" href="${ctx}/myenong/myorder">我的订单</a></li>
		<li><a id="menu_myreturn" href="${ctx}/myenong/myreturn">我的退货</a></li>
		<li><a id="menu_myevaluation" href="${ctx}/myenong/myevaluation">我的评价</a></li>
		<li><a id="menu_mycollection" href="${ctx}/myenong/mycollection">我的收藏</a></li>
		<dt><span class="glyphicon glyphicon-cog"></span>&nbsp;个人设置</dt>		
		<li><a id="menu_personaldata" href="${ctx}/myenong/personaldata">个人资料</a></li>
		<li><a id="menu_change_password" href="${ctx}/myenong/changepassword">密码修改</a></li>
		<li><a id="menu_send_address" href="${ctx}/myenong/address">配送地址</a></li>
		<li><a id="menu_bank_account" href="${ctx}/myenong/bankacct">银行账户</a></li>
		<dt><span class="glyphicon glyphicon-usd"></span>&nbsp;账户管理</dt>
		<li><a id="menu_cash_account" href="${ctx}/myenong/cashacct">现金账户</a></li>
		<li><a id="menu_score_account" href="${ctx}/myenong/scoreacct">积分账户</a></li>
		<li><a id="menu_score_exchange" href="${ctx}/myenong/scoreexchange">积分兑换</a></li>
		<li><a id="menu_balance_cash" href="${ctx}/myenong/balancecash">余额提现</a></li>
	</dl>
</div>
