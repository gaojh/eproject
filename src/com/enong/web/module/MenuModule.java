package com.enong.web.module;

import java.util.List;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;

import com.enong.bo.EAddress;
import com.enong.bo.EUser;
import com.enong.service.interfaces.AddressService;

@IocBean
public class MenuModule {

	private static Log log = Logs.getLog(UserModule.class);

	@Inject("refer:addressServiceImpl")
	AddressService addressService;

	@At("/")
	@Ok("jsp:views.index")
	public void openAdmin() {

	}

	@At("/test")
	@Ok("jsp:views.test")
	public void openTestPage() {

	}

	@At("/index")
	@Ok("jsp:views.index")
	public void openAdminLogin() {

	}

	@At("/register")
	@Ok("jsp:views.register")
	public void openregister() {

	}

	@At("/registersuccess")
	@Ok("jsp:views.registersuccess")
	public void openregistersuccess() {

	}

	@At("/login")
	@Ok("jsp:views.login")
	public void openLogin() {

	}

	@At("/myenong")
	@Ok("jsp:myenong.myenong")
	public void openMyIndex() {

	}

	@At("/myenong/myorder")
	@Ok("jsp:myenong.myorder")
	public void openMyMyOrder() {

	}

	@At("/myenong/myreturn")
	@Ok("jsp:myenong.myreturn")
	public void openMyReturn() {

	}

	@At("/myenong/myevaluation")
	@Ok("jsp:myenong.myevaluation")
	public void openMyEvaluation() {

	}

	@At("/myenong/mycollection")
	@Ok("jsp:myenong.mycollection")
	public void openMyCollection() {

	}

	@At("/myenong/personaldata")
	@Ok("jsp:myenong.personaldata")
	public void openMyPersonaldata() {

	}

	@At("/myenong/changepassword")
	@Ok("jsp:myenong.changepassword")
	public void openMyChangePassword() {

	}

	@At("/myenong/address")
	@Ok("jsp:myenong.address")
	@Fail("jsp:views.login")
	public List<EAddress> openMyAddress(@Attr("ENONG_USER") EUser user) {
		List<EAddress> list = addressService.findAddressByUser(user.getId());
		log.debug(list.size());
		return list;
	}

	@At("/myenong/bankacct")
	@Ok("jsp:myenong.bankacct")
	public void openMyBankAcct() {

	}

	@At("/myenong/cashacct")
	@Ok("jsp:myenong.cashacct")
	public void openMyCashAcct() {

	}

	@At("/myenong/scoreacct")
	@Ok("jsp:myenong.scoreacct")
	public void openMyScoreAcct() {

	}

	@At("/myenong/scoreexchange")
	@Ok("jsp:myenong.scoreexchange")
	public void openMyScoreExchange() {

	}

	@At("/myenong/balancecash")
	@Ok("jsp:myenong.balancecash")
	public void openMyBalanceCash() {

	}

}
