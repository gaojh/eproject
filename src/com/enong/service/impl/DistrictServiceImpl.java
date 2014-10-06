package com.enong.service.impl;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.enong.bo.EDistrict;
import com.enong.service.interfaces.DistrictService;

@IocBean
@InjectName("districtServiceImpl")
public class DistrictServiceImpl implements DistrictService {

	@Inject
	Dao dao;

	@Override
	public List<EDistrict> findDistrictByParentId(long parent_id) {
		List<EDistrict> districts = dao.query(EDistrict.class,
				Cnd.where("parent_id", "=", parent_id).asc("sequence"));
		return districts;
	}

	@Override
	public EDistrict findDistrictById(long id) {
		EDistrict district = dao.fetch(EDistrict.class, id);
		return district;
	}
}
