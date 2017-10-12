package com.grad.net.api;

import java.io.File;
import java.text.Format;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.grad.net.dto.JSONResult;
import com.grad.net.security.AuthUser;
import com.grad.net.service.ApndngFileService;
import com.grad.net.service.CounselingService;
import com.grad.net.service.MemberService;
import com.grad.net.vo.ApndngFileVo;
import com.grad.net.vo.CodeVo;
import com.grad.net.vo.CounselingVo;
import com.grad.net.vo.FileVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.NotiVo;
import com.grad.net.vo.PageVo;

@Controller("counselingAPIController")
@RequestMapping("/counseling/api")
public class CounselingController {

	@Autowired
	CounselingService counselingService;
	
	@Autowired
	ApndngFileService apndngFileService;

	/*
	 * 박가혜, 2017-08-23, 답변하기, 토론하기  글쓰기 기능 
	 */
	
	@ResponseBody
	@RequestMapping(value = "/write")
	public JSONResult CounselingList(Model model, @AuthUser MemberVo authUser, MultipartHttpServletRequest multi) {
		
			int lastId = 0;
		
	        
	        CounselingVo counselingVo = new CounselingVo() ;
	        counselingVo.setMbNo(authUser.getMbNo());
			counselingVo.setWrtbtTitle(multi.getParameter("wrtbtTitle"));
			counselingVo.setWrtbtText(multi.getParameter("wrtbtText"));
			counselingVo.setWritrInfoOpngYn(multi.getParameter("writrInfoOpngYn"));
			counselingVo.setWrtbtDstnct(multi.getParameter("writeoption"));
		
			System.out.println("게시판옵션"+multi.getParameter("writeoption"));
			System.out.println("공학....인지"+multi.getParameter("boardoption"));
			
			String boardtype = multi.getParameter("boardoption");
	
			
			
			if(multi.getParameter("writeoption").equals("상담게시판")) {
				
				counselingVo.setConslBbsDstnct("일반상담");
			}
			


	        if(multi.getParameter("writeoption").equals("일반게시판") && multi.getParameter("boardoption").equals("공학")) {
	        	
	        	counselingVo.setBbsNo((long) 6);
	        }else if(multi.getParameter("writeoption").equals("상담게시판") && multi.getParameter("boardoption").equals("공학")) {
	        	
	        	counselingVo.setBbsNo((long) 5);
	       	        	
	        	
	        }else if(multi.getParameter("writeoption").equals("일반게시판") && multi.getParameter("boardoption").equals("전체")) {
	        	
	        	counselingVo.setBbsNo((long) 1);
	        }else if(multi.getParameter("writeoption").equals("상담게시판") && multi.getParameter("boardoption").equals("전체")) {
	        	
	        	counselingVo.setBbsNo((long) 1);
	        	
	        }else if(multi.getParameter("writeoption").equals("일반게시판") && multi.getParameter("boardoption").equals("인문학")) {
	        	
	        	counselingVo.setBbsNo((long) 7);
	        }else if(multi.getParameter("writeoption").equals("상담게시판") && multi.getParameter("boardoption").equals("인문학")) {
	        	
	        	counselingVo.setBbsNo((long) 8);
	        	
	        }else if(multi.getParameter("writeoption").equals("일반게시판") && multi.getParameter("boardoption").equals("사회과학")) {
	        	
	        	counselingVo.setBbsNo((long) 10);
	        }else if(multi.getParameter("writeoption").equals("상담게시판") && multi.getParameter("boardoption").equals("사회과학")) {
	        	
	        	counselingVo.setBbsNo((long) 9);
	        	
	        }else if(multi.getParameter("writeoption").equals("일반게시판") && multi.getParameter("boardoption").equals("자연과학")) {
	        	
	        	counselingVo.setBbsNo((long) 12);
	        }else if(multi.getParameter("writeoption").equals("상담게시판") && multi.getParameter("boardoption").equals("자연과학")) {
	        	
	        	counselingVo.setBbsNo((long) 11);
	        	
	        }else if(multi.getParameter("writeoption").equals("일반게시판") && multi.getParameter("boardoption").equals("의약학")) {
	        	
	        	counselingVo.setBbsNo((long) 14);
	        }else if(multi.getParameter("writeoption").equals("상담게시판") && multi.getParameter("boardoption").equals("의약학")) {
	        	
	        	counselingVo.setBbsNo((long) 13);
	        	
	        }else if(multi.getParameter("writeoption").equals("일반게시판") && multi.getParameter("boardoption").equals("농수해양학")) {
	        	
	        	counselingVo.setBbsNo((long) 16);
	        }else if(multi.getParameter("writeoption").equals("상담게시판") && multi.getParameter("boardoption").equals("농수해양학")) {
	        	
	        	counselingVo.setBbsNo((long) 15);
	        	
	        }else if(multi.getParameter("writeoption").equals("일반게시판") && multi.getParameter("boardoption").equals("예술체육학")) {
	        	
	        	counselingVo.setBbsNo((long) 18);
	        }else if(multi.getParameter("writeoption").equals("상담게시판") && multi.getParameter("boardoption").equals("예술체육학")) {
	        	
	        	counselingVo.setBbsNo((long) 17);
	        	
	        }else if(multi.getParameter("writeoption").equals("일반게시판") && multi.getParameter("boardoption").equals("복합학")) {
	        	
	        	counselingVo.setBbsNo((long) 20);
	        }else if(multi.getParameter("writeoption").equals("상담게시판") && multi.getParameter("boardoption").equals("복합학")) {
	        	
	        	counselingVo.setBbsNo((long) 19);
	        	
	        };
		counselingService.setWrite(counselingVo);
			

		ApndngFileVo vo = null;
	

		lastId = counselingService.lastInsertId();
		
		 List<MultipartFile> mf = multi.getFiles("file");


		 if(mf.get(0).getOriginalFilename().equals("")) {
			  
			 System.out.println("파일이 없습니다.");
			 
		 }else {
			 
			  for(int i=0; i<mf.size(); i++) {
				  

					   apndngFileService.restore(mf.get(i));
						vo = apndngFileService.getFileVo();
						vo.setPrntsDstnct("게시글");
						vo.setPrntsNo(lastId);
						apndngFileService.insert(vo);
					  
				  }
			 
		 }

	        
		return JSONResult.success(boardtype);
	}
	

