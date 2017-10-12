package com.grad.net.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.net.vo.CounselingVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.NotiVo;





@Repository
public class CounselingDao {
	
	
	@Autowired
	private SqlSession sqlSession;
	

	public void insert(CounselingVo counselingVo) {
		sqlSession.insert("counseling.insert",counselingVo);
	}
	

	public List<CounselingVo> getCounselingList(Map<String, Object> map) {
		
		return sqlSession.selectList("counseling.getcounselingList", map);
		
		
	}

	public List<CounselingVo> getReplyList() {
		return sqlSession.selectList("counseling.getReplyList");
	}

	public CounselingVo getCounselingPrnts(Long no) {
		CounselingVo vo = sqlSession.selectOne("counseling.getcounselingPrnts", no);
		return vo;
	}
	
	
	public List<CounselingVo> getReplyDetail(Long no) {
		return sqlSession.selectList("counseling.getReplyDetail", no);
	}

	

	public void insertReply(CounselingVo counselingVo) {
		sqlSession.insert("counseling.insertReply",counselingVo);
	}
	
	
	public void updateFindCo(Long no) {
		sqlSession.update("counseling.updateFindCo",no);
	}
	

	public List<CounselingVo> getLike(Map<String, Object> map){
		
		return sqlSession.selectList("counseling.getLike", map);
	}
	
	
	public CounselingVo selectLikeOne(Map<String, Object> map) {
		CounselingVo vo = sqlSession.selectOne("counseling.selectLikeOne", map);
		return vo;
	}
	
	
	public void deleteLike(Map<String, Object> map) {
		
		sqlSession.delete("counseling.deleteLike",map);

	}
	
	
	public void insertLike(Map<String, Object> map) {
		
		sqlSession.insert("counseling.insertLike",map);

	}
	

	public void updateDownLike(Long wrtbtNo) {
		sqlSession.update("counseling.updateDownLike",wrtbtNo);
	}

	

	public void updateDownDislike(Long wrtbtNo) {
		sqlSession.update("counseling.updateDownDislike",wrtbtNo);
	}


	public void updateUpLike(Long wrtbtNo) {
		sqlSession.update("counseling.updateUpLike",wrtbtNo);
		
	}


	public void updateUpDislike(Long wrtbtNo) {
		sqlSession.update("counseling.updateUpDislike",wrtbtNo);
	}
	
	

	public int lastInsertId() {
		return sqlSession.selectOne("counseling.lastInsertId");
	}
	

	
	public int countCounList(String type) {
		return sqlSession.selectOne("counseling.countCounList",type);
	}


	public List<CounselingVo> countCounList(Map<String, Object> map) {
		return sqlSession.selectList("counseling.getCounList",map);
	}
	

	public List<MemberVo> getScrapList(Long user) {
		return sqlSession.selectList("counseling.getScrapList",user);
	}
}
