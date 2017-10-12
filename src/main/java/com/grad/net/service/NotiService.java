package com.grad.net.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.net.repository.NotiDao;
import com.grad.net.vo.NotiVo;
import com.grad.net.vo.StudyVo;

@Service
public class NotiService {
	
	@Autowired
	NotiDao notiDao;


	public List<NotiVo> getNotiList(String type) {
		
		return notiDao.getNotiList(type);
	}

	public List<NotiVo> getNotiListByPage(int page, String type) {
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("page", page-1);
		map.put("type", type);
		return notiDao.getNotiListByPage(map);
	}
	

	public NotiVo getNoti(String tabnm, int no, Long userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tabnm", tabnm);
		map.put("no", no);
		map.put("userid", userid);
		
		
		return notiDao.getByNo(map);

	}
	
	public NotiVo getNoti(String tabnm, int no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tabnm", tabnm);
		map.put("no", no);
		
		return notiDao.getByNo(map);

	}
	

	public List<StudyVo> getGradNotiList() {

		return notiDao.getGradNotiList();
	}


	public List<StudyVo> getLabNotiList() {
		return notiDao.getLabNotiList();
	}


	public List<StudyVo> getLabCodeList() {
		return notiDao.getLabCodeList();
	}


	public List<StudyVo> getLabCodeList(int no) {
		return notiDao.getLabCodeList(no);
	}

	
	public int getNotiCount() {
		return notiDao.getNotiCount();
	}

}
