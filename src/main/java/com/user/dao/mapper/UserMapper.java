package com.user.dao.mapper;

import org.apache.ibatis.annotations.Param;
import com.register.model.User;

public interface UserMapper {
		

	int addUser(
			@Param("user")User user
	);
	
	User userJudge(
			@Param("username")	String username
	);
	
	User userLogin(
			@Param("username")String username,
			@Param("password")String password
	);
	
}
