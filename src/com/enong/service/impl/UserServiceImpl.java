package com.enong.service.impl;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.enong.bo.EUser;
import com.enong.service.interfaces.UserService;
import com.enong.utils.MD5Utils;

@InjectName("userServiceImpl")
@IocBean
public class UserServiceImpl implements UserService {
	
	@Inject
	Dao dao;

	public EUser register(EUser user) {
		return dao.insert(user);
	}

	public EUser findUserByEmail(String email) {
		return dao.fetch(EUser.class, email);
	}

	public EUser findUserByPhone(String phone) {
		return dao.fetch(EUser.class, Cnd.where("phone", "=", phone));
	}

	public void changePassword(Long userId,String newPassword) {
		String salt = MD5Utils.createSalt();
		String password = MD5Utils.createPassword(newPassword, salt);
		EUser user = dao.fetch(EUser.class, userId);
		user.setSalt(salt);
		user.setPassword(password);
		dao.update(user);
	}

	@Override
	public EUser findUserById(Long userId) {
		// TODO Auto-generated method stub
		return dao.fetch(EUser.class, userId);
	}

	@Override
	public int updataUserData(EUser user) {
		return dao.update(user);
	}

}
