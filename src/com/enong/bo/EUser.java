package com.enong.bo;

import java.io.Serializable;
import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("e_user")
public class EUser implements Serializable {

	private static final long serialVersionUID = 7629831433210854486L;

	@Id
	private Long id;

	@Column
	private String name;
	@Name
	private String email;
	@Column
	private String password;
	@Column
	private String salt;
	@Column
	private String phone;

	@Column("register_date")
	private Date registerDate;

	@Column
	private String type;// 管理员还是普通用户
	@Column
	private String state;// 状态
	@Column("email_validate")
	private String emailValidate;

	@Column("buy_habit")
	private String buyHabit;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getEmailValidate() {
		return emailValidate;
	}

	public void setEmailValidate(String emailValidate) {
		this.emailValidate = emailValidate;
	}

	public String getBuyHabit() {
		return buyHabit;
	}

	public void setBuyHabit(String buyHabit) {
		this.buyHabit = buyHabit;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
