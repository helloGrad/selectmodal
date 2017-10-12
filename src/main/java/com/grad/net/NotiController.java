package com.grad.net;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.net.security.AuthUser;
import com.grad.net.service.NotiService;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.NotiVo;


@Controller
@RequestMapping("/noti")
public class NotiController {
	
	@Autowired
	NotiService notiService; 
	

	/*
	 * 허규준, 모집공고 전체 리스트 (사용x)
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String notiAllList(Model model) {
		model.addAttribute("notiList", notiService.getNotiList("%"));		
		return "/noti/list";
	}
	
	/*
	 * 허규준, 모집공고 대학원 리스트(사용x)
	 */
	@RequestMapping(value = "/grad", method = RequestMethod.GET)
	public String notiGradList(@RequestParam(value="page", required=true ,defaultValue="1") int page, Model model) {
		model.addAttribute("notiList", notiService.getNotiList("대학원"));		
		return "/noti/gradlist";
	}
	
	/*
	 * 허규준,모집공고 연구실 리스트(사용x)
	 */
	@RequestMapping(value = "/lab", method = RequestMethod.GET)
	public String notiLabList(Model model) {
		model.addAttribute("notiList", notiService.getNotiList("연구실"));		
		return "/noti/lablist";
	}
	
	/*
	 * 정예린, 박가혜, 모집공고 상세보기 기능 
	 */		
	@RequestMapping("/detail")
	public String notiDetail(@RequestParam("no") int no,
			@RequestParam("tabnm") String tabnm, Model model,@AuthUser MemberVo authUser) {
		
		if(authUser == null) {
			
			model.addAttribute("vo", notiService.getNoti(tabnm,no,-1L));
			
		}
		else {
			model.addAttribute("vo", notiService.getNoti(tabnm,no,authUser.getMbNo()));
		}
		
		 NotiVo vo = notiService.getNoti(tabnm,no,-1L);
		 
		
		
		if(tabnm.equals("대학원")){
			tabnm="grad";
		}
		else if(tabnm.equals("연구실")) {
			tabnm="lab";
			model.addAttribute("labCodeList", notiService.getLabCodeList(no));

			
		}
		return "/noti/detail"+tabnm;
	}

}
