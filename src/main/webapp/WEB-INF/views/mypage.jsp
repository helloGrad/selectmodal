<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>하이그래드넷</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/counseling.js"></script>

	

<link rel="stylesheet" href="css/font-awesome.min.css">
<link href="css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<script type="text/javascript">
$(function() {
	
	
	
	var authUser = $("#mbNo").val();
	
	
	if(authUser == null || authUser == "" ){
		
		console.log("ddd")
		
	}else{
		console.log("ddd")
	
		var scrapList=JSON.parse('${scrapList}');
		for(var i=0;i<scrapList.length;i++){
			if(scrapList[i].prntsDstnct==='모집공고'){ //게시글
				
				
				$('.do-scrapnoti' + scrapList[i].prntsNo).addClass('scrap-on');
			}
		};	
		
	};
	
$(document).on('click', ".counseling", function(event) { 
		
		
		click_id = $(this).attr('value');
		console.log(click_id);
	
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
		
		console.log(click_id);
	
		
		
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





<style>
.row{
	clear: both;
}
.jumbotron {
	position: relative;
	z-index: 1;
	height: 25em;
    margin-bottom: 0.1em;
    text-align: center;
    background-size: cover;
}
.user-info {
	color : #FFFFFF;
    padding-top: 4em;
}
.user-info-box {
	background-color : rgba(78,18,201,0.8) !important;
    height : 20em;
}
.user-info-list{
	float: left;
    margin-left: 1em;
    color : #FFFFFF;
    font-size: 1.2em;
    list-style-type : none;
}
.user-info-weight {
    font-weight: 100;
    margin-left: 0.5em;
}
.user-info-list-box {
    border: 1px solid #f0f0f0;
    width: 100%;
     height: 100%;
}
.navbar {
	background-color: rgba(255, 255, 255, 0.95);
}
.navbar-qna {
	font-weight: 400;
	margin-top: -5px;
	margin-bottom: -5px;
	margin-left: -1em;
	font-size: 1.5vmin;
	letter-spacing: 4px;
	float: left;
}
.navbar-nav li a:hover {
	color: #1abc9c !important;
	background-color: white;
}
.grad-background-color {
	background-color: rgb(247, 245, 242);
}
/* nav-bar End */
body {
	padding-top: 5em;
}
.grad-banner {
	box-shadow: 5px 10px 10px rgba(102, 102, 255, 0.3), -1px -1px 10px
		rgba(136, 176, 75, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}
.grad-banner:hover {
	box-shadow: 5px 10px 30px rgba(102, 102, 255, 0.5), -1px -1px 30px
		rgba(136, 176, 75, 0.5);
	margin-bottom: 1.5em;
}
.lab-banner {
	box-shadow: 5px 10px 10px rgba(51, 102, 255, 0.3), -1px -1px 10px
		rgba(75, 0, 130, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}
.lab-banner:hover {
	box-shadow: 5px 10px 30px rgba(51, 102, 255, 0.5), -1px -1px 30px
		rgba(75, 0, 130, 0.5);
	margin-bottom: 1.5em;
}
.conference-banner {
	box-shadow: 5px 10px 10px rgba(51, 102, 255, 0.3), -1px -1px 10px
		rgba(153, 0, 153, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}
.conference-banner:hover {
	box-shadow: 5px 10px 30px rgba(51, 102, 255, 0.5), -1px -1px 30px
		rgba(153, 0, 153, 0.5);
	margin-bottom: 1.5em;
	background-color: white;
}
.qna-banner {
	box-shadow: 5px 10px 10px rgba(0, 0, 51, 0.3), -1px -1px 10px
		rgba(0, 0, 51, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}
.qna-banner:hover {
	box-shadow: 5px 10px 30px rgba(0, 0, 51, 0.5), -1px -1px 30px
		rgba(0, 0, 51, 0.5);
	margin-bottom: 1.5em;
}
.content-answers {
	height: 3.5em;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: normal;
}
.grad-banner-our {
	box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.15), -1px -1px 10px
		rgba(0, 0, 0, 0.15);
	margin-bottom: 1.5em;
	background-color: white;
}
.scrap-on {
	color: #FF0000;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />


	<div class="row major-nav-box">
		<div class="jumbotron user-info-box">
			<div class="container">
				<input id='mbNo' type="hidden" value="${authUser.mbNo }">
				<h2 class="text-left user-info"
					style="color: white; font-weight: bold">${authUser.nknm }</h2>
				<div class="row user-info-list-box">
					<ul>

						<li class=" user-info-list"><i
							class="glyphicon glyphicon-education"></i> <span
							class="user-info-weight"> <c:set var="cindex" value='0' />
								<c:forEach var='infoList' items='${infoList }'
									varStatus="status">

									<c:if test="${infoList.cdDstnct=='학문' }">

										<c:if test="${cindex=='0'}">
								${infoList.cdNm }
							</c:if>
										<c:if test="${cindex!='0' }">
								/${infoList.cdNm }
							</c:if>

										<c:set var="cindex" value='1' />
									</c:if>

								</c:forEach> <c:if test="${cindex=='0' }">분야 미설정</c:if>
						</span></li>

						<li class=" user-info-list"><i
							class="glyphicon glyphicon-search"></i> <span
							class="user-info-weight"> <c:set var="cindex" value='0' />
								<c:forEach var='infoList' items='${infoList }'
									varStatus="status">

									<c:if test="${infoList.cdDstnct=='연구분야' }">

										<c:if test="${cindex=='0'}">
								${infoList.cdNm }
							</c:if>
										<c:if test="${cindex!='0' }">
								/${infoList.cdNm }
							</c:if>

										<c:set var="cindex" value='1' />
									</c:if>

								</c:forEach> <c:if test="${cindex=='0' }">연구분야 미설정</c:if>
						</span></li>

						<li class=" user-info-list "><i
							class="glyphicon glyphicon-road"></i> <span
							class="user-info-weight"> <c:set var="cindex" value='0' />
								<c:forEach var='infoList' items='${infoList }'
									varStatus="status">

									<c:if test="${infoList.cdDstnct=='방문목적' }">

										<c:if test="${cindex=='0'}">
								${infoList.cdNm }
							</c:if>
										<c:if test="${cindex!='0' }">
								/${infoList.cdNm }
							</c:if>

										<c:set var="cindex" value='1' />
									</c:if>

								</c:forEach> <c:if test="${cindex=='0' }">방문목적 미설정</c:if>
						</span></li>

						<li class=" user-info-list"><i
							class="glyphicon glyphicon-map-marker"></i> <span
							class="user-info-weight"> <c:set var="cindex" value='0' />
								<c:forEach var='infoList' items='${infoList }'
									varStatus="status">

									<c:if test="${infoList.cdDstnct=='지역' }">

										<c:if test="${cindex=='0'}">
								${infoList.cdNm }
							</c:if>
										<c:if test="${cindex!='0' }">
								/${infoList.cdNm }
							</c:if>

										<c:set var="cindex" value='1' />
									</c:if>

								</c:forEach> <c:if test="${cindex=='0' }">지역 미설정</c:if>
						</span></li>
					</ul>

				</div>
			</div>
		</div>

	</div>
	<div class="row">
		<div class="container"></div>
	</div>

	<!--
    main contents
    page
-->
	<div class="row">

		<div class="container">
			<ul class="nav navbar-nav navbar-left"
				style="margin-top: 10px;">
				<li><a href="${pageContext.request.contextPath}/user/mypage">새소식</a></li>
				<li><a href="${pageContext.request.contextPath}/user/mypage?type=noti">모집공고</a></li>
				<li><a href="${pageContext.request.contextPath}/user/mypage?type=myboard">내가 쓴 글</a></li>
				<li><a href="${pageContext.request.contextPath}/user/mypage?type=myscrap">스크랩</a></li>
			</ul>
			
			
			<c:if test="${type == 'myscrap' || type == 'myboard' }">
			<c:forEach var="i" begin="1" end="2" step="1">

			<div class="row">
				<!--시작 라인-->
				<hr>
				<!--내용-->
				<div class="col-xs-12 col-sm-4 col-lg-4">
					<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
					<c:set var="name" value="${BoardList.wrtbtDstnct}" />
					<c:set var="leng" value="${fn:length(name)}" />
					
						<c:if test="${(i=='1' && fn:substring(name,leng-3,leng)=='게시판' && BoardList.no%3 == 1) || (i=='2' && fn:substring(name,leng-3,leng)!='게시판' && BoardList.no%3 == 1) }">
							
							<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='Y'}">
								<div class="grad-banner w3-card w3-round-large" >
								<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
									<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year}년 ${BoardList.slctnSemstr}</div>
									<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width: 100%; padding: 1em 1em 0 1em;">
									<div class="w3-container w3-center">
										<h4><strong>${BoardList.lab }</strong></h4>
										<p style="font-size: 1.8vmin;">
											<span class="grad-target">${BoardList.slctnTitle }</span>
										</p>
									</div>
									<div class="noti-period">
										<div class="w3-light-grey w3-tiny">
		                            	<c:if test="${BoardList.percent<=0 }">
	                            			<div class="w3-container" style="width: 0%; height: 1px;"></div>
	                            		</c:if>
	                            		<c:if test="${BoardList.percent>0 }">
		                            		<div class="w3-container w3-black" style="width: ${BoardList.percent }%; height: 1px;"></div>
	                            		</c:if>
	                            		</div>									
									</div>
									</div>
										<div class="w3-padding">
										<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float: right;"> 
											<c:if test="${BoardList.percent<=0 }">
												모집 예정
											</c:if>
											<c:if test="${BoardList.percent>0 }">
												D-${BoardList.dday }
											</c:if>
										</span>
										</div>
									
									</div>

								</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='N'}">
					
						<div class="grad-banner-our w3-card w3-round-large">
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year }년 ${BoardList.slctnSemstr}</div>
							<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								<h4 class="w3-padding w3-round-large" style="margin-bottom: 0em;">
									<strong style="color: ${BoardList.symbolColorNm };">${BoardList.major }</strong>
									<strong>${BoardList.lab }</strong>
								</h4>
								<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
							</div>
							</div>
							<div class="w3-padding">
								<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
								<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"	style="float: right;">
									<c:if test="${BoardList.percent<=0 }">
										모집 예정
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										D-${BoardList.dday }
									</c:if>
								</span>
							</div>
						</div>
						
					</c:if>


					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='Y'}">
									
						<div class="lab-banner w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<c:if test="${BoardList.bk21EorgnzSuprtYn=='Y' }">
								<div class="w3-small w3-padding  "style="margin-bottom: -1.5em; height: 2.7em">
	                        		<span class="w3-red " style="padding-right: 2px; padding-left: 10px; margin-right: -5px">BK</span>
    	                    		<span class="w3-blue " style="padding-right: 5px; padding-left: 0px;">21+</span>
        	            		</div>						
						
							</c:if>
                    	<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width:100%; padding: 1em 1em 0 1em;">
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.graduate }</strong></h4>
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.lab }</strong></h4>
                        	<p style="font-size: 1.8vmin;"><span class="grad-target">${BoardList.slctnTitle }</span></p>
                    	</div>
                    	<div class="research-field w3-padding text-center">
                    		<c:forEach items="${BoardList.researchList }" var="resList"	varStatus="status">
								<span class="w3-tag w3-black w3-tiny ">${resList.cdNm }</span>
							</c:forEach>
                    	</div>
                    	</div>
                    	<div class="w3-padding">
                        	<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">
                        		<c:if test="${BoardList.percent<=0 }">
	                        		모집 예정
	                        	</c:if>
								<c:if test="${BoardList.percent>0 }">
	                        		D-${BoardList.dday }
	                        	</c:if>
	                        </span>
                    	</div>
                		</div>

					</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='N'}" >
									
						<div class="lab-banner w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
                    		<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
                        		<h5 class="w3-padding" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm };">${BoardList.university } </strong></h5>
                        		<h5><strong>${BoardList.graduate } ${BoardList.lab }</strong></h5>
                        		<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
                    		</div>
                    		</div>
                    		<div class="w3-padding">
                        		<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        		<c:if test="${BoardList.slctnEndDt == '9999-12-31 00:00:00.0' }">
                        			<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">상시모집</span>
								</c:if>

								<c:if test="${BoardList.slctnEndDt != '9999-12-31 00:00:00.0' }">
									<c:if test="${BoardList.percent<=0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">모집예정</span>
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">D-${BoardList.dday }</span>
									</c:if>
								</c:if>
                    		</div>
                		</div>
					</c:if>
					
					<c:if test="${'게시판' == fn:substring(name,leng-3,leng)}">
					<div class="qna-banner w3-card w3-round-large">
                    	<div class="w3-small w3-padding ">
                        	<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="">Question</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="">Ordinary</span>
                    		</c:if>
                    	</div>
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
                    	</div>
                    	<c:if test="${BoardList.storgPath ne null }">
                    		<img src="${BoardList.storgPath }" alt="게시판 이미지 자리" style="width:100%;">
                    	</c:if>
                    	<div class="w3-container w3-margin-top">
                    		<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="w3-small w3-padding" >Answer</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="w3-small w3-padding" >Comment</span>
                    		</c:if>
							<c:if test="${BoardList.count>0 }">
								<c:if test="${fn:substring(name,0,2) !='상담' }">
                        			<p class="w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
								</c:if>
                        		<c:if test="${fn:substring(name,0,2) =='상담'}">
                        			<p class="w3-center w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
                    			</c:if>
								
							</c:if>
                    	</div>
                    	<c:if test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
                    		<div class="w3-container w3-center w3-padding">
                        	<button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" value=${BoardList.slctnNotiNo } style="letter-spacing: 2px;">답변하기</button>
                    		</div>
                    	</c:if>
                    	
                    	
                	</div>
					</c:if>
				</c:if>
				</c:forEach>
			</div>
				<div class="col-xs-12 col-sm-4 col-lg-4">
					<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
					<c:set var="name" value="${BoardList.wrtbtDstnct}" />
					<c:set var="leng" value="${fn:length(name)}" />
					
						<c:if test="${(i=='1' && fn:substring(name,leng-3,leng)=='게시판' && BoardList.no%3 == 2) || (i=='2' && fn:substring(name,leng-3,leng)!='게시판' && BoardList.no%3 == 2) }">
							<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='Y'}">
								<div class="grad-banner w3-card w3-round-large" >
								<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
									<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year}년 ${BoardList.slctnSemstr}</div>
									<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width: 100%; padding: 1em 1em 0 1em;">
									<div class="w3-container w3-center">
										<h4><strong>${BoardList.lab }</strong></h4>
										<p style="font-size: 1.8vmin;">
											<span class="grad-target">${BoardList.slctnTitle }</span>
										</p>
									</div>
									<div class="noti-period">
										<div class="w3-light-grey w3-tiny">
		                            	<c:if test="${BoardList.percent<=0 }">
	                            			<div class="w3-container" style="width: 0%; height: 1px;"></div>
	                            		</c:if>
	                            		<c:if test="${BoardList.percent>0 }">
		                            		<div class="w3-container w3-black" style="width: ${BoardList.percent }%; height: 1px;"></div>
	                            		</c:if>
	                            		</div>									
									</div>
									</div>
										<div class="w3-padding">
										<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float: right;"> 
											<c:if test="${BoardList.percent<=0 }">
												모집 예정
											</c:if>
											<c:if test="${BoardList.percent>0 }">
												D-${BoardList.dday }
											</c:if>
										</span>
										</div>
									
									</div>

								</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='N'}">
					
						<div class="grad-banner-our w3-card w3-round-large">
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year }년 ${BoardList.slctnSemstr}</div>
							<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								<h4 class="w3-padding w3-round-large" style="margin-bottom: 0em;">
									<strong style="color: ${BoardList.symbolColorNm };">${BoardList.major }</strong>
									<strong>${BoardList.lab }</strong>
								</h4>
								<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
							</div>
							</div>
							<div class="w3-padding">
								<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
								<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"	style="float: right;">
									<c:if test="${BoardList.percent<=0 }">
										모집 예정
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										D-${BoardList.dday }
									</c:if>
								</span>
							</div>
						</div>
						
					</c:if>


					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='Y'}">
									
						<div class="lab-banner w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<c:if test="${BoardList.bk21EorgnzSuprtYn=='Y' }">
								<div class="w3-small w3-padding  "style="margin-bottom: -1.5em; height: 2.7em">
	                        		<span class="w3-red " style="padding-right: 2px; padding-left: 10px; margin-right: -5px">BK</span>
    	                    		<span class="w3-blue " style="padding-right: 5px; padding-left: 0px;">21+</span>
        	            		</div>						
						
							</c:if>
                    	<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width:100%; padding: 1em 1em 0 1em;">
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.graduate }</strong></h4>
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.lab }</strong></h4>
                        	<p style="font-size: 1.8vmin;"><span class="grad-target">${BoardList.slctnTitle }</span></p>
                    	</div>
                    	<div class="research-field w3-padding text-center">
                    		<c:forEach items="${BoardList.researchList }" var="resList"	varStatus="status">
								<span class="w3-tag w3-black w3-tiny ">${resList.cdNm }</span>
							</c:forEach>
                    	</div>
                    	</div>
                    	<div class="w3-padding">
                        	<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">
                        		<c:if test="${BoardList.percent<=0 }">
	                        		모집 예정
	                        	</c:if>
								<c:if test="${BoardList.percent>0 }">
	                        		D-${BoardList.dday }
	                        	</c:if>
	                        </span>
                    	</div>
                		</div>

					</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='N'}" >
									
						<div class="lab-banner w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
                    		<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
                        		<h5 class="w3-padding" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm };">${BoardList.university } </strong></h5>
                        		<h5><strong>${BoardList.graduate } ${BoardList.lab }</strong></h5>
                        		<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
                    		</div>
                    		</div>
                    		<div class="w3-padding">
                        		<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        		<c:if test="${BoardList.slctnEndDt == '9999-12-31 00:00:00.0' }">
                        			<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">상시모집</span>
								</c:if>

								<c:if test="${BoardList.slctnEndDt != '9999-12-31 00:00:00.0' }">
									<c:if test="${BoardList.percent<=0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">모집예정</span>
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">D-${BoardList.dday }</span>
									</c:if>
								</c:if>
                    		</div>
                		</div>
					</c:if>
					
					<c:if test="${'게시판' == fn:substring(name,leng-3,leng)}">
					<div class="qna-banner w3-card w3-round-large">
                    	<div class="w3-small w3-padding ">
                        	<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="">Question</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="">Ordinary</span>
                    		</c:if>
                    	</div>
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
                    	</div>
                    	<c:if test="${BoardList.storgPath ne null }">
                    		<img src="${BoardList.storgPath }" alt="게시판 이미지 자리" style="width:100%;">
                    	</c:if>
                    	<div class="w3-container w3-margin-top">
                    		<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="w3-small w3-padding" >Answer</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="w3-small w3-padding" >Comment</span>
                    		</c:if>
							<c:if test="${BoardList.count>0 }">
								<c:if test="${fn:substring(name,0,2) !='상담' }">
                        			<p class="w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
								</c:if>
                        		<c:if test="${fn:substring(name,0,2) =='상담'}">
                        			<p class="w3-center w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
                    			</c:if>
							</c:if>
                    	</div>
                    	
                    	<c:if test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
                    		<div class="w3-container w3-center w3-padding">
                        	<button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" value=${BoardList.slctnNotiNo } style="letter-spacing: 2px;">답변하기</button>
                    		</div>
                    	</c:if>
                    	
                    	
                	</div>
					</c:if>
				</c:if>
				</c:forEach>
			</div>
				<div class="col-xs-12 col-sm-4 col-lg-4">
					<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
					<c:set var="name" value="${BoardList.wrtbtDstnct}" />
					<c:set var="leng" value="${fn:length(name)}" />
					
						<c:if test="${(i=='1' && fn:substring(name,leng-3,leng)=='게시판' && BoardList.no%3 == 0) || (i=='2' && fn:substring(name,leng-3,leng)!='게시판' && BoardList.no%3 == 0) }">
							<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='Y'}">
								<div class="grad-banner w3-card w3-round-large" >
								<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
									<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year}년 ${BoardList.slctnSemstr}</div>
									<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width: 100%; padding: 1em 1em 0 1em;">
									<div class="w3-container w3-center">
										<h4><strong>${BoardList.lab }</strong></h4>
										<p style="font-size: 1.8vmin;">
											<span class="grad-target">${BoardList.slctnTitle }</span>
										</p>
									</div>
									<div class="noti-period">
										<div class="w3-light-grey w3-tiny">
		                            	<c:if test="${BoardList.percent<=0 }">
	                            			<div class="w3-container" style="width: 0%; height: 1px;"></div>
	                            		</c:if>
	                            		<c:if test="${BoardList.percent>0 }">
		                            		<div class="w3-container w3-black" style="width: ${BoardList.percent }%; height: 1px;"></div>
	                            		</c:if>
	                            		</div>									
									</div>
									</div>
										<div class="w3-padding">
										<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float: right;"> 
											<c:if test="${BoardList.percent<=0 }">
												모집 예정
											</c:if>
											<c:if test="${BoardList.percent>0 }">
												D-${BoardList.dday }
											</c:if>
										</span>
										</div>
									
									</div>

								</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='N'}">
					
						<div class="grad-banner-our w3-card w3-round-large">
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year }년 ${BoardList.slctnSemstr}</div>
							<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								<h4 class="w3-padding w3-round-large" style="margin-bottom: 0em;">
									<strong style="color: ${BoardList.symbolColorNm };">${BoardList.major }</strong>
									<strong>${BoardList.lab }</strong>
								</h4>
								<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
							</div>
							</div>
							<div class="w3-padding">
								<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
								<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"	style="float: right;">
									<c:if test="${BoardList.percent<=0 }">
										모집 예정
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										D-${BoardList.dday }
									</c:if>
								</span>
							</div>
						</div>
						
					</c:if>


					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='Y'}">
									
						<div class="lab-banner w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<c:if test="${BoardList.bk21EorgnzSuprtYn=='Y' }">
								<div class="w3-small w3-padding  "style="margin-bottom: -1.5em; height: 2.7em">
	                        		<span class="w3-red " style="padding-right: 2px; padding-left: 10px; margin-right: -5px">BK</span>
    	                    		<span class="w3-blue " style="padding-right: 5px; padding-left: 0px;">21+</span>
        	            		</div>						
						
							</c:if>
                    	<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width:100%; padding: 1em 1em 0 1em;">
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.graduate }</strong></h4>
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.lab }</strong></h4>
                        	<p style="font-size: 1.8vmin;"><span class="grad-target">${BoardList.slctnTitle }</span></p>
                    	</div>
                    	<div class="research-field w3-padding text-center">
                    		<c:forEach items="${BoardList.researchList }" var="resList"	varStatus="status">
								<span class="w3-tag w3-black w3-tiny ">${resList.cdNm }</span>
							</c:forEach>
                    	</div>
                    	</div>
                    	<div class="w3-padding">
                        	<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">
                        		<c:if test="${BoardList.percent<=0 }">
	                        		모집 예정
	                        	</c:if>
								<c:if test="${BoardList.percent>0 }">
	                        		D-${BoardList.dday }
	                        	</c:if>
	                        </span>
                    	</div>
                		</div>

					</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='N'}" >
									
						<div class="lab-banner w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
                    		<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
                        		<h5 class="w3-padding" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm };">${BoardList.university } </strong></h5>
                        		<h5><strong>${BoardList.graduate } ${BoardList.lab }</strong></h5>
                        		<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
                    		</div>
                    		</div>
                    		<div class="w3-padding">
                        		<span class="noti-hh"><i
													class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        		<c:if test="${BoardList.slctnEndDt == '9999-12-31 00:00:00.0' }">
                        			<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">상시모집</span>
								</c:if>

								<c:if test="${BoardList.slctnEndDt != '9999-12-31 00:00:00.0' }">
									<c:if test="${BoardList.percent<=0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">모집예정</span>
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">D-${BoardList.dday }</span>
									</c:if>
								</c:if>
                    		</div>
                		</div>
					</c:if>
					
					<c:if test="${'게시판' == fn:substring(name,leng-3,leng)}">
					<div class="qna-banner w3-card w3-round-large">
                    	<div class="w3-small w3-padding ">
                        	<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="">Question</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="">Ordinary</span>
                    		</c:if>
                    	</div>
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
                    	</div>
                    	<c:if test="${BoardList.storgPath ne null }">
                    		<img src="${BoardList.storgPath }" alt="게시판 이미지 자리" style="width:100%;">
                    	</c:if>
                    	<div class="w3-container w3-margin-top">
                    		<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="w3-small w3-padding" >Answer</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="w3-small w3-padding" >Comment</span>
                    		</c:if>
							<c:if test="${BoardList.count>0 }">
								<c:if test="${fn:substring(name,0,2) !='상담' }">
                        			<p class="w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
								</c:if>
                        		<c:if test="${fn:substring(name,0,2) =='상담'}">
                        			<p class="w3-center w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
                    			</c:if>
							</c:if>
                    	</div>
                    	
                    	<c:if test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
                    		<div class="w3-container w3-center w3-padding">
                        	<button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" value=${BoardList.slctnNotiNo } style="letter-spacing: 2px;">답변하기</button>
                    		</div>
                    	</c:if>
                    	
                    	
                	</div>
					</c:if>
				</c:if>
				</c:forEach>
			</div>

				</div>

			</c:forEach>
		</c:if>	
		
		
		
		
		
		<c:if test="${type == '-1' || type == 'noti' }">
			<c:forEach items="${calList }" var="calList">
			<div class="row">
				<!--날짜 ,요일 , 년월 -->
				<h1>
					<div style="float: left; margin-right: 0.3em;">${calList.day }</div>
					<small>
						<div style="float: left; font-size: medium; line-height: 130%;">${calList.week }<br>${calList.year }년
							${calList.month }월							</div>
					</small> <br>					</h1>
				<!--시작 라인-->
				<hr>
				<!--내용-->
				<div class="col-xs-12 col-sm-4 col-lg-4">
					<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
						<c:if test="${BoardList.no%3==1 && calList.month==BoardList.month && calList.day==BoardList.day }">
						
							<c:set var="name" value="${BoardList.wrtbtDstnct}" />
							<c:set var="leng" value="${fn:length(name)}" />
							<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='Y'}">
							
								<div class="grad-banner w3-card w3-round-large" >
								<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
									<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year}년 ${BoardList.slctnSemstr}</div>
									<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width: 100%; padding: 1em 1em 0 1em;">
									<div class="w3-container w3-center">
										<h4><strong>${BoardList.lab }</strong></h4>
										<p style="font-size: 1.8vmin;">
											<span class="grad-target">${BoardList.slctnTitle }</span>
										</p>
									</div>
									<div class="noti-period">
										<div class="w3-light-grey w3-tiny">
		                            	<c:if test="${BoardList.percent<=0 }">
	                            			<div class="w3-container" style="width: 0%; height: 1px;"></div>
	                            		</c:if>
	                            		<c:if test="${BoardList.percent>0 }">
		                            		<div class="w3-container w3-black" style="width: ${BoardList.percent }%; height: 1px;"></div>
	                            		</c:if>
	                            	</div>
	                            	</div>									
									</div>
										<div class="w3-padding">
										<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float: right;"> 
											<c:if test="${BoardList.percent<=0 }">
												모집 예정
											</c:if>
											<c:if test="${BoardList.percent>0 }">
												D-${BoardList.dday }
											</c:if>
										</span>
										</div>
									</div>

								</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='N'}">
					
						<div class="grad-banner-our w3-card w3-round-large" >
						<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year }년 ${BoardList.slctnSemstr}</div>
							<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								<h4 class="w3-padding w3-round-large" style="margin-bottom: 0em;">
									<strong style="color: ${BoardList.symbolColorNm };">${BoardList.major }</strong>
									<strong>${BoardList.lab }</strong>
								</h4>
								<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
							</div>
							</div>
							<div class="w3-padding">
								<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
								<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"	style="float: right;">
									<c:if test="${BoardList.percent<=0 }">
										모집 예정
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										D-${BoardList.dday }
									</c:if>
								</span>
							</div>
							
						</div>
						
					</c:if>


					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='Y'}">
									
						<div class="lab-banner w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<c:if test="${BoardList.bk21EorgnzSuprtYn=='Y' }">
								<div class="w3-small w3-padding  "style="margin-bottom: -1.5em; height: 2.7em">
	                        		<span class="w3-red " style="padding-right: 2px; padding-left: 10px; margin-right: -5px">BK</span>
    	                    		<span class="w3-blue " style="padding-right: 5px; padding-left: 0px;">21+</span>
        	            		</div>						
						
							</c:if>
                    	<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width:100%; padding: 1em 1em 0 1em;">
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.graduate }</strong></h4>
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.lab }</strong></h4>
                        	<p style="font-size: 1.8vmin;"><span class="grad-target">${BoardList.slctnTitle }</span></p>
                    	</div>
                    	<div class="research-field w3-padding text-center">
                    		<c:forEach items="${BoardList.researchList }" var="resList"	varStatus="status">
								<span class="w3-tag w3-black w3-tiny ">${resList.cdNm }</span>
							</c:forEach>
                    	</div>
                    	</div>
                    	<div class="w3-padding">
                        	<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">
                        		<c:if test="${BoardList.percent<=0 }">
	                        		모집 예정
	                        	</c:if>
								<c:if test="${BoardList.percent>0 }">
	                        		D-${BoardList.dday }
	                        	</c:if>
	                        </span>
                    	</div>
                    	
                		</div>

					</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='N'}" >
									
						<div class="grad-banner-our w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
                    		<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year }년 ${BoardList.slctnSemstr }</div>
                    		<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
                        		<h5 class="w3-padding" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm };">${BoardList.university } </strong></h5>
                        		<h5><strong>${BoardList.graduate } ${BoardList.lab }</strong></h5>
                        		<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
                    		</div>
                    		</div>
                    		<div class="w3-padding">
                        		<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        		<c:if test="${BoardList.slctnEndDt == '9999-12-31 00:00:00.0' }">
                        			<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">상시모집</span>
								</c:if>

								<c:if test="${BoardList.slctnEndDt != '9999-12-31 00:00:00.0' }">
									<c:if test="${BoardList.percent<=0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">모집예정</span>
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">D-${BoardList.dday }</span>
									</c:if>
								</c:if>
                    		</div>
                    		
                		</div>
					</c:if>
					
					<c:if test="${'게시판' == fn:substring(name,leng-3,leng)}">
					<div class="qna-banner w3-card w3-round-large counseling" value="${BoardList.slctnNotiNo}">
                    	<div class="w3-small w3-padding ">
                        	<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="">Question</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="">Ordinary</span>
                    		</c:if>
                    	</div>
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
                    	</div>
                    	<c:if test="${BoardList.storgPath ne null }">
                    		<img src="${BoardList.storgPath }" alt="게시판 이미지 자리" style="width:100%;">
                    	</c:if>
                    	<div class="w3-container w3-margin-top">
                    		<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="w3-small w3-padding" >Answer</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="w3-small w3-padding" >Comment</span>
                    		</c:if>
							<c:if test="${BoardList.count>0 }">
								<c:if test="${fn:substring(name,0,2) !='상담' }">
                        			<p class="w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
								</c:if>
                        		<c:if test="${fn:substring(name,0,2) =='상담'}">
                        			<p class="w3-center w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
                    			</c:if>
								
							</c:if>
                    	</div>
                    	<c:if test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
                    		<div class="w3-container w3-center w3-padding">
                        	<button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" value=${BoardList.slctnNotiNo } style="letter-spacing: 2px;">답변하기</button>
                    		</div>
                    	</c:if>
                    	
                    	
                	</div>
					</c:if>
				</c:if>
				</c:forEach>
			</div>
			
				<div class="col-xs-12 col-sm-4 col-lg-4">
					<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
						<c:if test="${BoardList.no%3==2 && calList.month==BoardList.month && calList.day==BoardList.day }">
						
							<c:set var="name" value="${BoardList.wrtbtDstnct}" />
							<c:set var="leng" value="${fn:length(name)}" />
							<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='Y'}">
							
								<div class="grad-banner w3-card w3-round-large" >
								<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
									<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year}년 ${BoardList.slctnSemstr}</div>
									<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width: 100%; padding: 1em 1em 0 1em;">
									<div class="w3-container w3-center">
										<h4><strong>${BoardList.lab }</strong></h4>
										<p style="font-size: 1.8vmin;">
											<span class="grad-target">${BoardList.slctnTitle }</span>
										</p>
									</div>
									<div class="noti-period">
										<div class="w3-light-grey w3-tiny">
		                            	<c:if test="${BoardList.percent<=0 }">
	                            			<div class="w3-container" style="width: 0%; height: 1px;"></div>
	                            		</c:if>
	                            		<c:if test="${BoardList.percent>0 }">
		                            		<div class="w3-container w3-black" style="width: ${BoardList.percent }%; height: 1px;"></div>
	                            		</c:if>
	                            	</div>
	                            	</div>									
									</div>
										<div class="w3-padding">
										<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float: right;"> 
											<c:if test="${BoardList.percent<=0 }">
												모집 예정
											</c:if>
											<c:if test="${BoardList.percent>0 }">
												D-${BoardList.dday }
											</c:if>
										</span>
										</div>
									</div>

								</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='N'}">
					
						<div class="grad-banner-our w3-card w3-round-large" >
						<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year }년 ${BoardList.slctnSemstr}</div>
							<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								<h4 class="w3-padding w3-round-large" style="margin-bottom: 0em;">
									<strong style="color: ${BoardList.symbolColorNm };">${BoardList.major }</strong>
									<strong>${BoardList.lab }</strong>
								</h4>
								<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
							</div>
							</div>
							<div class="w3-padding">
								<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
								<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"	style="float: right;">
									<c:if test="${BoardList.percent<=0 }">
										모집 예정
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										D-${BoardList.dday }
									</c:if>
								</span>
							</div>
							
						</div>
						
					</c:if>


					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='Y'}">
									
						<div class="lab-banner w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<c:if test="${BoardList.bk21EorgnzSuprtYn=='Y' }">
								<div class="w3-small w3-padding  "style="margin-bottom: -1.5em; height: 2.7em">
	                        		<span class="w3-red " style="padding-right: 2px; padding-left: 10px; margin-right: -5px">BK</span>
    	                    		<span class="w3-blue " style="padding-right: 5px; padding-left: 0px;">21+</span>
        	            		</div>						
						
							</c:if>
                    	<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width:100%; padding: 1em 1em 0 1em;">
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.graduate }</strong></h4>
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.lab }</strong></h4>
                        	<p style="font-size: 1.8vmin;"><span class="grad-target">${BoardList.slctnTitle }</span></p>
                    	</div>
                    	<div class="research-field w3-padding text-center">
                    		<c:forEach items="${BoardList.researchList }" var="resList"	varStatus="status">
								<span class="w3-tag w3-black w3-tiny ">${resList.cdNm }</span>
							</c:forEach>
                    	</div>
                    	</div>
                    	<div class="w3-padding">
                        	<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">
                        		<c:if test="${BoardList.percent<=0 }">
	                        		모집 예정
	                        	</c:if>
								<c:if test="${BoardList.percent>0 }">
	                        		D-${BoardList.dday }
	                        	</c:if>
	                        </span>
                    	</div>
                    	
                		</div>

					</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='N'}" >
									
						<div class="grad-banner-our w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
                    		<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year }년 ${BoardList.slctnSemstr }</div>
                    		<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
                        		<h5 class="w3-padding" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm };">${BoardList.university } </strong></h5>
                        		<h5><strong>${BoardList.graduate } ${BoardList.lab }</strong></h5>
                        		<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
                    		</div>
                    		</div>
                    		<div class="w3-padding">
                        		<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        		<c:if test="${BoardList.slctnEndDt == '9999-12-31 00:00:00.0' }">
                        			<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">상시모집</span>
								</c:if>

								<c:if test="${BoardList.slctnEndDt != '9999-12-31 00:00:00.0' }">
									<c:if test="${BoardList.percent<=0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">모집예정</span>
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">D-${BoardList.dday }</span>
									</c:if>
								</c:if>
                    		</div>
                    		
                		</div>
					</c:if>
					
					<c:if test="${'게시판' == fn:substring(name,leng-3,leng)}">
					<div class="qna-banner w3-card w3-round-large counseling" value="${BoardList.slctnNotiNo}">
                    	<div class="w3-small w3-padding ">
                        	<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="">Question</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="">Ordinary</span>
                    		</c:if>
                    	</div>
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
                    	</div>
                    	<c:if test="${BoardList.storgPath ne null }">
                    		<img src="${BoardList.storgPath }" alt="게시판 이미지 자리" style="width:100%;">
                    	</c:if>
                    	<div class="w3-container w3-margin-top">
                    		<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="w3-small w3-padding" >Answer</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="w3-small w3-padding" >Comment</span>
                    		</c:if>
							<c:if test="${BoardList.count>0 }">
								<c:if test="${fn:substring(name,0,2) !='상담' }">
                        			<p class="w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
								</c:if>
                        		<c:if test="${fn:substring(name,0,2) =='상담'}">
                        			<p class="w3-center w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
                    			</c:if>
								
							</c:if>
                    	</div>
                    	<c:if test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
                    		<div class="w3-container w3-center w3-padding">
                        	<button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" value=${BoardList.slctnNotiNo } style="letter-spacing: 2px;">답변하기</button>
                    		</div>
                    	</c:if>
                    	
                    	
                	</div>
					</c:if>
				</c:if>
				</c:forEach>
			</div>
				<div class="col-xs-12 col-sm-4 col-lg-4">
					<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
						<c:if test="${BoardList.no%3==0 && calList.month==BoardList.month && calList.day==BoardList.day }">
						
							<c:set var="name" value="${BoardList.wrtbtDstnct}" />
							<c:set var="leng" value="${fn:length(name)}" />
							<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='Y'}">
							
								<div class="grad-banner w3-card w3-round-large" >
								<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
									<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year}년 ${BoardList.slctnSemstr}</div>
									<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width: 100%; padding: 1em 1em 0 1em;">
									<div class="w3-container w3-center">
										<h4><strong>${BoardList.lab }</strong></h4>
										<p style="font-size: 1.8vmin;">
											<span class="grad-target">${BoardList.slctnTitle }</span>
										</p>
									</div>
									<div class="noti-period">
										<div class="w3-light-grey w3-tiny">
		                            	<c:if test="${BoardList.percent<=0 }">
	                            			<div class="w3-container" style="width: 0%; height: 1px;"></div>
	                            		</c:if>
	                            		<c:if test="${BoardList.percent>0 }">
		                            		<div class="w3-container w3-black" style="width: ${BoardList.percent }%; height: 1px;"></div>
	                            		</c:if>
	                            	</div>
	                            	</div>									
									</div>
										<div class="w3-padding">
										<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float: right;"> 
											<c:if test="${BoardList.percent<=0 }">
												모집 예정
											</c:if>
											<c:if test="${BoardList.percent>0 }">
												D-${BoardList.dday }
											</c:if>
										</span>
										</div>
									</div>

								</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='N'}">
					
						<div class="grad-banner-our w3-card w3-round-large" >
						<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year }년 ${BoardList.slctnSemstr}</div>
							<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								<h4 class="w3-padding w3-round-large" style="margin-bottom: 0em;">
									<strong style="color: ${BoardList.symbolColorNm };">${BoardList.major }</strong>
									<strong>${BoardList.lab }</strong>
								</h4>
								<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
							</div>
							</div>
							<div class="w3-padding">
								<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
								<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"	style="float: right;">
									<c:if test="${BoardList.percent<=0 }">
										모집 예정
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										D-${BoardList.dday }
									</c:if>
								</span>
							</div>
							
						</div>
						
					</c:if>


					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='Y'}">
									
						<div class="lab-banner w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
							<c:if test="${BoardList.bk21EorgnzSuprtYn=='Y' }">
								<div class="w3-small w3-padding  "style="margin-bottom: -1.5em; height: 2.7em">
	                        		<span class="w3-red " style="padding-right: 2px; padding-left: 10px; margin-right: -5px">BK</span>
    	                    		<span class="w3-blue " style="padding-right: 5px; padding-left: 0px;">21+</span>
        	            		</div>						
						
							</c:if>
                    	<img src="${BoardList.storgPath }" alt="대학교 로고 이미지" style="width:100%; padding: 1em 1em 0 1em;">
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.graduate }</strong></h4>
                        	<h4 style="font-size: 1.8vmin;"><strong>${BoardList.lab }</strong></h4>
                        	<p style="font-size: 1.8vmin;"><span class="grad-target">${BoardList.slctnTitle }</span></p>
                    	</div>
                    	<div class="research-field w3-padding text-center">
                    		<c:forEach items="${BoardList.researchList }" var="resList"	varStatus="status">
								<span class="w3-tag w3-black w3-tiny ">${resList.cdNm }</span>
							</c:forEach>
                    	</div>
                    	</div>
                    	<div class="w3-padding">
                        	<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">
                        		<c:if test="${BoardList.percent<=0 }">
	                        		모집 예정
	                        	</c:if>
								<c:if test="${BoardList.percent>0 }">
	                        		D-${BoardList.dday }
	                        	</c:if>
	                        </span>
                    	</div>
                    	
                		</div>

					</c:if>

					<c:if test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='N'}" >
									
						<div class="grad-banner-our w3-card w3-round-large" >
							<div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
                    		<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.year }년 ${BoardList.slctnSemstr }</div>
                    		<div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
                        		<h5 class="w3-padding" style="margin-bottom: 0em;"><strong style="color: ${BoardList.symbolColorNm };">${BoardList.university } </strong></h5>
                        		<h5><strong>${BoardList.graduate } ${BoardList.lab }</strong></h5>
                        		<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
                    		</div>
                    		</div>
                    		<div class="w3-padding">
                        		<span class="noti-hh"><i class="glyphicon glyphicon-paperclip do-scrapnoti${BoardList.slctnNotiNo }"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo },${authUser.mbNo });"></i></span>
                        		<c:if test="${BoardList.slctnEndDt == '9999-12-31 00:00:00.0' }">
                        			<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">상시모집</span>
								</c:if>

								<c:if test="${BoardList.slctnEndDt != '9999-12-31 00:00:00.0' }">
									<c:if test="${BoardList.percent<=0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">모집예정</span>
									</c:if>
									<c:if test="${BoardList.percent>0 }">
										<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue" style="float :right;">D-${BoardList.dday }</span>
									</c:if>
								</c:if>
                    		</div>
                    		
                		</div>
					</c:if>
					
					<c:if test="${'게시판' == fn:substring(name,leng-3,leng)}">
					<div class="qna-banner w3-card w3-round-large counseling" value="${BoardList.slctnNotiNo}">
                    	<div class="w3-small w3-padding ">
                        	<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="">Question</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="">Ordinary</span>
                    		</c:if>
                    	</div>
                    	<div class="w3-container w3-center">
                        	<h4 style="font-size: 2vmin;"><strong>${BoardList.wrtbtTitle }</strong></h4>
                    	</div>
                    	<c:if test="${BoardList.storgPath ne null }">
                    		<img src="${BoardList.storgPath }" alt="게시판 이미지 자리" style="width:100%;">
                    	</c:if>
                    	<div class="w3-container w3-margin-top">
                    		<c:if test="${fn:substring(name,0,2) =='상담'}">
                    			<span class="w3-small w3-padding" >Answer</span>
                    		</c:if>
                    		<c:if test="${fn:substring(name,0,2) !='상담' }">
                    			<span class="w3-small w3-padding" >Comment</span>
                    		</c:if>
							<c:if test="${BoardList.count>0 }">
								<c:if test="${fn:substring(name,0,2) !='상담' }">
                        			<p class="w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
								</c:if>
                        		<c:if test="${fn:substring(name,0,2) =='상담'}">
                        			<p class="w3-center w3-padding content-answers w3-round-large w3-border-blue grad-background-color" style="font-size: 1.8vmin; margin-top: 0em;">
                           			${BoardList.subwrtbtText }
                        			</p>
                    			</c:if>
								
							</c:if>
                    	</div>
                    	<c:if test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
                    		<div class="w3-container w3-center w3-padding">
                        	<button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" value=${BoardList.slctnNotiNo } style="letter-spacing: 2px;">답변하기</button>
                    		</div>
                    	</c:if>
                    	
                    	
                	</div>
					</c:if>
				</c:if>
				</c:forEach>
			</div>

				</div>

			</c:forEach>
			</c:if>

		</div>
	</div>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/doscrap.js"></script>
		
	

</body>
</html>