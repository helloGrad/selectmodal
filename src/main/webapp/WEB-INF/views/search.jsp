<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>하이그레드넷</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">


<style>
.a:visited{
	color:black;
}
.distinct-line {
	padding-top: 4.5em;
}

.reply-text {
	padding:0;
	margin:0;
	width: 95%;
	display: inline-block;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
		
			<div class="w3-col s12 m12 l12 w3-border-bottom">
				<h2>Search Result</h2>
			</div>

			<div class="w3-container w3-row w3-row-padding ">
				<!--//////////////-->
				<div class="w3-col s12 m6 l6 w3-padding-16">
				
				
					<div class="w3-row w3-margin-bottom">
						<div class="w3-border-bottom w3-border-black">
							<h3>모집공고</h3>
						</div>
					</div>
					
					
					<!-- 검색결과 없는 경우 -->
					
					<c:if test="${fn:length(notiList)<=0 }">
						<div class=" w3-round-large w3-margin-bottom w3-content">
							<div class="w3-large w3-text-grey">No Result.</div>
						</div>
					</c:if>

					<div class="w3-card w3-white w3-round-large w3-margin-bottom w3-content">
						<!--대학원-->
						<div class="w3-ul">

							<c:if test="${fn:length(notiList)>0 }">
								<c:forEach items="${notiList }" var="notiVo" varStatus="status">
									<li class=""><a
										href="${pageContext.servletContext.contextPath }/noti/detail?no=${notiVo.slctnNotiNo}&tabnm=${notiVo.slctnNotiDstnct}">
											<span class="w3-medium"><b>${notiVo.orgnzFullNm }
													${notiVo.major } ${notiVo.lab }</b> ${notiVo.slctnTitle }</span> <span
											class="w3-tiny w3-right">${notiVo.slctnNotiDstnct }</span>
									</a></li>
								</c:forEach>
							</c:if>

						</div>
					</div>
					
					

					<div class="w3-row w3-margin-bottom">
						<div class=" w3-border-bottom w3-border-black">
							<h3>교육/모임</h3>
						</div>
					</div>
					<div class=" w3-round-large w3-margin-bottom w3-content">
						<div class="w3-large w3-text-grey">No Result.</div>
						<div class="w3-ul">
							<li class=""></li>
						</div>
					</div>
				</div>

				<!--//////////////-->
				<div class="row">
				<div class="w3-col s12 m6 l6 w3-row w3-padding-16">
					<div class="w3-row w3-margin-bottom">
						<div class=" w3-border-bottom w3-border-black">
							<h3>기관</h3>
						</div>
					</div>
					
					<c:if test="${fn:length(organzList)<=0 }">
						<div class=" w3-round-large w3-margin-bottom w3-content">
							<div class="w3-large w3-text-grey">No Result.</div>
						</div>
					</c:if>
					
					
					<div class="w3-card w3-white w3-round-large w3-margin-bottom w3-content">
						<div class="w3-ul">

							<c:if test="${fn:length(organzList)>0 }">
								<c:forEach items="${organzList }" var="organzVo" varStatus="status">
								<c:if test="${organzVo.orgnzDstnct=='연구실' }">
									<li class="">
									<a href="${organzVo.hmpageUrl }">
										<span class="w3-medium">
											<b>${organzVo.orgnzFullNm }</b>
										</span></a>
										<span class="w3-tiny w3-right">${organzVo.orgnzDstnct }</span>
									</li>
								</c:if>
								
								</c:forEach>
							</c:if>

						</div>
					</div>

					<div class="w3-row w3-margin-bottom">
						<div class="w3-border-bottom w3-border-black">
							<h3>게시글</h3>
						</div>
					</div>
					
					
					<c:if test="${fn:length(counselingList)<=0 }">
						<div class=" w3-round-large w3-margin-bottom w3-content">
							<div class="w3-large w3-text-grey">No Result.</div>
						</div>
					</c:if>
					
					
					<div class="w3-card w3-white w3-round-large w3-margin-bottom w3-content">
						<div class="w3-ul">
						
							<c:if test="${fn:length(counselingList)>0 }">
								<c:forEach items="${counselingList }" var="counselingVo" varStatus="status">
								
								
								<c:if test="${counselingVo.wrtbtTypeDstnct=='답글' }">
										<li class=""><a class='' href="/net/counseling/detail?no=${counselingVo.prntsWrtbtNo }&type=reply"><span class="w3-medium reply-text ">$<b>{counselingVo.wrtbtText }</b>
										</span></a>
										<span class="w3-tiny w3-right">${fn:substring(counselingVo.wrtbtDstnct, 0, 2)}</span></li>	
								</c:if>
								
								<c:if test="${counselingVo.wrtbtTypeDstnct=='원글' }">
										<li class=""><a class='' href="/net/counseling/detail?no=${counselingVo.wrtbtNo }&type=prnts"><span class="w3-medium"><b>${counselingVo.wrtbtTitle }</b>
										</span></a>
										<span class="w3-tiny w3-right">${fn:substring(counselingVo.wrtbtDstnct, 0, 2)}</span></li>	
								</c:if>
								
								
								
								</c:forEach>
							</c:if>
							
						</div>

					</div>


				</div>
				
				</div>
				
			</div>
		</div>
		</div>



</body>

</html>