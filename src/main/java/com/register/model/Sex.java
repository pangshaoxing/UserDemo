package com.register.model;

public enum Sex {

	MALE(1,"MALE"),FEMALE(2,"FEMALE");
	private int id;
	private String name;
	
	private Sex(int id,String name){
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
