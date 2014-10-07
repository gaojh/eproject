package com.enong.service.interfaces;

import java.util.List;

import com.enong.bo.EBankcard;

public interface BankcardService {

	/**
	 * 根据ID获取银行卡
	 * 
	 * @param id
	 * @return
	 */
	public EBankcard findBankcardById(long id);

	/**
	 * 根据用户获取银行卡
	 * 
	 * @param userId
	 * @return
	 */
	public List<EBankcard> findBankcardsByUser(long userId);

	/**
	 * 获取用户默认银行卡
	 * 
	 * @param userId
	 * @return
	 */
	public EBankcard findDefaultBankcard(long userId);

	/**
	 * 获取用户已绑定银行卡数量
	 * 
	 * @param userId
	 * @return
	 */
	public int findBankcardCountByUser(long userId);

	/**
	 * 新增银行卡
	 * 
	 * @param bankcard
	 * @return
	 */
	public EBankcard addBankcard(EBankcard bankcard);

	/**
	 * 更新银行卡信息
	 * 
	 * @param bankcard
	 * @return
	 */
	public int updateBankcard(EBankcard bankcard);

	/**
	 * 删除银行卡
	 * 
	 * @param bankcard
	 * @return
	 */
	public int removeBankcard(EBankcard bankcard);

}
