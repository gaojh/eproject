package com.enong.service.interfaces;

import java.util.List;

import com.enong.bo.EAddress;

public interface AddressService {

	/**
	 * 根据ID获取收货地址
	 * 
	 * @param id
	 * @return
	 */
	public EAddress findAddressById(long id);

	/**
	 * 根据用户获取收货地址
	 * 
	 * @param userId
	 * @return
	 */
	public List<EAddress> findAddressByUser(long userId);

	/**
	 * 获取用户已经拥有的收货地址数量
	 * 
	 * @param userId
	 * @return
	 */
	public int getAddressCountByUser(long userId);

	/**
	 * 新增收货地址
	 * 
	 * @param address
	 * @return
	 */
	public EAddress addAddress(EAddress address);

	/**
	 * 更新收货地址
	 * 
	 * @param address
	 * @return
	 */
	public int UpdateAddress(EAddress address);

	/**
	 * 删除收货地址
	 * 
	 * @param address
	 * @return
	 */
	public int removeAddress(EAddress address);

	/**
	 * 获取默认地址
	 * 
	 * @return
	 */
	public EAddress findDefaultAddress();

}
