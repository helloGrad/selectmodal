package com.grad.net.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.net.vo.CodeVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.StudyVo;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;


	public boolean insert(MemberVo memberVo) {
		return (1==sqlSession.insert("member.insert", memberVo));
	}
	
	
	public void snsinsert(Map<String, Object> map) {		
		sqlSession.insert("member.snsinsert",map);		
	}


	public MemberVo getByToken(MemberVo memberVo) {
		return sqlSession.selectOne("member.getByToken", memberVo);
	}

	public MemberVo getByIden(String EMAIL) {
		return sqlSession.selectOne("member.getByIden", EMAIL);
	}

	
	public MemberVo getUser(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("member.getByLoginInfo", map);
	}

	
	public List<CodeVo> getMbinfoList(MemberVo memberVo) {
	
		Long mbNo = memberVo.getMbNo();
		return sqlSession.selectList("member.getInfoCodes", mbNo);
	}

	public void insertMbinfo(Long mbNo, String information) {				
		Map<String, Object> map= new HashMap<String, Object>(); 
		
		map.put("mbNo", mbNo);
		map.put("information", information);
		
		sqlSession.insert("member.insertMbinfo",map);		
	}
	
	public void infordelete(Long mbNo){		
		sqlSession.delete("member.deleteMbinfo",mbNo);		
	}
	

	public MemberVo getUser(String iden){
		return sqlSession.selectOne("member.getBySns", iden);
	}

	
	public void updateInfoYn(Long mbNo){
		
		sqlSession.update("member.updateInfoYn", mbNo);
	}


	public boolean insertScrap(Map<String, Object> map) {
		return sqlSession.insert("member.insertScrap",map)==1; 
	}


	public boolean deleteScrap(Map<String, Object> map) {
		return sqlSession.delete("member.deleteScrap",map)==1; 
	}

	public List<MemberVo> getScrapList(Long mbNo) {
		return sqlSession.selectList("member.getScrapList", mbNo);
	}
	

	public MemberVo getUserByToken(String token) {
		return sqlSession.selectOne("member.getBySnsToken", token);
	}
	

	
	public boolean insertStudys(Map<String, Object> map) {
		return (1==sqlSession.insert("member.insertStudys", map));
		
	}
	
	
	public boolean insertStudysFacebook(Map<String, Object> map) {
		return (1==sqlSession.insert("member.insertStudysFacebook", map));
	}


	public void deleteInfoByType(Map<String, Object> map) {
		sqlSession.delete("member.deleteInfoByType", map);
		
	}


	public void insertinfo(Map<String, Object> map) {
		sqlSession.insert("member.insertinfo", map);
		
	}


	public List<CodeVo> getResearchCode(List<String> researchNames) {
		return sqlSession.selectList("member.getResearchCode", researchNames);
	}


	public MemberVo getprivateInfo(Long mbNo) {
		
		return sqlSession.selectOne("member.getprivateInfo", mbNo);
	}


	public boolean updateNknm(Map<String, Object> map) {
		
		return (1==sqlSession.update("member.updateNknm", map));
	}


	public boolean updateMbDstnct(Map<String, Object> map) {
		
		return (1==sqlSession.update("member.updateMbDstnct", map));
	}


	public List<CodeVo> getinfoList(MemberVo authUser) {
		Long mbNo = authUser.getMbNo();
		return sqlSession.selectList("member.getCodes", mbNo);
	}


	public List<StudyVo> getArticleByInfo(Map<String, Object> map) {
		return sqlSession.selectList("member.getArticleByInfo", map);
	}


	public List<CodeVo> getReasearchList(Long slctnNotiNo) {
		return sqlSession.selectList("member.getReasearchList", slctnNotiNo);
	}


	public List<StudyVo> getMyBoardList(Long mbNo) {
		return sqlSession.selectList("member.getMyBoardList", mbNo);
	}


	public List<CodeVo> getBoardScrapList(Long mbNo) {
		return sqlSession.selectList("member.getBoardScrapList", mbNo);
	}
	
	
	public MemberVo existNknm(String nknm) {
		return sqlSession.selectOne("member.existNknm", nknm);
	}


}
