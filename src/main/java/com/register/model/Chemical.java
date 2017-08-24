package com.register.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="chemical")
public class Chemical  implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int chemicalId;
	private String chemicalName;
	private double chemicalPrice;
	private int chemicalSales;
	private String picturePath;
	private Integer user_id;
	

	public Chemical() {

	}
	
	@ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH},fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id",insertable = false, updatable = false)
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Chemical(int chemicalId,String chemicalName,double chemicalPrice,
					int chemicalSales,String picturePath,int user_id){
		this.chemicalId = chemicalId;
		this.chemicalName = chemicalName;
		this.chemicalPrice = chemicalPrice;
		this.chemicalSales = chemicalSales;
		this.picturePath = picturePath;
		this.user_id = user_id;
	}

	public int getChemicalId() {
		return chemicalId;
	}

	public void setChemicalId(int chemicalId) {
		this.chemicalId = chemicalId;
	}

	public String getChemicalName() {
		return chemicalName;
	}

	public void setChemicalName(String chemicalName) {
		this.chemicalName = chemicalName;
	}

	public double getChemicalPrice() {
		return chemicalPrice;
	}

	public void setChemicalPrice(double chemicalPrice) {
		this.chemicalPrice = chemicalPrice;
	}

	public int getChemicalSales() {
		return chemicalSales;
	}

	public void setChemicalSales(int chemicalSales) {
		this.chemicalSales = chemicalSales;
	}

	public String getPicturePath() {
		return picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	
}
