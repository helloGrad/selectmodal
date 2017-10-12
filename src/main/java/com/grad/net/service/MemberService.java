package com.grad.net.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.net.repository.MemberDao;
import com.grad.net.vo.CodeVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.StudyVo;



	

@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;

	public boolean register(MemberVo memberVo) {
		return memberDao.insert(memberVo);

	}


	public void snslogin(MemberVo memberVo, String snsnm) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (snsnm.equals("fb") || snsnm.equals("google")) {
			memberVo = changeData(memberVo, snsnm);
		}

		map.put("memberVo", memberVo);
		map.put("snsnm", snsnm);

		memberDao.snsinsert(map); 
	}

	public MemberVo getUser(String iden, String pw) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("iden", iden);
		map.put("pw", pw);

		return memberDao.getUser(map);

	}

	public boolean existEamil(String IDEN) {
		MemberVo memberVo = memberDao.getByIden(IDEN);
		return memberVo != null;
	}

	private MemberVo changeData(MemberVo memberVo, String snsnm) {

		if (memberVo.getSex().equals("female")) {
			memberVo.setSex("F");
			
		} else if (memberVo.getSex().equals("male")) {
			memberVo.setSex("M");
			
		} else {
			memberVo.setSex(null);
			
		}

		if (snsnm.equals("fb")) {
			String[] split = (memberVo.getBirdt()).split("/");
			memberVo.setBirdt(split[2] + split[0] + split[1]);

			if (memberVo.getIden().equals("") || memberVo.getIden().equals("undefined")) {
				memberVo.setIden(null);
				
			}
		}
		return memberVo;

	}

	public boolean checkMember(MemberVo memberVo) {
		MemberVo membervo = memberDao.getByToken(memberVo);
		return membervo != null;
	}

	public List<CodeVo> getMbinfoList(MemberVo memberVo) {

		return memberDao.getMbinfoList(memberVo);
	}

	public void registerMbinfo(Long mbNo, List<String> information) {

		for (int i = 0; i < information.size(); i++) {
			memberDao.insertMbinfo(mbNo, information.get(i));
		}
	}

	public void updateMbinfo(Long mbNo, String[] info) {

		memberDao.infordelete(mbNo);
		for (int i = 0; i < info.length; i++) {
			memberDao.insertMbinfo(mbNo, info[i]);
		}
	}
	
	
	
	public MemberVo getUser(String iden){


		return memberDao.getUser(iden);

	}
	
	public void changeInfoYn(Long mbNo){


		 memberDao.updateInfoYn(mbNo);

	}
	
	

	public boolean insertScrap(String type, String id, String user) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("type", type);
		map.put("id", id);
		map.put("user", user);
		return memberDao.insertScrap(map);
	}

	public boolean deleteScrap(String type, String id, String user) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("type", type);
		map.put("id", id);
		map.put("user", user);
		return memberDao.deleteScrap(map);
	}

	public List<MemberVo> getScrapList(Long mbNo) {
		return memberDao.getScrapList(mbNo);
	}
	
	
	public MemberVo getUserByToken(String token) {
		return memberDao.getUserByToken(token);
	}
	
	
	
	public void registerStudy(String iden, String studys,String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("iden", iden);
		map.put("studys", studys);
		map.put("type", type);
		memberDao.insertStudys(map);


	}
	
	
	public void registerStudyFacebook(String iden, String studys,String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("iden", iden);
		map.put("studys", studys);
		map.put("type", type);
		memberDao.insertStudysFacebook(map);

	}

	public void modifyMbinfo(String mbNo, String type, List<String> cdNames) {

		String dstnct = null;
		Map<String, Object> map = new HashMap<String, Object>();

		if(type.equals("study")) {
			dstnct = "학문";
		}else if(type.equals("purpose")) {
			dstnct = "방문목적";
		}else if(type.equals("ar")){
			dstnct = "지역";
		}else {
			dstnct = "연구분야";
		}

		map.put("dstnct", dstnct);
		map.put("mbNo", mbNo);
		memberDao.deleteInfoByType(map);

		for(int i=0;i<cdNames.size();i++) {
			map.put("cdNames", cdNames.get(i));
			memberDao.insertinfo(map);
		}




	}

	public List<CodeVo> getResearchCode(List<String> researchNames) {
		return memberDao.getResearchCode(researchNames);
	}

	public MemberVo getprivateInfo(MemberVo authUser) {
		return memberDao.getprivateInfo(authUser.getMbNo());
	}

	public boolean updateNknm(String mbNo, String nknm) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mbNo", mbNo);
		map.put("nknm", nknm);
		return memberDao.updateNknm(map);
		
	}

	public boolean updateMbDstnct(String mbNo, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mbNo", mbNo);
		map.put("email", email);
		
		return memberDao.updateMbDstnct(map);
		
	}

	public List<CodeVo> getinfoList(MemberVo authUser) {
		return memberDao.getinfoList(authUser);
	}

	public List<StudyVo> getArticleByInfo(List<CodeVo> codeList, Long long1) {
		
		List<String> studyList = new ArrayList<String>();
		List<String> purposeList = new ArrayList<String>();
		List<String> researchList = new ArrayList<String>();
		List<String> arList = new ArrayList<String>();
		List<String> boardList = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(long1 == -1) {
			for(int i=0;i<codeList.size();i++){
				String type = codeList.get(i).getCdDstnct();
				String data = codeList.get(i).getCdNm();
				
				if(type.equals("학문")) {
					studyList.add(data);
					boardList.add(data+"게시판");
				}else if(type.equals("방문목적")) {
					purposeList.add(data);
				}else if(type.equals("연구분야")) {
					researchList.add(data);
				}else if(type.equals("지역")) {
					arList.add(data);
				}
			}
		}
		
		map.put("mbNo", long1);
		map.put("studyList", studyList);
		map.put("purposeList", purposeList);
		map.put("researchList", researchList);
		map.put("arList", arList);
		map.put("studyListSize", studyList.size());
		map.put("purposeListSize", purposeList.size());
		map.put("researchListSize", researchList.size());
		map.put("arListSize", arList.size());
		map.put("boardList", boardList);
		
		
		
		
		return memberDao.getArticleByInfo(map);
	}

	public List<CodeVo> getReasearchList(Long slctnNotiNo) {
		return memberDao.getReasearchList(slctnNotiNo);
	}

	public List<StudyVo> getMyBoardList(MemberVo authUser) {
		return memberDao.getMyBoardList(authUser.getMbNo());
	}

	public List<CodeVo> getBoardScrapList(MemberVo authUser) {
		return memberDao.getBoardScrapList(authUser.getMbNo());
	}
	
	
	public boolean existNknm(String nknm) {
		MemberVo vo = memberDao.existNknm(nknm);
		if(vo==null){
			return false;
		}
		return true;
	}
	
}
