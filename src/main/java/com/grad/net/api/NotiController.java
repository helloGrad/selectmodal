package com.grad.net.api;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.net.dto.JSONResult;
import com.grad.net.service.NotiService;
import com.grad.net.vo.NotiVo;
import com.grad.net.vo.ResrchAcrsltVo;


@Controller("notiAPIController")
@RequestMapping("/noti/api")
public class NotiController {
	
	@Autowired
	NotiService notiService; 
	

	/*
	 * 박가혜, 모집공고 연구분야 가지고 오기 
	 */
	@ResponseBody
	@RequestMapping(value = "/lab", method = RequestMethod.POST)
	public JSONResult notiLabList(Model model,
			@RequestParam(value = "comlist", required = true, defaultValue = "") List<Integer> comlist) {

		List<NotiVo> result = new ArrayList<NotiVo>();

		for (int i = 0; i < comlist.size(); i++) {

			NotiVo data = notiService.getNoti("연구실", comlist.get(i));

			result.add(i, data);

		}

		return JSONResult.success(result);
	}
	



}
