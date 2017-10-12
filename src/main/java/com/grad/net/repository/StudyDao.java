package com.grad.net.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.net.vo.OrganzVo;
import com.grad.net.vo.StudyVo;




@Repository
public class StudyDao {
	
	@Autowired
	private SqlSession sqlSession;


	public List<StudyVo> selectMajorList(String boardtype) {
		
		return sqlSession.selectList("study.selectMajorList", boardtype);
		
		
	}
	
	public List<StudyVo> selectBoardList(Map<String, Object> map){
		

		
		return sqlSession.selectList("study.selectBoardList", map);		
		
		
	}
	

	public List<OrganzVo> getLabList(String boardtype) {
		
		return sqlSession.selectList("organz.getLabList", boardtype);
	}


	public List<OrganzVo> getLabCodeList() {
		return sqlSession.selectList("organz.getLabCodeList");
	}
	
	
	public List<StudyVo> getSearchList(String text) {
		return sqlSession.selectList("study.getSearchList",text);
	}

}
