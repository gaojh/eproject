package com.enong.bo;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("e_bankcard")
public class EBankcard {

	@Id
	private long id;

	@Column("user_id")
	private long userId;

	@Column("card_code")
	private String cardCode;

	@Column("bank_code")
	private String bandCode;

	@Column("bank_name")
	private String bankName;

	@Column("card_holder")
	private String cardHolder;

	@Column
	private String validity;

	@Column("credential_type")
	private String credentialType;

	@Column("credential_code")
	private String credentialCode;

	@Column("is_easypay")
	private String isEasyPay;

	@Column("is_default")
	private String isDefault;

	@Column("create_date")
	private String createDate;

	@Column
	private String state;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getCardCode() {
		return cardCode;
	}

	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}

	public String getBandCode() {
		return bandCode;
	}

	public void setBandCode(String bandCode) {
		this.bandCode = bandCode;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getCardHolder() {
		return cardHolder;
	}

	public void setCardHolder(String cardHolder) {
		this.cardHolder = cardHolder;
	}

	public String getValidity() {
		return validity;
	}

	public void setValidity(String validity) {
		this.validity = validity;
	}

	public String getCredentialType() {
		return credentialType;
	}

	public void setCredentialType(String credentialType) {
		this.credentialType = credentialType;
	}

	public String getCredentialCode() {
		return credentialCode;
	}

	public void setCredentialCode(String credentialCode) {
		this.credentialCode = credentialCode;
	}

	public String getIsEasyPay() {
		return isEasyPay;
	}

	public void setIsEasyPay(String isEasyPay) {
		this.isEasyPay = isEasyPay;
	}

	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
