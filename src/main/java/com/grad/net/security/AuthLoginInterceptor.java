package com.grad.net.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import com.grad.net.service.MemberService;
import com.grad.net.vo.MemberVo;


/*
 * 박가혜, 로그인후 세션등록(사용 x)
 */
public class AuthLoginInterceptor extends HandlerInterceptorAdapter {	

	@Autowired
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {		
		
		String iden = request.getParameter("iden");
		String pw=request.getParameter("pw");		
	
		
		MemberVo memberVo=  memberService.getUser(iden, pw);
		
		
		if( memberVo == null){
			
			response.sendRedirect(request.getContextPath()+"?result=fail");
			return false;
		}		
		
		HttpSession session = request.getSession(true);
		
		session.setAttribute("authUser", memberVo);
		
	
		
		/*
		 * 박가혜, 2017-08-31, 맞춤정보 제안 페이지(사용x)
		 */
	
		

		if(memberVo.getInfoYn().equals("N")) { //건너뛰기 안헀으면 
			
			response.sendRedirect(request.getContextPath()+"/user/mbinfo");
			
			
		}else {
			
			
			response.sendRedirect(request.getContextPath()+"/");
			
		}
		
		return false;
	}	

}
