package com.register.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.register.model.Sex;
import com.register.model.User;
import com.register.service.Impl.UserServiceImpl;

@Controller
public class UserController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private UserServiceImpl serviceImpl;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/userJudge.action")
	@ResponseBody
	public User userJudge(String userName){
		//User user = sqlSession.selectOne("com.register.dao.userJudge", userName);
		User user = serviceImpl.judgeUserMapper(userName);
		return user;
	}
	
	@RequestMapping("/userRegister.action")
	public String userRegister(User user){
		if(user.getUserName()==null || user.getPassWord()==null){
			return "login.jsp";
		}
		user.setSex(Sex.FEMALE);
		//int index = serviceImpl.regiserUser(user);
		//serviceImpl.register_hiber(user);
		
		serviceImpl.registerUserMapper(user);
		
		request.setAttribute("username", user.getUserName());
		request.setAttribute("password", user.getPassWord());
		return "pages/register_success.jsp";
	}
	
	@RequestMapping("/userLogin.action")
	public String userLogin(String userName,String passWord){
		
		if(userName==null || passWord==null){
			return "pages/login_no.jsp";
		}
		
		//User user = serviceImpl.loginUser(userName, passWord);
		User user = serviceImpl.loginUserMapper(userName, passWord);
		
		if(user!=null){
			request.getSession().setAttribute("user", user);
			return "pages/login_ok.jsp";
		}else{
			return "pages/login_no.jsp";
		}
	}
	
	@RequestMapping("/userDelete.action")
	public String userDelete(String userName){
		if(userName==null){
			return "pages/login_no.jsp";
		}
		
		int a = serviceImpl.deleteUser(userName);
		
		if(a != 0){
			request.getSession().setAttribute("userName", userName);
			return "pages/login_ok.jsp";
		}else{
			return "pages/login_no.jsp";
		}
	}
	
	@RequestMapping("/userExit.action")
	public String UserExit(HttpSession session){
		session.invalidate();
		return "login.jsp";
	}
	
	@RequestMapping("/randomPicture.action")
	public void randomPicture() throws IOException{
		String sRand = serviceImpl.randomPicture();
		
		request.getSession().setAttribute("sRand", sRand);
		
		//return aa;
	}
}
