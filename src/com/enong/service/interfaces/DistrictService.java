package com.enong.service.interfaces;

import java.util.List;

import com.enong.bo.EDistrict;

public interface DistrictService {

	/**
	 * 根据ID获取区域信息
	 * 
	 * @param id
	 * @return
	 */
	public EDistrict findDistrictById(long id);

	/**
	 * 获取下级区域
	 * 
	 * @param parent_id
	 * @return
	 */
	public List<EDistrict> findDistrictByParentId(long parent_id);

}
