package com.grad.net;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.net.security.Auth;
import com.grad.net.security.AuthUser;
import com.grad.net.service.CodeService;
import com.grad.net.service.CounselingService;
import com.grad.net.service.MemberService;
import com.grad.net.service.NotiService;
import com.grad.net.service.OrganzService;
import com.grad.net.service.StudyService;
import com.grad.net.vo.CodeVo;
import com.grad.net.vo.CounselingVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.NotiVo;
import com.grad.net.vo.OrganzVo;
import com.grad.net.vo.StudyVo;

import net.sf.json.JSONArray;


@Controller
public class HomeController {


	@Autowired
	CounselingService counselingService;


	@Autowired
	NotiService notiService;

	@Autowired
	CodeService codeService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	StudyService studyService;
	
	@Autowired
	OrganzService organzService;
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model, MemberVo memberVo) {	
		model.addAttribute("MemberVo", memberVo);		
		return "submain";
	}
 

	/*
	 * 정예린, 2017-09-25, 서브메인 
	 */

	@SuppressWarnings("static-access")
	@RequestMapping(value = "/submain", method = RequestMethod.GET)
	public String submain(Model model, @AuthUser MemberVo authUser) {


		if(authUser != null) {
			List<CodeVo> codeList = memberService.getinfoList(authUser);
			List<StudyVo> BoardList = new ArrayList<StudyVo>();
			List<StudyVo> tempBoardList = memberService.getArticleByInfo(codeList,-1l);
			
			for(int i=0;i<tempBoardList.size();i++) {
				if(tempBoardList.get(i).getSlctnNotiDstnct().equals("대학원") || tempBoardList.get(i).getSlctnNotiDstnct().equals("연구실"))
					BoardList.add(tempBoardList.get(i));
			}

			for(int i=0;i<BoardList.size();i++) {

				if(BoardList.get(i).getSlctnNotiDstnct().equals("연구실")) {
					BoardList.get(i).setResearchList(memberService.getReasearchList(BoardList.get(i).getSlctnNotiNo()));
				}
			}
			
			model.addAttribute("myBoardList", BoardList);

		}



		JSONArray jsonArray = new JSONArray();
		model.addAttribute("codeList", codeService.getStudyList());
		model.addAttribute("gradList", notiService.getGradNotiList());
		model.addAttribute("labList", notiService.getLabNotiList());
		model.addAttribute("labCodeList", notiService.getLabCodeList());
		model.addAttribute("notiCount", notiService.getNotiCount());

		if (authUser != null) {
			model.addAttribute("scrapList", memberService.getScrapList(authUser.getMbNo()));
			model.addAttribute("scrapList", jsonArray.fromObject(memberService.getScrapList(authUser.getMbNo())));
		}

		model.addAttribute("gradList", jsonArray.fromObject(notiService.getGradNotiList()));
		model.addAttribute("labList", jsonArray.fromObject(notiService.getLabNotiList()));
		return "submain";
	}
	
	
	/*
	 * 정예린, 2017-09-27, 헤더 검색 기능 
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, @RequestParam(value = "text", required = true, defaultValue = "테스트") String text) {
	
		List<OrganzVo> organzList=new ArrayList<OrganzVo>();
		List<NotiVo> notiList=new ArrayList<NotiVo>();
		List<CounselingVo> counselingList=new ArrayList<CounselingVo>();
		

		for(StudyVo studyVo : studyService.getSearchList(text)) {
			
			if(studyVo.getSlctnNotiDstnct().equals("대학원") || studyVo.getSlctnNotiDstnct().equals("연구실")) {
				notiList.add(notiService.getNoti(studyVo.getSlctnNotiDstnct(), studyVo.getSlctnNotiNo().intValue()));   
				
			}else if(studyVo.getSlctnNotiDstnct().equals("게시글")) {				
				counselingList.add(counselingService.getCounselingPrnts(studyVo.getSlctnNotiNo()));
				
			}else if(studyVo.getSlctnNotiDstnct().equals("기관")) {				
				organzList.add(organzService.getOrganzByNo(studyVo.getSlctnNotiNo().intValue()));				
			}
		}
		

		
		model.addAttribute("notiList", notiList);
		model.addAttribute("organzList", organzList);
		model.addAttribute("counselingList", counselingList);
		
		
		return "search";
	}



}
