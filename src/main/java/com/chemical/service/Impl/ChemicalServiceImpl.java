package com.chemical.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.chemical.service.ChemicalService;
import com.register.model.Chemical;

@Controller
public class ChemicalServiceImpl implements ChemicalService {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Chemical> selectChemicalInfo(Chemical chemical) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chemicalName", chemical.getChemicalName());
		map.put("chemicalPrice", chemical.getChemicalPrice());
		List<Chemical> chemicalList = sqlSession.selectList("com.chemical.dao.selectChemicalInfo", map);
		return chemicalList;
	}

	public int addChemicalInfo(Chemical chemical) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("chemicalName",chemical.getChemicalName());
		map.put("chemicalPrice", chemical.getChemicalPrice());
		map.put("chemicalSales", chemical.getChemicalSales());
		
		int a = sqlSession.insert("com.chemical.dao.addChemicalInfo", map);
		return a;
	}

}
