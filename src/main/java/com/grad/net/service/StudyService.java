package com.grad.net.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.grad.net.repository.StudyDao;
import com.grad.net.vo.OrganzVo;
import com.grad.net.vo.StudyVo;


@Service
public class StudyService {
	

	@Autowired 
	StudyDao studyDao;
	
	
	public List<StudyVo> getMajorList(String boardtype){
		
		return studyDao.selectMajorList(boardtype);		
	}
	
	
	public List<StudyVo> getBoardList(List<Long> intMajorList, String boardtype){
		
		String type = null;
		
		
		if(boardtype.equals("공학")) {
			
			type="공학게시판";
			
		}else if(boardtype.equals("인문학")) {
			
			type="인문학게시판";
		}else if(boardtype.equals("사회과학")) {
			
			type="사회과학게시판";
		}else if(boardtype.equals("자연과학")) {
			
			type="자연과학게시판";
		}else if(boardtype.equals("의약학")) {
			
			type="의약학게시판";
		}else if(boardtype.equals("농수해양학")) {
			
			type="농수해양학게시판";
		}else if(boardtype.equals("예술체육학")) {
			
			type="예술체육학게시판";
		}else if(boardtype.equals("복합학")) {
			
			type="복합학게시판";
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("intMajorList", intMajorList);
		map.put("type", type);
		
		
		return studyDao.selectBoardList(map);		
	}
	
	
	public List<OrganzVo> getLabList(String boardtype) {
		return studyDao.getLabList(boardtype);
	}

	public List<OrganzVo> getLabCodeList() {
		return studyDao.getLabCodeList();
	}
	
	
	public List<StudyVo> getSearchList(String text) {
		return studyDao.getSearchList(text);
	}

}
