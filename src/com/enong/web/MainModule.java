package com.enong.web;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

@Modules(scanPackage = true)
@IocBy(type=ComboIocProvider.class, args={
	"*org.nutz.ioc.loader.json.JsonLoader", "ioc/",
	"*org.nutz.ioc.loader.annotation.AnnotationIocLoader", "com.enong"
})
@SetupBy(ESetup.class)
@Fail("json")
public class MainModule {
	
	@At("/index")
	@Ok("jsp:views.index")
	public void index() {
	}
	
}
