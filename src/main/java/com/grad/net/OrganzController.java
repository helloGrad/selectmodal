package com.grad.net;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grad.net.service.OrganzService;

/*
 * 허규준, 기관리스트 및 상세보기 (사용x)
 */	
@Controller
@RequestMapping("/organz")
public class OrganzController {
	
	@Autowired
	OrganzService organzService;
	
	@RequestMapping("/list")
	public String organzList(Model model) {
		model.addAttribute("organzList", organzService.getOrganzList());
		return "/orgnz/list";		
	}
	
	@RequestMapping("/detail")
	public String organzDetail(@RequestParam("no") int no, Model model) {
		model.addAttribute("vo", organzService.getOrganz(no));
		model.addAttribute("list", organzService.getResrchAcrsltList(no));
		return "/orgnz/detail";
	}

}
