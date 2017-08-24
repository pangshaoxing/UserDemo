package com.chemical.service;

import java.util.List;

import com.register.model.Chemical;

public interface ChemicalService {

	public List<Chemical> selectChemicalInfo(Chemical chemical);
	
	public int addChemicalInfo(Chemical chemical);
	
}
