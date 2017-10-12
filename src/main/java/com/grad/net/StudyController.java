package com.grad.net;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.grad.net.security.Auth;
import com.grad.net.security.AuthUser;
import com.grad.net.service.ApndngFileService;
import com.grad.net.service.CodeService;
import com.grad.net.service.MemberService;
import com.grad.net.service.NotiService;
import com.grad.net.service.StudyService;
import com.grad.net.vo.CodeVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.NotiVo;
import com.grad.net.vo.OrganzVo;
import com.grad.net.vo.ResrchAcrsltVo;
import com.grad.net.vo.StudyVo;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/study")
public class StudyController {
	
	
	@Autowired
	StudyService studyService;
	
	
	@Autowired
	CodeService codeService;
	
	
	@Autowired
	NotiService notiService;
	
	@Autowired
	MemberService memberService;

	/*
	 * 박가혜, 2017-09-13, 학문별 메인페이지
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String studyHome(Model model, MemberVo memberVo, @RequestParam("boardtype") String boardtype, @AuthUser MemberVo authUser) {

		model.addAttribute("authUser", authUser);
		model.addAttribute("boardtype", boardtype);


		List<Map<String, Object>> calList = new ArrayList<Map<String, Object>>();

		Calendar oCalendar = Calendar.getInstance(); 

		int year;
		int month;
		int day;
		int week1;
		String week = null;
		
		
		for (int i = 0; i < 7; i++) {

			if (i != 0) {
				oCalendar.add(Calendar.DATE, -1);
			}

			year = oCalendar.get(Calendar.YEAR);
			month = (oCalendar.get(Calendar.MONTH) + 1);
			day = oCalendar.get(Calendar.DAY_OF_MONTH);
			week1 = oCalendar.get(Calendar.DAY_OF_WEEK);
			
			
			if (week1 == 1) {

				week = "일요일";

			} else if (week1 == 2) {

				week = "월요일";
			} else if (week1 == 3) {

				week = "화요일";
			} else if (week1 == 4) {

				week = "수요일";
			} else if (week1 == 5) {

				week = "목요일";
			} else if (week1 == 6) {

				week = "금요일";
			} else if (week1 == 7) {

				week = "토요일";
			}

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("year", year);
			map.put("month", month);
			map.put("day", day);
			map.put("week", week);

			calList.add(i, map);

		}
		

		model.addAttribute("calList", calList);
		
		List<StudyVo> majorList = studyService.getMajorList(boardtype);
		
		
		List<Long> intMajorList = new ArrayList<Long>();
		
		for(int i=0; i<majorList.size(); i++) {
			
			intMajorList.add(majorList.get(i).getSlctnNotiNo());
			
		}
		
		
		List<StudyVo> BoardList = studyService.getBoardList(intMajorList,boardtype);
		
		
		
		int orderNum =0;
		
		for(int i=0; i<BoardList.size(); i++) {
			
				if(i>0) {
					
					orderNum = orderNum +1;
				}
			
			
				if(i>0 && !BoardList.get(i).getDay().equals(BoardList.get(i-1).getDay())){
				
				orderNum = 0;
				}
				
				
			
			BoardList.get(i).setOrderNum(orderNum);
			
			
			
			
		}
		model.addAttribute("majorList", majorList);
		model.addAttribute("BoardList", BoardList);
		
		
		
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("codeList", codeService.getStudyList());
		model.addAttribute("gradList", notiService.getGradNotiList());
		model.addAttribute("labList", notiService.getLabNotiList());
		model.addAttribute("labCodeList", notiService.getLabCodeList());
		
		if (authUser != null) {
			model.addAttribute("scrapList", memberService.getScrapList(authUser.getMbNo()));
			model.addAttribute("scrapList", jsonArray.fromObject(memberService.getScrapList(authUser.getMbNo())));
		}
		
		model.addAttribute("gradList", jsonArray.fromObject(notiService.getGradNotiList()));
		model.addAttribute("labList", jsonArray.fromObject(notiService.getLabNotiList()));
		
		
		

		return "study/home";
	}

	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String home1(Locale locale, Model model, @RequestBody MemberVo memberVo) {
	

		return "study/home";
	}

	
	/*
	 * 박가혜, 2017-09-21, 학문별 모집공고 페이지
	 */
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String studyNotice(Model model, MemberVo memberVo, @RequestParam("boardtype") String boardtype, @AuthUser MemberVo authUser) {
		
		
		List<CodeVo> codeList = codeService.getMajorList(boardtype);
		
		
		
		for(int i=0; i< codeList.size(); i++) {
			
			if(codeList.get(i).getCdDstnct().equals("학과")) {
				
				
			}
			
			
		}
		
		List<StudyVo> majorList = studyService.getMajorList(boardtype);
		
		
		List<Long> intMajorList = new ArrayList<Long>();
		
		for(int i=0; i<majorList.size(); i++) {
			
			intMajorList.add(majorList.get(i).getSlctnNotiNo());
			
		}
		
		
		model.addAttribute("majorList2", majorList);
		
		
		List<StudyVo> BoardList = studyService.getBoardList(intMajorList,boardtype);
		
		for(int i=0; i< majorList.size(); i++) {
			
			if(i < majorList.size()-1 && majorList.get(i).getSlctnNotiNo().equals(majorList.get(i+1).getSlctnNotiNo() ) && majorList.get(i).getSpCdNm().equals(majorList.get(i+1).getSpCdNm())) {
				
				
				majorList.get(i+1).setSpCdNm(null);
			}
		
			
		}
		
		
		model.addAttribute("codeList2", codeList);
		model.addAttribute("MemberVo", memberVo);
		model.addAttribute("boardtype", boardtype);
		model.addAttribute("majorList", majorList);
		model.addAttribute("authUser", authUser);
		model.addAttribute("BoardList", BoardList);
		
		
		
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("codeList", codeService.getStudyList());
		model.addAttribute("gradList", notiService.getGradNotiList());
		model.addAttribute("labList", notiService.getLabNotiList());
		model.addAttribute("labCodeList", notiService.getLabCodeList());
		
		if (authUser != null) {
			model.addAttribute("scrapList", memberService.getScrapList(authUser.getMbNo()));
			model.addAttribute("scrapList", jsonArray.fromObject(memberService.getScrapList(authUser.getMbNo())));
		}
		
		model.addAttribute("gradList", jsonArray.fromObject(notiService.getGradNotiList()));
		model.addAttribute("labList", jsonArray.fromObject(notiService.getLabNotiList()));
		
		
		
		
		return "study/notice";
	}

