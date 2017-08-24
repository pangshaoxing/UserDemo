package com.register.service.Impl;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.register.model.User;
import com.register.service.UserService;
import com.user.dao.mapper.UserMapper;

@Controller
public class UserServiceImpl implements UserService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	SessionFactory factory;
	
	Session session = null;
	
	private ByteArrayInputStream inputStream;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private UserMapper userMapper;
	
	//*******************Mapper Interface*********************
	public User judgeUserMapper(String username){
		
		User user = userMapper.userJudge(username);
		return user;
		
	}
	
	public int registerUserMapper(User user){
		int index = 0;
		if(user!=null){
			index = userMapper.addUser(user);
			System.out.println(user.getUser_id());
		}
		
		return index;
		
	}
	
	public User loginUserMapper(String userName,String passWord){
		User user = userMapper.userLogin(userName, passWord);
		return user;
	}
	
	//**************************general******************
	
	public int regiserUser(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", user.getUserName());
		map.put("passWord", user.getPassWord());
		int a = sqlSession.insert("com.register.dao.addUser",map);
		return a;
	}

	public User loginUser(String userName, String passWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("passWord", passWord);
		User user = sqlSession.selectOne("com.register.dao.userLogin",map);
		return user;
	}
	
	//hibernate reginster
	public void register_hiber(User user){
		//Configuration cfg = new Configuration().configure();
		
		//SessionFactory factory = cfg.buildSessionFactory();
		
		try{
			session = factory.openSession();
			session.beginTransaction();
			
			session.save(user);
			session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			if(session != null){
				if(session.isOpen()){
					session.close();
				}
			}
		}
	}
	
	public int deleteUser(String userName){
		try{
			session = factory.openSession();
			session.beginTransaction();
			
			String hqlString = "delete User where userName = :userName";
			
			int deleteEntities = session.createQuery(hqlString)
					.setString("userName", userName)
					.executeUpdate();
			session.getTransaction().commit();
			return deleteEntities;
		}catch(Exception e){
			e.printStackTrace();
			session.getTransaction().rollback();
			return 0;
		}finally{
			if(session != null){
				if(session.isOpen()){
					session.close();
				}
			}
		}
	}
	
	public String randomPicture() throws IOException{
		Date d = new Date();
		 
	     int width = 60; int height = 20;
	     BufferedImage image = new BufferedImage(width, height, 1);
	 
	     Graphics g = image.getGraphics();
	 
	     Random random = new Random();
	 
	     g.setColor(getRandColor(200, 250));
	     g.fillRect(0, 0, width, height);
	 
	     g.setFont(new Font("Times New Roman", 0, 18));
	 
	     g.setColor(getRandColor(160, 200));
	     for (int i = 0; i < 155; i++)
	     {
	       int x = random.nextInt(width);
	       int y = random.nextInt(height);
	       int xl = random.nextInt(12);
	       int yl = random.nextInt(12);
	       g.drawLine(x, y, x + xl, y + yl);
	     }
	 
	     String sRand = "";
	     for (int i = 0; i < 4; i++)
	     {
	       String rand = String.valueOf(random.nextInt(10));
	       sRand = sRand + rand;
	 
	       g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
	 
	       g.drawString(rand, 13 * i + 6, 16);
	     }
	 
	     HttpSession session = getRequest().getSession(true);
	     session.setAttribute("randomCode", sRand);
	 
	     g.dispose();
	     ByteArrayOutputStream output = new ByteArrayOutputStream();
	     ImageOutputStream imageOut = ImageIO.createImageOutputStream(output);
	     ImageIO.write(image, "JPEG", imageOut);
	     imageOut.close();
	     ByteArrayInputStream input = new ByteArrayInputStream(output.toByteArray());
	     output.close();
	     setInputStream(input);
	 
	     return sRand;
	}
	
	public static int computeStringByteLen(String s)
	   {
	     int length = 0;
	     for (int t = 0; t < s.length(); t++)
	     {
	       if (s.charAt(t) > 'ÿ')
	       {
	         length += 2;
	       }
	       else
	       {
	         length += 1;
	       }
	     }
	     return length;
	   }
	 
	   private Color getRandColor(int fc, int bc)
	   {
	     Random random = new Random();
	     if (fc > 255)
	       fc = 255;
	     if (bc > 255)
	       bc = 255;
	     int r = fc + random.nextInt(bc - fc);
	     int g = fc + random.nextInt(bc - fc);
	     int b = fc + random.nextInt(bc - fc);
	     return new Color(r, g, b);
	   }
	 
	   public void setInputStream(ByteArrayInputStream inputStream)
	   {
	     this.inputStream = inputStream;
	   }
	 
	   public ByteArrayInputStream getInputStream()
	   {
	     return this.inputStream;
	   }

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	   
}
