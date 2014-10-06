package com.enong.web;

import java.util.List;

import org.nutz.dao.Dao;
import org.nutz.ioc.Ioc;
import org.nutz.ioc.impl.NutIoc;
import org.nutz.ioc.loader.json.JsonLoader;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import com.enong.bo.EDataConfig;
import com.enong.utils.Configer;

public class ESetup implements Setup {


	public void destroy(NutConfig config) {
		
	}

	public void init(NutConfig config) {
		Ioc ioc = new NutIoc(new JsonLoader("ioc/dao.js"));
		Dao dao = ioc.get(Dao.class, "dao");
		List<EDataConfig> list = dao.query(EDataConfig.class, null);
		for(EDataConfig edc : list){
			Configer.addConfig(edc.getType(), edc.getName(), edc.getValue());
		}
	}

}
