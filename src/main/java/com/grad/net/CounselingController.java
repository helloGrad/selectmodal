package com.grad.net;



import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.grad.net.security.Auth;
import com.grad.net.security.AuthUser;
import com.grad.net.service.ApndngFileService;
import com.grad.net.service.CodeService;
import com.grad.net.service.CounselingService;
import com.grad.net.service.MemberService;
import com.grad.net.service.NotiService;
import com.grad.net.vo.ApndngFileVo;
import com.grad.net.vo.CounselingVo;
import com.grad.net.vo.MemberVo;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/counseling")
public class CounselingController {
	
	
	@Autowired
	CounselingService counselingService;
	
	@Autowired
	ApndngFileService apndngFileService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	NotiService notiService;
	
	
	/*
	 * 박가혜, 답변하기 리스트 보여주기 기능
	 */
	
	@RequestMapping("/list")
	public String counselingList(Model model, @AuthUser MemberVo authUser) {

		List<CounselingVo> ReplyList= counselingService.getReplyList();
		
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
	
		model.addAttribute("authUser", authUser);
		model.addAttribute("replyList", ReplyList);
		
		

		return "/counseling/list";
	}
	
	/*
	 * 박가혜, 2017-08-24, 답변하기, 토론하기 상세보기 기능
	 */
	
	@Auth(role=Auth.Role.USER) 
	@RequestMapping("/detail")
	public String counselingDetail( Model model, @RequestParam("no") Long no, @AuthUser MemberVo authUser, @RequestParam("type") String type) {
		

		List<CounselingVo> existLike = new ArrayList<>();
		
		CounselingVo counselingPrnts = counselingService.getCounselingPrnts(no); 
		List<CounselingVo> counselingReplyList = counselingService.getCounselingReplyDetail(no); 
		
		
		/*
		 * 정예린,2017-09-27, 검색 결과 사용자가 없이 상담글에 접근하려고 할 때 널 처리 
		 */
		if(authUser!=null) {
			existLike=counselingService.existLike(authUser.getMbNo(),no);
		}

	
		counselingService.ChangefindCo(no);
		model.addAttribute("authUser", authUser);
		model.addAttribute("counselingPrnts", counselingPrnts);
		model.addAttribute("counselingReplyList", counselingReplyList);
		model.addAttribute("type", type); 
		model.addAttribute("existLike", existLike); 
		
		/*
		 * 박가혜,2017-09-15, 첨부된 파일 이미지 보여주기
		*/
		
		List<ApndngFileVo> fileList = apndngFileService.getFileList(no, "게시글");
		model.addAttribute("fileList", apndngFileService.getFileList(no, "게시글"));
	
		
		JSONArray jsonArray = new JSONArray();
		JSONArray jsonArray2 = new JSONArray();
		JSONArray jsonArray3 = new JSONArray();
		
		
		
		CounselingVo counselingPrnts2 = new CounselingVo();
		counselingPrnts2.setWrtbtNo(counselingPrnts.getWrtbtNo());
			
		List<CounselingVo> counselingReplyList2 = new ArrayList<CounselingVo>();


		
		for(int i=0; i<counselingReplyList.size(); i++) {
			
			counselingReplyList2.add(new CounselingVo());
			counselingReplyList2.get(i).setWrtbtNo(counselingReplyList.get(i).getWrtbtNo());
	
	
		}

		model.addAttribute("jsoncounselingPrnts", jsonArray.fromObject(counselingPrnts2));
		model.addAttribute("jsonexistLike", jsonArray2.fromObject(existLike)); 		
		model.addAttribute("jsoncounselingReply", jsonArray3.fromObject(counselingReplyList2)); 
	

		return "/counseling/detail";
	}
	
	
	
	
	
	
	

}
