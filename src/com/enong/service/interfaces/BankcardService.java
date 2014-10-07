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
	 * @param userId
	 * @return
	 */
	public EBankcard findDefaultBankcard(long userId);

	/**
	 * @param bankcard
	 * @return
	 */
	public EBankcard addBankcard(EBankcard bankcard);

	/**
	 * @param bankcard
	 * @return
	 */
	public int updateBankcard(EBankcard bankcard);

	/**
	 * @param bankcard
	 * @return
	 */
	public int removeBankcard(EBankcard bankcard);

}
