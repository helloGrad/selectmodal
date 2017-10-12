package com.grad.net.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.net.dto.JSONResult;
import com.grad.net.service.OrganzService;
import com.grad.net.vo.ResrchAcrsltVo;

/*
 * 허규준, 연구실 상세보기 연구실적 가지고 오기(사용x) 
 */	

@Controller("orgnzAPIController")
@RequestMapping("/organz/api")
public class OrganzController {
	
	@Autowired
	OrganzService organzService;

	@RequestMapping("/detail")
	@ResponseBody
	public JSONResult fetchList(@RequestParam("orgNo") int orgNo, @RequestParam("type") String type) {
		
		List<ResrchAcrsltVo> list = organzService.getResrchAcrsltFetchList(orgNo, type);
		return JSONResult.success(list);
		
	}
	
	@RequestMapping("/count")
	@ResponseBody
	public JSONResult countResrchAcrslt(@RequestParam("orgNo") int orgNo, @RequestParam("type") String type) {
		
		int num = organzService.countResrchAcrslt(orgNo, type);
		return JSONResult.success(num);
		
	}
	
	
	
	
	

}
