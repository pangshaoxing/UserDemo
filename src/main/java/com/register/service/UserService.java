package com.register.service;

import com.register.model.User;

public interface UserService {

	public int regiserUser(User user);
	
	public User loginUser(String userName, String passWord);
}
