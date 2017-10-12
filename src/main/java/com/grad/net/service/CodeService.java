package com.grad.net.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.net.repository.CodeDao;
import com.grad.net.vo.CodeVo;


@Service
public class CodeService {	
	
	@Autowired
	private CodeDao CodeDao;	
	

	public List<CodeVo> getCodeList(){	

		return CodeDao.getCodeList();		
	}
	
	
	
	public List<CodeVo> getMajorList(String type) {

		String type2 = null;

		if (type.equals("공학")) {

			type2 = "D%";

		} else if (type.equals("의약학")) {

			type2 = "E%";

		} else if (type.equals("인문학")) {

			type2 = "A%";

		} else if (type.equals("사회과학")) {

			type2 = "B%";

		} else if (type.equals("자연과학")) {

			type2 = "C%";

		} else if (type.equals("농수해양학")) {

			type2 = "F%";

		} else if (type.equals("예술체육학")) {

			type2 = "G%";

		} else if (type.equals("복합학")) {

			type2 = "H%";

		}

		return CodeDao.selectMajorList(type2);
	}
	

	
	public List<CodeVo> getStudyList(){
		return CodeDao.selectStudyList();	
	}
}
