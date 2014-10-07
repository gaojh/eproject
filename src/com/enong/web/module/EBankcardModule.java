package com.enong.web.module;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;

import com.enong.service.interfaces.BankcardService;

@IocBean
@At("/bankcard")
public class EBankcardModule {

	private static Log log = Logs.getLog(UserModule.class);

	@Inject("bankcardServiceImpl")
	BankcardService bankcardService;

}
