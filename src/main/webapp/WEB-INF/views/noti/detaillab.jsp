<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>



<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style>

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

#map {
	height: 400px;
	width: 100%;
}
body {
	padding-top: 70px;
}
.grad-title {
	box-shadow: 5px 10px 30px rgba(51, 102, 255, 0.2), -1px -1px 30px
		rgba(102, 255, 51, 0.1);
}
.grad-background-color {
	background-color: rgb(247, 245, 242);
}
.grad-color {
	background-color: #92B558;
}
.scrap-on {
	color: #FF0000;
}
</style>
</head>


<body class="grad-background-color">

		<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="w3-round-large w3-white grad-title">

				<div class="w3-text-white w3-round-large" style="background-color:${vo.symbolColorNm};">
					<h2 class="w3-center w3-padding" style="letter-spacing: 0.2em;">
						<small class="w3-text-white">${vo.university } ${vo.major }</Small>
						<br> ${vo.lab } <br> <small class="w3-text-white">모집기간
							${vo.slctnBeginDt } ~ ${vo.slctnEndDt }</small>
					</h2>

				</div>
				<div class="w3-panel w3-white" id="section1">
					<div class="w3-container w3-row w3-padding">
						<div class="w3-margin-bottom w3-center">
							<span class="w3-default w3-center" style="letter-spacing: 0.3em;">지도교수</span>
							<span class="w3-xlarge w3-center" style="letter-spacing: 0.3em;"><b>${vo.mapProfNm }</b></span>

						</div>

						<h5 class="w3-center w3-padding">
							<span class="w3-wide w3-xlarge">모집전공</span>
						</h5>
						<div class="w3-panel">
							<div class="w3-container w3-center">
								<c:forEach items="${labCodeList }" var="codeVo"
									varStatus="status">
									<div
										class="w3-button w3-large w3-text-grey w3-border w3-padding w3-round-large w3-margin-bottom w3-border-green">${codeVo.cdNm }
									</div>
								</c:forEach>
							</div>
						</div>

						<h5 class="w3-center w3-padding">
							<span class=" w3-wide w3-xlarge" id="resume">지원자격</span>
						</h5>
						<div class="w3-content">
							<div class="w3-container w3-padding">
								<p class="w3-large w3-text-grey">${fn:replace(vo.suprtQualf, newLine,"<br>") }
								</p>
							</div>
						</div>
					</div>
				</div>

				<hr>

				<div class="w3-row-padding w3-center" style="margin-top: 1px">
					<div class="w3-container w3-row w3-center w3-padding-32">
						<div class="w3-quarter w3-text-grey w3-margin-bottom">
							<span class="w3-xlarge"> <c:choose>
									<c:when test="${vo.scrapYn=='Y' }">
										<i
											class="glyphicon glyphicon-heart-empty do-scrapnoti${vo.slctnNotiNo } scrap-on "
											onclick="doScrap('모집공고',${vo.slctnNotiNo },${authUser.mbNo });"></i>
									</c:when>
									<c:when test="${vo.scrapYn=='N' }">
										<i
											class="glyphicon glyphicon-heart-empty do-scrapnoti${vo.slctnNotiNo } "
											onclick="doScrap('모집공고',${vo.slctnNotiNo },${authUser.mbNo });"></i>
									</c:when>
								</c:choose></span> <br>${vo.scrapNum }명이 관심을 가지고 있습니다
						</div>
						<a href="#resume">
							<div class="w3-quarter w3-margin-bottom">
								<span class="w3-xlarge" style="letter-spacing: 0.3em;">모집인원</span>
								<br> <span class="w3-text-grey">${vo.slctnNops }</span>
							</div>
						</a> <a href="#support">
							<div class="w3-quarter w3-margin-bottom">
								<span class="w3-xlarge" style="letter-spacing: 0.3em;">지원내역</span>
								<br> <span class="w3-text-grey">확인하기</span>
							</div>
						</a> <a href="#contact">
							<div class="w3-quarter w3-margin-bottom">
								<span class="w3-xlarge" style="letter-spacing: 0.3em;">CONTACT</span>
								<br> <span class="w3-text-grey">담당자 및 연락처</span>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>

		<br> <Br>
		<div class="row">
			<div class="w3-content " style="max-width: 700px">
				<div class="w3-round-large w3-padding-16 w3-white">
					<h5 class="w3-center w3-padding-16">
						<span class="w3-tag w3-wide w3-xlarge">연구실 소개</span>
					</h5>
					<div class="w3-panel">
						<div class="w3-content">
							<div class="w3-container w3-padding">
								<p class="w3-default w3-text-grey" style="line-height: 200%;">
									${fn:replace(vo.slctnText, newLine,"<br>") }</p>
							</div>
						</div>
					</div>

					<h5 class="w3-center w3-padding-16">
						<span class="w3-tag w3-wide w3-xlarge">연구분야</span>
					</h5>

					<div class="w3-panel">
						<div class="w3-content">
							<div class="w3-container w3-padding">
								<span class=" w3-text-grey ">${fn:replace(vo.prmryResrchField, newLine,"<br>") }
								</span>
							</div>
						</div>
					</div>


					<h5 class="w3-center w3-padding-16">
						<span class="w3-tag w3-wide w3-xlarge">제출서류</span>
					</h5>
					<div class="w3-panel">
						<div class="w3-content">
							<div class="w3-container w3-padding w3-center">
								<p class="w3-large w3-text-grey">${vo.slsnMth }</p>
							</div>
						</div>
					</div>

					<h5 class="w3-center w3-padding-16">
						<span class="w3-tag w3-wide w3-xlarge" id="support">연구실
							지원내역</span>
					</h5>
					<div class="w3-panel">
						<div class="w3-content">
							<div class="w3-container w3-padding w3-center">
								<c:if test="${vo.tuitionSuprtYn == 'Y' }">
									<h4>
										<span class="w3-text-grey">등록금 지원</span>
									</h4>
									<hr>
								</c:if>
								<c:if test="${vo.lvncSuprtYn == 'Y' }">

									<h4>
										<span class="w3-text-grey">생활비 지원</span>
									</h4>

									<hr>

								</c:if>
								<c:if test="${vo.bk21EorgnzSuprtYn == 'Y' }">

									<h4>
										<span class="w3-text-grey">BK 지원</span>
									</h4>

									<hr>

								</c:if>
								<c:if test="${vo.incetSuprtYn == 'Y' }">

									<h4>
										<span class="w3-text-grey">인센티브 지원</span>
									</h4>

									<hr>

								</c:if>
								<c:if test="${vo.lrstyJoingfeeSuprtYn == 'Y' }">
									<h4>
										<span class="w3-text-grey">학회 참가비 지원</span>
									</h4>

									<hr>


								</c:if>
								<c:if test="${vo.dormSuprtYn == 'Y' }">
									<h4>
										<span class="w3-text-grey">기숙사 지원</span>
									</h4>

									<hr>


								</c:if>
								<c:if test="${vo.internYn == 'Y' }">
									<h4>
										<span class="w3-text-grey">인턴 지원</span>
									</h4>

									<hr>

								</c:if>
								<c:if test="${vo.lrstyJoingYn == 'Y' }">
									<h4>
										<span class="w3-text-grey">학회 참가 지원</span>
									</h4>

									<hr>

								</c:if>
								<c:if test="${vo.resrchTaskJoingYn == 'Y' }">
									<h4>
										<span class="w3-text-grey">연구 과제 참가 지원</span>
									</h4>

									<hr>

								</c:if>
								<c:if test="${vo.stdtrOpptySuprtYn == 'Y' }">
									<h4>
										<span class="w3-text-grey">연수 기회 지원</span>
									</h4>

									<hr>

								</c:if>
								<c:if test="${vo.eduPgmJoingSuprtYn == 'Y' }">
									<h4>
										<span class="w3-text-grey">교육프로그램 지원</span>
									</h4>

									<hr>

								</c:if>

							</div>
						</div>
					</div>

					<div class="w3-padding">
						<div class="w3-container">
							<h5 class="w3-center w3-padding-16">
								<span class="w3-tag w3-wide w3-xlarge" id="contact">Contact</span>
							</h5>
							<h5>
								<i
									class="glyphicon glyphicon-user w3-text-grey w3-large w3-margin-right w3-margin-bottom"></i> ${vo.chrgrNm }
							</h5>
							<h5>
								<i
									class="glyphicon glyphicon-earphone w3-text-grey w3-large w3-margin-right w3-margin-bottom"></i> ${vo.chrgrTelNo }
							</h5>
							<h5>
								<i
									class="glyphicon glyphicon-envelope w3-text-grey w3-large w3-margin-right w3-margin-bottom"></i> 
								${vo.chrgrEmail }
							</h5>
							<h5>
								<i
									class="glyphicon glyphicon-map-marker w3-text-grey w3-large w3-margin-right w3-margin-bottom"></i> ${vo.addr }
							</h5>
						</div>
						<br> <input id="address" type="hidden" value="${vo.addr }">
						<div id="map"></div>
						<script>
							function initMap() {
								var geocoder = new google.maps.Geocoder();
								var address = document
										.getElementById('address').value;
								setCenter(geocoder, address);
							}
							function setCenter(geocoder, address) {
								geocoder
										.geocode(
												{
													'address' : address
												},
												function(results, status) {
													if (status === google.maps.GeocoderStatus.OK) {
														var map = new google.maps.Map(
																document
																		.getElementById('map'),
																{
																	zoom : 14,
																	center : results[0].geometry.location
																});
														var marker = new google.maps.Marker(
																{
																	position : results[0].geometry.location,
																	map : map
																});
													} else {
														alert('Geocode was not successful for the following reason: '
																+ status);
														// return null;
													}
												});
							}
						</script>
						<script async defer
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEl_BNACj7LCF2Hzs2Ft-9-XBf5Z4AZLQ&callback=initMap">
							
						</script>

						<div class="w3-padding-16">
							<a href="#" onclick="window.open('${vo.slctnNotiUrl }')">
								<button class="w3-btn w3-indigo w3-round-large text-center"
									style="width: 100%">
									<h3>
										홈페이지 바로가기 <i class="glyphicon glyphicon-share-alt"></i>
									</h3>
								</button>
							</a>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/doscrap.js"></script>
</body>

</html>