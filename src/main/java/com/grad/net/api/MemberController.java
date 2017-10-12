package com.grad.net.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.net.dto.JSONResult;
import com.grad.net.service.CodeService;
import com.grad.net.service.MemberService;
import com.grad.net.service.OrganzService;
import com.grad.net.vo.CodeVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.OrganzVo;


@Controller("memberApiController")
@RequestMapping("/api")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	
	@Autowired
	CodeService codeService;

	
	/*
	 * 허주한, 이메일을 이용한 사용자 중복체크 기능
	 */	

	@ResponseBody
	@RequestMapping("/checkemail")
	public JSONResult checkEmail(@RequestParam(value = "email", required = true, defaultValue = "") String IDEN) {

		boolean exist = memberService.existEamil(IDEN);
		
		return JSONResult.success(exist);
	}
	

	/*
	 * 
	 * 정예린 ,2017-09-26, 페이스북 로그인 수정
	 */

	@ResponseBody
	@RequestMapping("/snslogin")
	public JSONResult snslogin(@RequestParam(value = "name", required = true, defaultValue = "") String mbNm,
			@RequestParam(value = "email", required = true, defaultValue = "") String iden,
			@RequestParam(value = "gender", required = true, defaultValue = "") String sex,
			@RequestParam(value = "birthday", required = true, defaultValue = "") String birdt,
			@RequestParam(value = "token", required = true, defaultValue = "") String snsTknValue,
			@RequestParam(value = "age", required = true, defaultValue = "") String agrg,
			@RequestParam(value = "nickname", required = true, defaultValue = "") String nknm,
			@RequestParam(value = "sns", required = true, defaultValue = "") String snsnm, HttpServletRequest request,
			HttpServletResponse response) {

		MemberVo memberVo = new MemberVo();

		memberVo.setMbNm(mbNm);
		memberVo.setIden(iden);
		memberVo.setSex(sex);
		memberVo.setBirdt(birdt);
		memberVo.setSnsTknValue(snsTknValue);

		if (snsnm.equals("fb") || snsnm.equals("google")) {
			memberVo.setNknm(mbNm);

		} else if (snsnm.equals("naver")) {
			memberVo.setNknm(nknm);
		}
		memberVo.setAgrg(agrg);


		boolean exist = false;

		if (snsnm.equals("fb")) {
			
			exist = memberService.checkMember(memberVo);
		} else if (snsnm.equals("naver")) {
			exist = memberService.existEamil(memberVo.getIden());
		}


		if (exist != true) {
			memberService.snslogin(memberVo, snsnm); 
		}

		HttpSession session = request.getSession(true);

		MemberVo getmember = new MemberVo();

		if (snsnm.equals("fb")) {
			getmember = memberService.getUserByToken(snsTknValue);
			getmember.setExist(exist);
		} else if (snsnm.equals("naver")) {
			getmember = memberService.getUser(iden);
			getmember.setExist(exist);
		}
		
		session.setAttribute("authUser", getmember);

		return JSONResult.success(getmember);
	}

	
	/*
	 * 허주한, 2017-09-02, 로그인 정보 체크 
	 */
	@ResponseBody
	@RequestMapping(value = "/checklogin" , method = RequestMethod.POST)
	public JSONResult getList(@RequestParam("iden") String iden, @RequestParam("pw") String pw) {

		try {
			if(memberService.getUser(iden, pw)==null) {
				return JSONResult.success(false);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return JSONResult.success(true);

	}
	
	/*
	 * 허주한, 로그인후 세션등록
	 */
	@ResponseBody
	@RequestMapping(value = "/setsession" , method=RequestMethod.POST)
	public JSONResult setSession(HttpServletRequest request, HttpServletResponse response,@RequestParam("iden") String iden, @RequestParam("pw") String pw) {

		
		
		MemberVo memberVo = null;
		try {
			memberVo = memberService.getUser(iden, pw);
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession(true);
		
		session.setAttribute("authUser", memberVo);

		
		return JSONResult.success(true);

	}
	
	
	/*
	 * 박가혜 ,2017-09-08, 메인페이지 연구분야리스트 보여주기 
	 */

	@ResponseBody
	@RequestMapping("/majorlist")
	public JSONResult majorlist(@RequestParam("type") String type) {

		List<CodeVo> organzList = codeService.getMajorList(type);

		return JSONResult.success(organzList);
	}
	
	/*
	 * 정예린, 2017-09-19, 스크랩추가
	 */
	@ResponseBody
	@RequestMapping(value = "/addscrap", method = RequestMethod.GET)
	public JSONResult scrapInsert(@RequestParam("type") String type,
			@RequestParam("id") String id,
			@RequestParam("user") String user) {

		boolean success = memberService.insertScrap(type,id,user);

		return JSONResult.success(success);
	}
	
	/*
	 * 정예린, 2017-09-19, 스크랩수정
	 */
	@ResponseBody
	@RequestMapping(value = "/deletescrap", method = RequestMethod.GET)
	public JSONResult scrapDelete(@RequestParam("type") String type,
			@RequestParam("id") String id,
			@RequestParam("user") String user) {

		boolean success = memberService.deleteScrap(type,id,user);
		return JSONResult.success(success);
	}

	
	
	/*
	 * 허주한, 2017-09-06, 닉네임 중복 확인 
	 */
	@ResponseBody
	@RequestMapping("/checknknm")
	public JSONResult checkNknm(@RequestParam(value = "nknm", required = true, defaultValue = "") String nknm) {

		boolean exist = memberService.existNknm(nknm);
		
		return JSONResult.success(exist);
	}
	
	
	/*
	 * 정예린, 회원가입 
	 */
	
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public JSONResult register(HttpServletRequest request, @ModelAttribute @Valid MemberVo memberVo,
			BindingResult result) {
		
		
		System.out.println(memberVo);
		
		
		if(result.hasErrors()){
			List<ObjectError> list = result.getAllErrors();
			for(ObjectError error: list){
				System.out.println(error);
			}
			return JSONResult.success(list);
		}
		boolean success = memberService.register(memberVo);		
		
		HttpSession session = request.getSession(true);
		
		session.setAttribute("authUser", memberService.getUser(memberVo.getIden()));
		

		return JSONResult.success(success);

	}
	
	
	
	/*
	 * 허주한, 2017-09-14, 회원가입시 학문 정보 등록(맞춤정보)
	 */
	@ResponseBody
	@RequestMapping(value = "/registerStudy", method = RequestMethod.POST)
	public JSONResult registerStudy(@RequestParam String iden, @RequestParam(value="studys") List<String> studys, @RequestParam String type) {
		System.out.println(iden+"-"+type);
		System.out.println(studys);
		for(int i=0;i<studys.size();i++) {
			if(type.equals("common")||type.equals("naver")) {
				memberService.registerStudy(iden, studys.get(i),type);
			}
			else if(type.equals("facebook")) {
				memberService.registerStudyFacebook(iden, studys.get(i),type);
			}
			
		}
		
		
		return JSONResult.success(true);
			
	}
	
	/*
	 * 허주한, 2017-09-14, 맞춤정보 수정
	 */
	
	@ResponseBody
	@RequestMapping(value = "/modifyInfo", method = RequestMethod.POST)
	public JSONResult modifyInfo(@RequestParam String mbNo, @RequestParam(value="cdNames") List<String> cdNames, @RequestParam String type) {
		
		
		memberService.modifyMbinfo(mbNo, type,cdNames);
		
		
		return JSONResult.success(true);
			
	}
	
	
	/*
	 * 허주한, 자동검색기능 연구분야 리스트  
	 */
	@ResponseBody
	@RequestMapping(value = "/getResearchCode")
	public JSONResult getResearchCode(@RequestParam(value="researchNames") List<String> researchNames) {
		
		
		if(researchNames.size()==0) {
			researchNames.add(0, "-1");
		}
		
		List<CodeVo> list = memberService.getResearchCode(researchNames);
		
		
		return JSONResult.success(list);
			
	}
	
	/*
	 * 허주한, 닉네임 수정하기
	 */
	@ResponseBody
	@RequestMapping(value = "/updatenknm", method = RequestMethod.POST)
	public JSONResult updateNknm(HttpServletRequest request, @RequestParam String mbNo,  @RequestParam String nknm) {
		
		
		memberService.updateNknm(mbNo, nknm);
		
		HttpSession session = request.getSession(true);
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");
		authUser.setNknm(nknm);
		session.removeAttribute("authUser");
		session.setAttribute("authUser", authUser);
		
		
		return JSONResult.success(true);
			
	}
	
	/*
	 * 허주한,  sns계정 연동끊기 
	 */
	
	@ResponseBody
	@RequestMapping(value = "/updateMbDstnct", method = RequestMethod.POST)
	public JSONResult updateMbDstnct(@RequestParam String mbNo,  @RequestParam String email) {
		
		memberService.updateMbDstnct(mbNo, email);
		
		return JSONResult.success(true);
			
	}
	

}
