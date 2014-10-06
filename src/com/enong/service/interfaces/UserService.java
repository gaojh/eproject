package com.enong.service.interfaces;

import com.enong.bo.EUser;

public interface UserService {

	public EUser register(EUser user);
	
	public EUser findUserByEmail(String email);
	
	public EUser findUserByPhone(String phone);
	
	public EUser findUserById(Long userId);
	
	public void changePassword(Long userId,String newPassword);
	
	public int updataUserData(EUser user);
	
}
