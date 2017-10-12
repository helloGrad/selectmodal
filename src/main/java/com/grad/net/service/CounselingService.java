package com.grad.net.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.net.repository.CounselingDao;
import com.grad.net.vo.CounselingVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.NotiVo;
import com.grad.net.vo.PageVo;





@Service
public class CounselingService {
	
	@Autowired
	CounselingDao counselingDao;
	

	public void setWrite(CounselingVo counselingVo) {
	
		counselingDao.insert(counselingVo);

	}

	public List<CounselingVo> getCounselingList(String type,String order,Long startNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("order", order);
		map.put("startNo",startNo);
		
		return counselingDao.getCounselingList(map);
	}


	public List<CounselingVo> getReplyList() {
		
		return counselingDao.getReplyList();
	}
	
	
	public  CounselingVo getCounselingPrnts(Long no) {
		
		return counselingDao.getCounselingPrnts(no);
	}
	

	public List<CounselingVo> getCounselingReplyDetail(Long no) {
		
		return counselingDao.getReplyDetail(no);
	}
	

	public void setReplyWrite(CounselingVo counselingVo) {
		
		counselingDao.insertReply(counselingVo);

	}
	
	
	public void ChangefindCo(Long no) {
		
		counselingDao.updateFindCo(no);

	}
	
	
	public List<CounselingVo> existLike(Long mbNo,Long no){
		
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("mbNo", mbNo);
		map.put("no", no);
		
		return counselingDao.getLike(map);
		
	}
	

	public  CounselingVo existLikeOne(Long mbNo,Long no) {
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("mbNo", mbNo);
		map.put("no", no);
		
		return counselingDao.selectLikeOne(map);
	}
	
	
	public void deleteLike(Long mbNo, Long wrtbtNo, String infroDstnct) {
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("mbNo", mbNo);
		map.put("wrtbtNo", wrtbtNo);
		
		if(infroDstnct.equals("like")==true) {
			
			counselingDao.updateDownLike(wrtbtNo);
			
		}
		if(infroDstnct.equals("dislike")==true) {
			
			
			counselingDao.updateDownDislike(wrtbtNo);
		}
		
		
		counselingDao.deleteLike(map);
		

	}

	public void setLike(Long mbNo, Long wrtbtNo, String infroDstnct) {
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("mbNo", mbNo);
		map.put("wrtbtNo", wrtbtNo);
		map.put("infroDstnct", infroDstnct);
		
		if(infroDstnct.equals("like")==true) {
			
			counselingDao.updateUpLike(wrtbtNo);
			
		}
		if(infroDstnct.equals("dislike")==true) {
			
			
			counselingDao.updateUpDislike(wrtbtNo);
		}
		
		
		counselingDao.insertLike(map);

	}
	
	
	public int lastInsertId() {
		return counselingDao.lastInsertId();
	}
	

	public int countCounList(String type) {
		
		return counselingDao.countCounList(type);
	}

	

	public List<CounselingVo> getCounList(String type, String order, PageVo pageVo) {
		Map<String, Object> map =  new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("order", order);
		map.put("pageVo", pageVo);
		
		return counselingDao.countCounList(map);
	}
	

	public List<MemberVo> getScrapList(Long user) {
		return counselingDao.getScrapList(user);
	}
}