	/*
	 * 박가혜, 2017-08-24, 답변하기, 토론하기 답변하기 기능
	 */
	@ResponseBody
	@RequestMapping(value = "/replywrite", method = RequestMethod.POST) 
	public JSONResult CounselingReplyList(Model model, @RequestBody CounselingVo counselingVo,
			@AuthUser MemberVo authUser) {

		counselingVo.setMbNo(authUser.getMbNo());
		counselingService.setReplyWrite(counselingVo);

		return JSONResult.success(counselingVo);
	}

	/*
	 * 박가혜 2017-08-26, 답변하기, 토론하기 좋아요 기능
	 */
	@ResponseBody
	@RequestMapping(value = "/likeadd", method = RequestMethod.POST) 
	public JSONResult CounselingLikeAdd(Model model, @RequestBody CounselingVo counselingVo) {

		CounselingVo existLike = counselingService.existLikeOne(counselingVo.getMbNo(), counselingVo.getWrtbtNo());
		

		if (existLike == null) {

			
			counselingService.setLike(counselingVo.getMbNo(), counselingVo.getWrtbtNo(),counselingVo.getInfroDstnct());

		} else {

			
			counselingService.deleteLike(counselingVo.getMbNo(), counselingVo.getWrtbtNo(),counselingVo.getInfroDstnct());

		}
		CounselingVo result = counselingService.getCounselingPrnts(counselingVo.getWrtbtNo()); 
		

		return JSONResult.success(result);
	}
	
	
	/*
	 * 박가혜,2017-09-12, 학문별 토론 리스트 보여주기  
	 */

	@ResponseBody
	@RequestMapping("/list")
	public JSONResult list(@RequestParam("type") String type,@RequestParam("order") String order, @RequestParam(value="sno", required=true, defaultValue="0") Long startNo) {

	
		List<CounselingVo> counselingList= counselingService.getCounselingList(type,order,startNo); 
		List<Object> fileList = new ArrayList<Object>(); 
		
		for(int i=0; i<counselingList.size(); i++) {
			
			List<ApndngFileVo> fileList2 = apndngFileService.getFileList(counselingList.get(i).getWrtbtNo(), "게시글");	
			fileList.add(fileList2)	;
			
		}
	
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("counselingList", counselingList);
		map.put("fileList", fileList);
		
	
		return JSONResult.success(map);
	}
	
	
	/*
	 * 정예린,2017-09-14, 답변하기, 토론하기  페이징 기능 
	 */
	
	@ResponseBody
	@RequestMapping(value = "/pagelist", method = RequestMethod.GET)
	public JSONResult counPageList(@ModelAttribute PageVo pageVo,
			@RequestParam(value="page", required=true ,defaultValue="1") int page, 
			@RequestParam(value="type") String type,
			@RequestParam(value="order") String order,
			@RequestParam(value="user", required=true, defaultValue="-1") Long user) {
		
		Map<String, Object> map =  new HashMap<String, Object>();
		
		map.put("scrapList", counselingService.getScrapList(user));
		map.put("page", page);
		pageVo.calcPage(counselingService.countCounList(type));
		map.put("pageVo", pageVo);
		map.put("counList", counselingService.getCounList(type, order, pageVo));
		
		return  JSONResult.success(map);
	}
	
	
	


}
