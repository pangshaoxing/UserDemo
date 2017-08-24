package com.chemical.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chemical.service.Impl.ChemicalServiceImpl;
import com.register.model.Chemical;

@Controller
public class ChemicalController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ChemicalServiceImpl chemicalServiceImpl;
	
	private List<Chemical> chemicalList;
	
	@RequestMapping("/chemicalInfoAdd")
	public Chemical addChemicalInfo(Chemical chemical){
		
		int a = chemicalServiceImpl.addChemicalInfo(chemical);
		
		return chemical;
	}
	
	@RequestMapping("/chemicalInfoSelect.action")
	@ResponseBody
	public List<Chemical> selectChemicalInfo(Chemical chemical){
		chemicalList = new ArrayList<Chemical>();
		if(chemical!=null){
			chemicalList = chemicalServiceImpl.selectChemicalInfo(chemical);
		}
		return chemicalList;
	}
}
