package com.enong.bo;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;

@Table("e_address")
public class EAddress {

	@Id
	private long id;

	@Column("user_id")
	private long userId;

	@One(target = EDistrict.class, field = "district1")
	private EDistrict dist1;

	@One(target = EDistrict.class, field = "district2")
	private EDistrict dist2;

	@One(target = EDistrict.class, field = "district3")
	private EDistrict dist3;

	@One(target = EDistrict.class, field = "district4")
	private EDistrict dist4;

	@Column("district_1")
	private long district1;

	@Column("district_2")
	private long district2;

	@Column("district_3")
	private long district3;

	@Column("district_4")
	private long district4;

	@Column("address")
	private String address;

	@Column("symbolic_building")
	private String symbolicBuilding;

	@Column
	private String company;

	@Column
	private String consignee;

	@Column
	private String phone;

	@Column
	private String time;

	@Column("is_default")
	private String isDefault;

	@Column("create_date")
	private String createDate;

	@Column
	private String remark;

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

	public long getDistrict1() {
		return district1;
	}

	public void setDistrict1(long district1) {
		this.district1 = district1;
	}

	public long getDistrict2() {
		return district2;
	}

	public void setDistrict2(long district2) {
		this.district2 = district2;
	}

	public long getDistrict3() {
		return district3;
	}

	public void setDistrict3(long district3) {
		this.district3 = district3;
	}

	public long getDistrict4() {
		return district4;
	}

	public void setDistrict4(long district4) {
		this.district4 = district4;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSymbolicBuilding() {
		return symbolicBuilding;
	}

	public void setSymbolicBuilding(String symbolicBuilding) {
		this.symbolicBuilding = symbolicBuilding;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getConsignee() {
		return consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public EDistrict getDist1() {
		return dist1;
	}

	public void setDist1(EDistrict dist1) {
		this.dist1 = dist1;
	}

	public EDistrict getDist2() {
		return dist2;
	}

	public void setDist2(EDistrict dist2) {
		this.dist2 = dist2;
	}

	public EDistrict getDist3() {
		return dist3;
	}

	public void setDist3(EDistrict dist3) {
		this.dist3 = dist3;
	}

	public EDistrict getDist4() {
		return dist4;
	}

	public void setDist4(EDistrict dist4) {
		this.dist4 = dist4;
	}

}
