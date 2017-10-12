<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">	


<style>
    

body {
	padding-top: 5em;
}
.grad-banner {
	box-shadow: 5px 10px 10px rgba(102, 102, 255, 0.3), -1px -1px 10px rgba(136, 176, 75, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}
.grad-banner:hover {
	box-shadow: 5px 10px 30px rgba(102, 102, 255, 0.5), -1px -1px 30px rgba(136, 176, 75, 0.5);
	margin-bottom: 1.5em;
}
.lab-banner {
	box-shadow: 5px 10px 10px rgba(51, 102, 255, 0.3), -1px -1px 10px rgba(75, 0, 130, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}
.lab-banner:hover {
	box-shadow: 5px 10px 30px rgba(51, 102, 255, 0.5), -1px -1px 30px rgba(75, 0, 130, 0.5);
	margin-bottom: 1.5em;
}
.conference-banner {
	box-shadow: 5px 10px 10px rgba(51, 102, 255, 0.3), -1px -1px 10px rgba(153, 0, 153, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}
.conference-banner:hover {
	box-shadow: 5px 10px 30px rgba(51, 102, 255, 0.5), -1px -1px 30px rgba(153, 0, 153, 0.5);
	margin-bottom: 1.5em;
	background-color: white;
}
.qna-banner {
	box-shadow: 5px 10px 10px rgba(0, 0, 51, 0.3), -1px -1px 10px rgba(0, 0, 51, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}
.qna-banner:hover {
	box-shadow: 5px 10px 30px rgba(0, 0, 51, 0.5), -1px -1px 30px rgba(0, 0, 51, 0.5);
	margin-bottom: 1.5em;
}
.content-answers {
	height: 3.5em;
	text-overflow:ellipsis;
	overflow: hidden;
	white-space: normal;
}
.grad-banner-our {
	box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.15), -1px -1px 10px rgba(0, 0, 0, 0.15);
	margin-bottom: 1.5em;
	background-color: white;
}
.scrap-on {
	color: #FF0000;
}
</style>

<script type="text/javascript">
$(function() {
	
	
	var authUser = $("#authUser").val();
	
	var click_id;
	
	
	if(authUser == null || authUser == "" ){
		
		
	}else{
		
		
		var scrapList=JSON.parse('${scrapList}');
		for(var i=0;i<scrapList.length;i++){

			if(scrapList[i].prntsDstnct==='게시글'){ 
				
				
				$('.do-scrapcoun' + scrapList[i].prntsNo).addClass('scrap-on');
			}
			else if(scrapList[i].prntsDstnct==='모집공고'){
				
				
				$('.do-scrapnoti' + scrapList[i].prntsNo).addClass('scrap-on');
			}
		};	
		
	}
	
	
	$(document).on('click', ".counseling", function(event) { 
		
		
		click_id = $(this).attr('value');

	
		if (authUser === null || authUser === '') {
			
			$("#login").css({
				"display" : "block"
			});

		}else{
			
			location.href="/net/counseling/detail?no="+click_id+"&type=prnts";
			
		}      
	
	
	});
	
	
	
	$(document).on('click', ".counselingreply", function() { 
		
		
		click_id = $(this).attr('value');

		
		if (authUser === null || authUser === '') {
			
			$("#login").css({
				"display" : "block"
			});

		}else{
			
			
			location.href="/net/counseling/detail?no="+click_id+"&type=reply";
			 event.stoplmmediatePropagation();
		}      
	
	
	});
	
	
});


</script>


</head>
<body>


	<c:import url="/WEB-INF/views/include/header.jsp" />
	<c:import url="/WEB-INF/views/include/subHeader.jsp" />


	<div class="row">
		<div class="container">
		
		<input type="hidden" id="authUser" name="authUser" value="${authUser.mbNo }">
		
			<c:forEach items="${calList }" var="calList" varStatus="status">
			
				<div class="col-xs-12 col-sm-12 col-lg-12">
				
				<h1>
					<div style="float: left; margin-right: 0.3em;">${calList.day }</div>
					<small>
						<div style="float: left; font-size: medium; line-height: 130%;">
							${calList.week }<br>${calList.year }년 ${calList.month }월
						</div>
					</small> <br>
				</h1>
				
				<hr>
				</div>
			
			
				<div class="row">
		
		
			<div class="col-xs-12 col-sm-4 col-lg-4">
				
				<c:forEach items="${BoardList }" var="BoardList" varStatus="status"> 
                
                    <c:if test="${BoardList.orderNum%3 ==0 }"	>
		  		

		  				  <c:choose>
 
							<c:when test="${calList.year ==BoardList.year && calList.month ==BoardList.month && calList.day == BoardList.day }">
					
					 	 			
			                <c:choose>
			 
								 <c:when test="${BoardList.slctnNotiDstnct == '연구실'}">
								  		
								  <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  
								  
								  
								  			   <div class="lab-banner w3-card w3-round-large">
								  			   <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
								  			   <c:if test="${BoardList.bk21EorgnzSuprtYn =='Y' }"	>
								  			   	 <div class="w3-small w3-padding  "style="margin-bottom: -1.5em; height: 2.7em">
							                        <span class="w3-red " style="padding-right: 2px; padding-left: 10px; margin-right: -5px">BK</span>
							                        <span class="w3-blue " style="padding-right: 5px; padding-left: 0px;">21+</span>
							                    </div>
								  			   
								  			   </c:if>
								  			   
								  			   
								  			   <c:if test="${BoardList.storgPath == null }"	>
						                    		${BoardList.university} ${BoardList.graduate }
						                    	</c:if>
						                    	<c:if test="${BoardList.storgPath != null }"	>
						                    		  <img src="${pageContext.request.contextPath }${BoardList.storgPath }" style="width:100%; padding: 1em 1em 0 1em;">
						                    	</c:if>
						                       
							             
							                    <div class="w3-container w3-center">
							                        <h4 style="font-size: 1.8vmin;"><strong>${BoardList.major} ${BoardList.lab }</strong></h4>
							                        <p style="font-size: 1.8vmin;"><span class="grad-target"></span>${BoardList.slctnTitle}</p>
							                    </div>
							                    <div class="research-field w3-padding text-center">
							                    
							                    
								                     <c:forEach items="${majorList}" var="majorList" varStatus="status">
							                        	<c:if test="${BoardList.slctnNotiNo == majorList.slctnNotiNo }"	>
							                    		  <span class="w3-tag w3-black w3-tiny  ">${majorList.cdNm}</span>
							                    		</c:if>
							                        
							                        
							                        </c:forEach>
								                     
							                 
							                    </div>
							                    </div>
							                    <div class="w3-padding">
							                        <span class="noti-hh"  onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
							                        	    <c:if test="${BoardList.slctnSemstr == '상시' }"	>
						                              <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">D-${BoardList.dday}</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">모집예정</span>
							                  			 	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">오늘마감</span>
							                  			 
							                    	</c:if>
							                    </div>
							                </div>
								

					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								   			  <div class="grad-banner-our w3-card w3-round-large">
								                   <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
								                   	<c:if test="${BoardList.slctnSemstr == '상시' }"	>
							                    		  
							                    		  <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                    	<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                  			 	
							                    	</c:if>
								                   
								                   
								                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								                        <h5 class="w3-padding" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.university} </strong><strong>${BoardList.graduate} ${BoardList.major} ${BoardList.lab}</strong></h5>
								                        <p style="font-size: 1.8vmin;">${BoardList.slctnTitle}</p>
								                    </div>
								                    
								                    </div>
								                    
								                    <div class="w3-padding">
								                        <span class="noti-hh" onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
								                        
								                        <c:if test="${BoardList.slctnSemstr == '상시' }"	>
								                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">상시 모집</span>
							                    		
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">D-${BoardList.dday}</span>
								                  				  	
								                    	</c:if>
								                    	<c:if test="${BoardList.percent < 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">모집예정</span>
								                  			   	
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">오늘 마감</span>
								                  				
								                    	</c:if>
								                        
								                    </div>
								                </div>
									  
					                                     
					                </c:if>

							    </c:when>
			 					
							   
								 <c:when test="${BoardList.slctnNotiDstnct == '대학원'}">
								 
								 
								   <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  				
								  	  		    <div class="grad-banner w3-card w3-round-large" >
								                    <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
								                    <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
								                    
								                    <c:if test="${BoardList.storgPath == null }"	>
						                    		${BoardList.major}
							                    	</c:if>
							                    	<c:if test="${BoardList.storgPath != null }"	>
							                    		  <img src="${pageContext.request.contextPath }${BoardList.storgPath }"  style="width:100%; padding: 1em 1em 0 1em;">
							                    	</c:if>
								                    
								                    <div class="w3-container w3-center">
								                        <h4><strong>${BoardList.lab}</strong></h4>
								                        <p style="font-size: 1.8vmin;"><span class="grad-target"></span>${BoardList.slctnTitle}</p>
								                    </div>

							                    			
								                    <div class="noti-period">
								                        <div class="w3-light-grey w3-tiny">
								                            
								                            <c:if test="${BoardList.slctnSemstr == '상시' || BoardList.percent <0 }"	>
							                    				<div class="w3-container "
							                                 style="width: 0; height: 1px;"></div>
							                    			</c:if>
							                    			<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                  				  	<div class="w3-container w3-black"
							                                 style="width: ${BoardList.percent}%; height: 1px;"></div>
							                    			</c:if>
							                    			
							                    			
								                        </div>
								                    </div>
								                    </div>
								                    
								                    <div class="w3-padding">
								                        <span class="noti-hh" onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
								                        
										                        <c:if test="${BoardList.slctnSemstr == '상시' }"	>
										                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">상시 모집</span>
									                    		
									                    	</c:if>
									                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
									                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">D-${BoardList.dday}</span>
									                  			
									                    	</c:if>
									                    	<c:if test="${BoardList.percent < 0 }"	>
									                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">모집예정</span>
									                  			  	
									                    	</c:if>
									                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
									                  			  <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">오늘마감</span>
									                    	</c:if>
							                    	
							                    
								                    </div>
								                </div>
	
					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								     <div class="grad-banner-our w3-card w3-round-large">
					                    
					                    <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
					                      <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                      <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							               </c:if>
							               <c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                    	
							               </c:if>
					                    
					                   
					                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
					                        <h4 class="w3-padding w3-round-large" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.major}</strong><strong> ${BoardList.lab}</strong></h4>
					                        <p style="font-size: 1.8vmin;">${BoardList.slctnTitle}</p>
					                    </div>
					                    
					                    
					                    </div>
					                    <div class="w3-padding">
					                        <span class="noti-hh" onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
					                        
					                          <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                                	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">D-${BoardList.dday}</span>
							                  			
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">모집예정</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">오늘 마감</span>
							                  			  	
							                    	</c:if>
							                    	
							              
					                    </div>
					                 </div>
								   
           
					                </c:if>

							              
							    </c:when>

							 
							    <c:otherwise>
							    
							      <c:if test="${BoardList.wrtbtDstnct =='일반게시판' }"	>
							      
							     
							      	
							      <div class="qna-banner w3-card w3-round-large counseling" value="${BoardList.slctnNotiNo}">
				                    <div class="w3-small w3-padding ">
				                        <span class="">Ordinary</span>
				                    </div>
				                    <div class="w3-container w3-center">
				                        <h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
				                    </div>
				                    
				                    <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		 
						             </c:if>
						             <c:if test="${BoardList.coSrorgPath  != null }"	>
						                 <img src="${pageContext.request.contextPath }${BoardList.coSrorgPath }" class="conference-banner" style="width:100%">
						             </c:if>
				                    
				                   <c:if test="${BoardList.count > 0 }"	>
						                <div class="w3-container w3-margin-top">
				                        <span class="w3-small w3-padding" >Comment</span>
				                        <p class=" w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
				                         	   ${BoardList.subwrtbtText} </p>
				                    	</div>         	
						                    		
						            </c:if>
						             <c:if test="${BoardList.count == 0 }"	>
						                    		  

						            </c:if>
				
				                   
				                </div>
										
							      
							      </c:if>
							      
							     <c:if test="${BoardList.wrtbtDstnct =='상담게시판' }"	>
							     
							     
							     	  <div class="qna-banner w3-card w3-round-large counseling" value="${BoardList.slctnNotiNo}">
					                    <div class="w3-small w3-padding ">
					                        <span class="">Question</span>
					                    </div>
					                    <div class="w3-container w3-center">
					                        <h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
					                    </div>
					                     <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		 
							             </c:if>
							             <c:if test="${BoardList.coSrorgPath  != null }"	>
							                 <img src="${pageContext.request.contextPath }${BoardList.coSrorgPath }" class="conference-banner" style="width:100%">
							             </c:if>
							             
							             
							               <c:if test="${BoardList.count > 0 }"	>
						                       <div class="w3-container w3-margin-top">
					                        <span class="w3-small w3-padding" >Answer</span>
					                        <p class=" w3-center w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
						                           ${BoardList.subwrtbtText} </p>
						                    </div>
							                    <div class="w3-container w3-center w3-padding">
							                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
							                    </div>
						                    		
						           		 </c:if>
						             	<c:if test="${BoardList.count == 0 }"	>
								                <div class="w3-container w3-center w3-padding">
							                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
							                    </div>    		  

						            	</c:if>
					                  
					                </div>
							     
							     </c:if>
						

							    </c:otherwise>
			 
							</c:choose>
				

				    </c:when>
 					

				</c:choose>
						                
							
		  		
		  			</c:if>
                  </c:forEach>  
                    
                </div>
		

					
				<div class="col-xs-12 col-sm-4 col-lg-4"> 
				
				<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
                
                    <c:if test="${BoardList.orderNum%3 ==1 }"	>
		  		
						
		  			  <c:choose>
 
							<c:when test="${calList.year ==BoardList.year && calList.month ==BoardList.month && calList.day == BoardList.day }">
					
					 	 			
			                <c:choose>
			 
								 <c:when test="${BoardList.slctnNotiDstnct == '연구실'}">
								  		
								  <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  
								  
								  
								  			   <div class="lab-banner w3-card w3-round-large">
								  			   <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
								  			   <c:if test="${BoardList.bk21EorgnzSuprtYn =='Y' }"	>
								  			   	 <div class="w3-small w3-padding  "style="margin-bottom: -1.5em; height: 2.7em">
							                        <span class="w3-red " style="padding-right: 2px; padding-left: 10px; margin-right: -5px">BK</span>
							                        <span class="w3-blue " style="padding-right: 5px; padding-left: 0px;">21+</span>
							                    </div>
								  			   
								  			   </c:if>
								  			   
								  			   
								  			   <c:if test="${BoardList.storgPath == null }"	>
						                    		${BoardList.university} ${BoardList.graduate }
						                    	</c:if>
						                    	<c:if test="${BoardList.storgPath != null }"	>
						                    		  <img src="${pageContext.request.contextPath }${BoardList.storgPath }" style="width:100%; padding: 1em 1em 0 1em;">
						                    	</c:if>
						                       
							             
							                    <div class="w3-container w3-center">
							                        <h4 style="font-size: 1.8vmin;"><strong>${BoardList.major} ${BoardList.lab }</strong></h4>
							                        <p style="font-size: 1.8vmin;"><span class="grad-target"></span>${BoardList.slctnTitle}</p>
							                    </div>
							                    <div class="research-field w3-padding text-center">
							                    
							                    
								                     <c:forEach items="${majorList}" var="majorList" varStatus="status">
							                        	<c:if test="${BoardList.slctnNotiNo == majorList.slctnNotiNo }"	>
							                    		  <span class="w3-tag w3-black w3-tiny  ">${majorList.cdNm}</span>
							                    		</c:if>
							                        
							                        
							                        </c:forEach>
								                     
							                 
							                    </div>
							                    </div>
							                    <div class="w3-padding">
							                        <span class="noti-hh"  onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
							                        	    <c:if test="${BoardList.slctnSemstr == '상시' }"	>
						                              <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">D-${BoardList.dday}</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">모집예정</span>
							                  			 	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">오늘마감</span>
							                  			 
							                    	</c:if>
							                    </div>
							                </div>
								
								  
					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								   			  <div class="grad-banner-our w3-card w3-round-large">
								                   <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
								                   	<c:if test="${BoardList.slctnSemstr == '상시' }"	>
							                    		  
							                    		  <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                    	<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                  			 	
							                    	</c:if>
								                   
								                   
								                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								                        <h5 class="w3-padding" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.university} </strong><strong>${BoardList.graduate} ${BoardList.major} ${BoardList.lab}</strong></h5>
								                        <p style="font-size: 1.8vmin;">${BoardList.slctnTitle}</p>
								                    </div>
								                    
								                    </div>
								                    
								                    <div class="w3-padding">
								                        <span class="noti-hh" onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
								                        
								                        <c:if test="${BoardList.slctnSemstr == '상시' }"	>
								                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">상시 모집</span>
							                    		
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">D-${BoardList.dday}</span>
								                  				  	
								                    	</c:if>
								                    	<c:if test="${BoardList.percent < 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">모집예정</span>
								                  			   	
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">오늘 마감</span>
								                  				
								                    	</c:if>
								                        
								                    </div>
								                </div>
									  
      
					                </c:if>
								 
								 
							              
							    </c:when>
			 					
							   
								 <c:when test="${BoardList.slctnNotiDstnct == '대학원'}">
								 
								 
								   <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  				
								  	  		    <div class="grad-banner w3-card w3-round-large" >
								                    <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
								                    <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
								                    
								                    <c:if test="${BoardList.storgPath == null }"	>
						                    		${BoardList.major}
							                    	</c:if>
							                    	<c:if test="${BoardList.storgPath != null }"	>
							                    		  <img src="${pageContext.request.contextPath }${BoardList.storgPath }"  style="width:100%; padding: 1em 1em 0 1em;">
							                    	</c:if>
								                    
								                    <div class="w3-container w3-center">
								                        <h4><strong>${BoardList.lab}</strong></h4>
								                        <p style="font-size: 1.8vmin;"><span class="grad-target"></span>${BoardList.slctnTitle}</p>
								                    </div>
								                    

							                    			
								                    <div class="noti-period">
								                        <div class="w3-light-grey w3-tiny">
								                            
								                            <c:if test="${BoardList.slctnSemstr == '상시' || BoardList.percent <0 }"	>
							                    				<div class="w3-container "
							                                 style="width: 0; height: 1px;"></div>
							                    			</c:if>
							                    			<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                  				  	<div class="w3-container w3-black"
							                                 style="width: ${BoardList.percent}%; height: 1px;"></div>
							                    			</c:if>
							                    			
							                    			
								                        </div>
								                    </div>
								                    </div>
								                    
								                    <div class="w3-padding">
								                        <span class="noti-hh" onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
								                        
										                        <c:if test="${BoardList.slctnSemstr == '상시' }"	>
										                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">상시 모집</span>
									                    		
									                    	</c:if>
									                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
									                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">D-${BoardList.dday}</span>
									                  			
									                    	</c:if>
									                    	<c:if test="${BoardList.percent < 0 }"	>
									                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">모집예정</span>
									                  			  	
									                    	</c:if>
									                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
									                  			  <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">오늘마감</span>
									                    	</c:if>
							                    	
							                    
								                    </div>
								                </div>

					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								     <div class="grad-banner-our w3-card w3-round-large">
					                    
					                    <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
					                      <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                      <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							               </c:if>
							               <c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                    	
							               </c:if>
					                    
					                   
					                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
					                        <h4 class="w3-padding w3-round-large" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.major}</strong><strong> ${BoardList.lab}</strong></h4>
					                        <p style="font-size: 1.8vmin;">${BoardList.slctnTitle}</p>
					                    </div>
					                    
					                    
					                    </div>
					                    <div class="w3-padding">
					                        <span class="noti-hh" onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
					                        
					                          <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                                	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">D-${BoardList.dday}</span>
							                  			
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">모집예정</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">오늘 마감</span>
							                  			  	
							                    	</c:if>
							                    	
							              
					                    </div>
					                 </div>
								   

					                                     
					                </c:if>

							              
							    </c:when>

							 
							    <c:otherwise>
							    
							      <c:if test="${BoardList.wrtbtDstnct =='일반게시판' }"	>
							      
							     
							      	
							      <div class="qna-banner w3-card w3-round-large counseling" value="${BoardList.slctnNotiNo}">
				                    <div class="w3-small w3-padding ">
				                        <span class="">Ordinary</span>
				                    </div>
				                    <div class="w3-container w3-center">
				                        <h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
				                    </div>
				                    
				                    <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		 
						             </c:if>
						             <c:if test="${BoardList.coSrorgPath  != null }"	>
						                 <img src="${pageContext.request.contextPath }${BoardList.coSrorgPath }" class="conference-banner" style="width:100%">
						             </c:if>
				                    
				                   <c:if test="${BoardList.count > 0 }"	>
						                <div class="w3-container w3-margin-top">
				                        <span class="w3-small w3-padding" >Comment</span>
				                        <p class=" w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
				                         	   ${BoardList.subwrtbtText} </p>
				                    	</div>         	
						                    		
						            </c:if>
						             <c:if test="${BoardList.count == 0 }"	>
						                    		  

						            </c:if>
				
				                   
				                </div>
										
							      
							      </c:if>
							      
							     <c:if test="${BoardList.wrtbtDstnct =='상담게시판' }"	>
							     
							     
							     	  <div class="qna-banner w3-card w3-round-large counseling" value="${BoardList.slctnNotiNo}">
					                    <div class="w3-small w3-padding ">
					                        <span class="">Question</span>
					                    </div>
					                    <div class="w3-container w3-center">
					                        <h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
					                    </div>
					                     <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		 
							             </c:if>
							             <c:if test="${BoardList.coSrorgPath  != null }"	>
							                 <img src="${pageContext.request.contextPath }${BoardList.coSrorgPath }" class="conference-banner" style="width:100%">
							             </c:if>
							             
							             
							               <c:if test="${BoardList.count > 0 }"	>
						                       <div class="w3-container w3-margin-top">
					                        <span class="w3-small w3-padding" >Answer</span>
					                        <p class=" w3-center w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
						                           ${BoardList.subwrtbtText} </p>
						                    </div>
							                    <div class="w3-container w3-center w3-padding">
							                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
							                    </div>
						                    		
						           		 </c:if>
						             	<c:if test="${BoardList.count == 0 }"	>
								                <div class="w3-container w3-center w3-padding">
							                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
							                    </div>    		  

						            	</c:if>
					                  
					                </div>
							     
							     </c:if>
						

							    </c:otherwise>
			 
							</c:choose>

				    </c:when>

				</c:choose>
						                
		  		
		  			</c:if>
                  </c:forEach>  
                    
                </div>
					

                
          <div class="col-xs-12 col-sm-4 col-lg-4">
				
				
				<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
                
                    <c:if test="${BoardList.orderNum%3 ==2 }"	>
		  		
						
		  			  <c:choose>
 
							<c:when test="${calList.year ==BoardList.year && calList.month ==BoardList.month && calList.day == BoardList.day }">
					
					 	 			
			                <c:choose>
			 
								 <c:when test="${BoardList.slctnNotiDstnct == '연구실'}">
								  		
								  <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  
								  
								  
								  			   <div class="lab-banner w3-card w3-round-large">
								  			   <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
								  			   <c:if test="${BoardList.bk21EorgnzSuprtYn =='Y' }"	>
								  			   	 <div class="w3-small w3-padding  "style="margin-bottom: -1.5em; height: 2.7em">
							                        <span class="w3-red " style="padding-right: 2px; padding-left: 10px; margin-right: -5px">BK</span>
							                        <span class="w3-blue " style="padding-right: 5px; padding-left: 0px;">21+</span>
							                    </div>
								  			   
								  			   </c:if>
								  			   
								  			   
								  			   <c:if test="${BoardList.storgPath == null }"	>
						                    		${BoardList.university} ${BoardList.graduate }
						                    	</c:if>
						                    	<c:if test="${BoardList.storgPath != null }"	>
						                    		  <img src="${pageContext.request.contextPath }${BoardList.storgPath }" style="width:100%; padding: 1em 1em 0 1em;">
						                    	</c:if>
						                       
							             
							                    <div class="w3-container w3-center">
							                        <h4 style="font-size: 1.8vmin;"><strong>${BoardList.major} ${BoardList.lab }</strong></h4>
							                        <p style="font-size: 1.8vmin;"><span class="grad-target"></span>${BoardList.slctnTitle}</p>
							                    </div>
							                    <div class="research-field w3-padding text-center">
							                    
							                    
								                     <c:forEach items="${majorList}" var="majorList" varStatus="status">
							                        	<c:if test="${BoardList.slctnNotiNo == majorList.slctnNotiNo }"	>
							                    		  <span class="w3-tag w3-black w3-tiny  ">${majorList.cdNm}</span>
							                    		</c:if>
							                        
							                        
							                        </c:forEach>
								                     
							                 
							                    </div>
							                    </div>
							                    <div class="w3-padding">
							                        <span class="noti-hh"  onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
							                        	    <c:if test="${BoardList.slctnSemstr == '상시' }"	>
						                              <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">D-${BoardList.dday}</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">모집예정</span>
							                  			 	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">오늘마감</span>
							                  			 
							                    	</c:if>
							                    </div>
							                </div>
								

					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								   			  <div class="grad-banner-our w3-card w3-round-large">
								                   <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
								                   	<c:if test="${BoardList.slctnSemstr == '상시' }"	>
							                    		  
							                    		  <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                    	<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                  			 	
							                    	</c:if>
								                   
								                   
								                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								                        <h5 class="w3-padding" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.university} </strong><strong>${BoardList.graduate} ${BoardList.major} ${BoardList.lab}</strong></h5>
								                        <p style="font-size: 1.8vmin;">${BoardList.slctnTitle}</p>
								                    </div>
								                    
								                    </div>
								                    
								                    <div class="w3-padding">
								                        <span class="noti-hh" onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
								                        
								                        <c:if test="${BoardList.slctnSemstr == '상시' }"	>
								                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">상시 모집</span>
							                    		
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">D-${BoardList.dday}</span>
								                  				  	
								                    	</c:if>
								                    	<c:if test="${BoardList.percent < 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">모집예정</span>
								                  			   	
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">오늘 마감</span>
								                  				
								                    	</c:if>
								                        
								                    </div>
								                </div>

					                                     
					                </c:if>
								 
							              
							    </c:when>
			 					
							   
								 <c:when test="${BoardList.slctnNotiDstnct == '대학원'}">
								 
								 
								   <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  				
								  	  		    <div class="grad-banner w3-card w3-round-large" >
								                    <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
								                    <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
								                    
								                    <c:if test="${BoardList.storgPath == null }"	>
						                    		${BoardList.major}
							                    	</c:if>
							                    	<c:if test="${BoardList.storgPath != null }"	>
							                    		  <img src="${pageContext.request.contextPath }${BoardList.storgPath }"  style="width:100%; padding: 1em 1em 0 1em;">
							                    	</c:if>
								                    
								                    <div class="w3-container w3-center">
								                        <h4><strong>${BoardList.lab}</strong></h4>
								                        <p style="font-size: 1.8vmin;"><span class="grad-target"></span>${BoardList.slctnTitle}</p>
								                    </div>
								                    
								                    	
							 	
							                    			
								                    <div class="noti-period">
								                        <div class="w3-light-grey w3-tiny">
								                            
								                            <c:if test="${BoardList.slctnSemstr == '상시' || BoardList.percent <0 }"	>
							                    				<div class="w3-container "
							                                 style="width: 0; height: 1px;"></div>
							                    			</c:if>
							                    			<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                  				  	<div class="w3-container w3-black"
							                                 style="width: ${BoardList.percent}%; height: 1px;"></div>
							                    			</c:if>
							                    			
							                    			
								                        </div>
								                    </div>
								                    </div>
								                    
								                    <div class="w3-padding">
								                        <span class="noti-hh" onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
								                        
										                        <c:if test="${BoardList.slctnSemstr == '상시' }"	>
										                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">상시 모집</span>
									                    		
									                    	</c:if>
									                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
									                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">D-${BoardList.dday}</span>
									                  			
									                    	</c:if>
									                    	<c:if test="${BoardList.percent < 0 }"	>
									                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">모집예정</span>
									                  			  	
									                    	</c:if>
									                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
									                  			  <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">오늘마감</span>
									                    	</c:if>
							                    	
							                    
								                    </div>
								                </div>

						                
					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								     <div class="grad-banner-our w3-card w3-round-large">
					                    
					                    <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
					                      <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                      <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							               </c:if>
							               <c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                    	
							               </c:if>
					                    
					                   
					                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
					                        <h4 class="w3-padding w3-round-large" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.major}</strong><strong> ${BoardList.lab}</strong></h4>
					                        <p style="font-size: 1.8vmin;">${BoardList.slctnTitle}</p>
					                    </div>
					                    
					                    
					                    </div>
					                    <div class="w3-padding">
					                        <span class="noti-hh" onclick="doScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo}"></i></span>
					                        
					                          <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                                	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">D-${BoardList.dday}</span>
							                  			
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">모집예정</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">오늘 마감</span>
							                  			  	
							                    	</c:if>
	
					                    </div>
					                 </div>

					                                     
					                </c:if>

							              
							    </c:when>

							 
							    <c:otherwise>
							    
							      <c:if test="${BoardList.wrtbtDstnct =='일반게시판' }"	>
							      
							     
							      	
							      <div class="qna-banner w3-card w3-round-large counseling" value="${BoardList.slctnNotiNo}">
				                    <div class="w3-small w3-padding ">
				                        <span class="">Ordinary</span>
				                    </div>
				                    <div class="w3-container w3-center">
				                        <h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
				                    </div>
				                    
				                    <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		 
						             </c:if>
						             <c:if test="${BoardList.coSrorgPath  != null }"	>
						                 <img src="${pageContext.request.contextPath }${BoardList.coSrorgPath }" class="conference-banner" style="width:100%">
						             </c:if>
				                    
				                   <c:if test="${BoardList.count > 0 }"	>
						                <div class="w3-container w3-margin-top">
				                        <span class="w3-small w3-padding" >Comment</span>
				                        <p class=" w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
				                         	   ${BoardList.subwrtbtText} </p>
				                    	</div>         	
						                    		
						            </c:if>
						             <c:if test="${BoardList.count == 0 }"	>
						                    		  

						            </c:if>
				
				                   
				                </div>

							      </c:if>
							      
							     <c:if test="${BoardList.wrtbtDstnct =='상담게시판' }"	>
							     
							     
							     	  <div class="qna-banner w3-card w3-round-large counseling" value="${BoardList.slctnNotiNo}">
					                    <div class="w3-small w3-padding ">
					                        <span class="">Question</span>
					                    </div>
					                    <div class="w3-container w3-center">
					                        <h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
					                    </div>
					                     <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		 
							             </c:if>
							             <c:if test="${BoardList.coSrorgPath  != null }"	>
							                 <img src="${pageContext.request.contextPath }${BoardList.coSrorgPath }" class="conference-banner" style="width:100%">
							             </c:if>
							             
							             
							               <c:if test="${BoardList.count > 0 }"	>
						                       <div class="w3-container w3-margin-top">
					                        <span class="w3-small w3-padding" >Answer</span>
					                        <p class=" w3-center w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
						                           ${BoardList.subwrtbtText} </p>
						                    </div>
							                    <div class="w3-container w3-center w3-padding">
							                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
							                    </div>
						                    		
						           		 </c:if>
						             	<c:if test="${BoardList.count == 0 }"	>
								                <div class="w3-container w3-center w3-padding">
							                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
							                    </div>    		  

						            	</c:if>
					                 </div>
							      </c:if>
						    	</c:otherwise>
			 				</c:choose>
				    	</c:when>
					</c:choose>		
				</c:if>
   		 	</c:forEach>  
		</div>
	</div>
</c:forEach>
</div>
</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/study.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/doscrap.js"></script>	
	
</body>
</html>