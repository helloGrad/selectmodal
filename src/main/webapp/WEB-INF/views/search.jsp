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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">


<style>
.distinct-line {
	padding-top: 4.5em;
}
.reply-text {
	display: block;
	text-overflow:ellipsis;
	white-space:nowrap;
	word-wrap:normal;
	overflow:hidden;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />


	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8 distinct-line">
				<c:choose>
					<c:when test="${fn:length(notiList)<=0 }">
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-lg-4 centering">
								<h3>모집공고</h3>
							</div>
						</div>
						<ul class="w3-ul">
							<c:forEach items="${notiList }" var="notiVo" varStatus="status">
								<li class="w3-padding-16"><a href="${pageContext.servletContext.contextPath }/noti/detail?no=${notiVo.slctnNotiNo}&tabnm=${notiVo.slctnNotiDstnct}">
								<span class="w3-large">${notiVo.orgnzFullNm } ${notiVo.major } ${notiVo.lab }
										${notiVo.slctnTitle } </span></a></li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${fn:length(organzList)<=0 }">
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-lg-4 centering">
								<h3>기관</h3>
							</div>
						</div>
						<ul class="w3-ul">
							<c:forEach items="${organzList }" var="organzVo"
								varStatus="status">
								<li class="w3-padding-16"><a href="${organzVo.hmpageUrl }"><span class="w3-large">${organzVo.orgnzFullNm }
								</span></a></li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${fn:length(counselingList)<=0 }">
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-lg-4 centering">
								<h3>게시글</h3>
							</div>
						</div>
						<ul class="w3-ul">
							<c:forEach items="${counselingList }" var="counselingVo"
								varStatus="status">
								<c:choose>									
									<c:when test="${counselingVo.wrtbtTypeDstnct=='답글' }">
									<h5>답변</h5>
										<li class="w3-padding-16"><a class='detail' href="/net/counseling/detail?no=${counselingVo.prntsWrtbtNo }&type=reply"><span class="w3-large reply-text">${counselingVo.wrtbtText }
										</span></a></li>	
									</c:when>
									<c:when test="${counselingVo.wrtbtTypeDstnct=='원글' }">
									<h5>질문</h5>
										<li class="w3-padding-16"><a class='detail' href="/net/counseling/detail?no=${counselingVo.wrtbtNo }&type=prnts"><span class="w3-large">${counselingVo.wrtbtTitle }
										</span></a></li>	
									</c:when>
								</c:choose>
								
								
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
</body>

</html>