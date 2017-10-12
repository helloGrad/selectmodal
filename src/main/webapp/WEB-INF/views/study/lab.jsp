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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">	
<link href="${pageContext.request.contextPath}/resources/css/study.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">

<style>
.headcolor {
	float: left;
	background-color: #eee;
	position: absolute;
	top: 0;
	right: 0;
	width: 100px;
	height: 380px;
}
.navigator_category {
	height: 44px;
	border: 1px solid #999;
	border-width: 1px 0;
	margin: 11px 0 11px 0;
	padding: 0 20px 0 0;
	font-family: "나눔고딕", "NanumGothic", "NanumGothicWebFont",
		"Malgun Gothic", "맑은 고딕", "Dotum", "돋움", "Helvetica",
		"Apple SD Gothic Neo", "sans-serif";
	font-size: 14px;
	line-height: 42px;
	color: #555;
}
.category_name {
	margin: 0 11px;
	font-family: "나눔고딕", "NanumGothic", "NanumGothicWebFont",
		"Malgun Gothic", "맑은 고딕", "Dotum", "돋움", "Helvetica",
		"Apple SD Gothic Neo", "sans-serif";
	font-size: 14px;
	line-height: 42px;
	color: #555;
}
ul {
	list-style: none;
}
.title-text {
	padding: 0;
	text-align: center;
}
.link-gray {
	color: DarkGray;
}
.link-title {
	margin: 30px 0 0 0;
	color: DimGrey;
	font-size: 18px;
}
h4, h6 {
	display: inline;
}
.list-color {
	background-color: #FBFBFB;
}
.area-title {
	float1: right;
	padding: 5px 10px;
}
.small-btn {
	font-size: 14px;
	border: 1px solid transparent;
	border-radius: 4px;
	padding: 6px 6px;
}
.tel-color {
	color: green;
}
.list-hr {
	border: 2px;
	border-top: solid 1px #CCC;
}

@media screen and (max-width: 400px) {
	.nopadding {
		padding: 0 !important;
		margin: 0 !important;
	}
	.small-btn {
		font-size: 10px;
		border: 1px solid transparent;
		border-radius: 4px;
		padding: 3px 3px;
	}
	.link-title {
		color: DimGrey;
		font-size: 15px;
	}
	.area-title {
		float1: right;
		padding: 5px 5px;
		font-size: 8px;
	}
@media screen and (min-width: 401px) and (max-width: 600px) {
		.nopadding {
			padding: 0 !important;
			margin: 0 !important;
		}
		.small-btn {
			font-size: 10px;
			border: 1px solid transparent;
			border-radius: 4px;
			padding: 3px 3px;
		}
		.link-title {
			color: DimGrey;
			font-size: 15px;
		}
		.area-title {
			float1: right;
			padding: 5px 5px;
			font-size: 8px;
		}
	}
@media screen and (min-width: 801px) {
		.nopadding {
			
		}
		.small-btn {
			font-size: 14px;
			border: 1px solid transparent;
			border-radius: 4px;
			padding: 6px 6px;
		}
		.link-title {
			color: DimGrey;
			font-size: 18px;
		}
	}
}
</style>
</head>
<body>
	
	
<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/subHeader.jsp" />


 <div class="row">
 	<div class="container">

			<div class="row">

				<div class="col-sm-12">
					<h3 class="title-text">연구실 리스트</h3>
					<p></p>

					<div class="w3-center w3-margin-bottom">
						<button class="btn btn-default margin-center" id="js-searchToggle">enter
							zip or city, state</button>
						<button class="btn btn-default margin-center" id="js">filter
							by services</button>
					</div>
				</div>

			</div>

			<c:set value="1" var="i" />
			<c:forEach items="${labList }" var="labVo" varStatus="status">
				<div class="col-sm-4 nopadding" style="margin-bottom: 3%;">
					<div class="w3-card-2 w3-padding list-color w3-hover-shadow" 
						style="height: 270px">
						<div class="w3-margin-top">
							<h4 class="link-title">
								${labVo.orgnzNm }
								<c:choose>
									<c:when test="${empty labVo.university }">
										<small class="link-gray">${labVo.graduate }</small>		
									</c:when>
									<c:otherwise>
										<small class="link-gray">${labVo.university }</small>
									</c:otherwise>
								</c:choose>
								
								<button
									class="w3-button w3-white w3-border w3-border-green w3-round-large area-title w3-tiny">${labVo.ar }</button>
							</h4>
						</div>

						<hr class="list-hr">
						<p>${labVo.addr }${labVo.detailAddr }</p>
						<c:choose>
							<c:when test="${empty labVo.hmpageUrl }">
							</c:when>
							<c:otherwise>
								<button
									class="w3-button w3-white w3-border w3-border-blue w3-round-large area-title w3-small"
									onclick="window.open('${labVo.hmpageUrl }')">홈페이지 바로가기</button>
							</c:otherwise>
						</c:choose>
						
						<div>
							<c:forEach items="${labCodeList }" var="codeVo"
								varStatus="status">
								<c:if test="${codeVo.orgnzNo==labVo.orgnzNo }">
									<button class="small-btn btn-default margin-center"
										id="js-searchToggle">${codeVo.cdNm }</button>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<c:set var="i" value="${i + 1}" />
			</c:forEach>


		</div>
	</div>
	
</body>
</html>