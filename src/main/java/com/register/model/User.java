package com.register.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name="userInfo")
public class User implements Serializable{

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Integer user_id;
	
	@Column(name = "username")
	private String userName;
	
	@Column(name = "password")
	private String passWord;
	
	@Column(name = "sex")
	private Sex sex;
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="user")    
	private Set<Chemical> chemicalist; 
	//private Set<Chemical> chemicalList;

	public User(){
		
	}
	
	public User(Integer user_id,String userName,String passWord,Sex sex){
		this.user_id = user_id;
		this.userName = userName;
		this.passWord = passWord;
		this.sex = sex;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}
	
	public Sex getSex() {
		return sex;
	}

	public void setSex(Sex sex) {
		this.sex = sex;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public Set<Chemical> getChemicalist() {
		return chemicalist;
	}

	public void setChemicalist(Set<Chemical> chemicalist) {
		this.chemicalist = chemicalist;
	}
	
}