	/*
	 * 박가혜, 학문별 토론 페이지
	 */
	@RequestMapping(value = "/discussion", method = RequestMethod.GET)
	public String studyDiscussion(Model model, @AuthUser MemberVo authUser,
			@RequestParam("boardtype") String boardtype) {
		
		
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("codeList", codeService.getStudyList());
		model.addAttribute("gradList", notiService.getGradNotiList());
		model.addAttribute("labList", notiService.getLabNotiList());
		model.addAttribute("labCodeList", notiService.getLabCodeList());
		
		if (authUser != null) {
			model.addAttribute("scrapList", memberService.getScrapList(authUser.getMbNo()));
			model.addAttribute("scrapList", jsonArray.fromObject(memberService.getScrapList(authUser.getMbNo())));
		}
		
		model.addAttribute("gradList", jsonArray.fromObject(notiService.getGradNotiList()));
		model.addAttribute("labList", jsonArray.fromObject(notiService.getLabNotiList()));
		
	

		model.addAttribute("boardtype", boardtype);
		model.addAttribute("authUser", authUser);

		return "study/discussion";
	}

	/*
	 * 박가혜, 학문별 연구분야 페이지 
	 */
	
	@RequestMapping(value = "/research", method = RequestMethod.GET)
	public String studyResearch(Model model, MemberVo memberVo, @RequestParam("boardtype") String boardtype) {

		model.addAttribute("MemberVo", memberVo);
		model.addAttribute("boardtype", boardtype);

		return "study/research";
	}


	/*
	 * 정예린, 학문별 연구실 페이지
	 */

	@RequestMapping(value = "/lab", method = RequestMethod.GET)
	public String studyLab(Model model, MemberVo memberVo, @RequestParam("boardtype") String boardtype) {
		
		
		model.addAttribute("MemberVo", memberVo);
		model.addAttribute("boardtype", boardtype);
		model.addAttribute("labList", studyService.getLabList(boardtype));
		model.addAttribute("labCodeList", studyService.getLabCodeList());

		
		return "study/lab";
	}

	
}
