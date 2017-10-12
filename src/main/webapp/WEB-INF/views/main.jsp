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
<title>하이그래드넷</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">




<script type="text/javascript">
	$(window).scroll(function() {
		$("#myNavbar").css("opacity", 1 - $(window).scrollTop() / 250);
		$(".navbar-brand").css("opacity", 1 - $(window).scrollTop() / 250);
	});
</script>
</head>
<body>
	
	
	<nav class="navbar navbar-default navbar-fixed-top al">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.servletContext.contextPath }/">하이그래드넷</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" onclick="modalOpen2();">회원가입</a>
					<li>
					<li><a id="myBtnlogin" href="javascript:void(0);" onclick="modalOpen();">로그인</a>
					<li>
				</ul>
			</div>
		</div>

		<c:import url="/WEB-INF/views/modal/login.jsp" />
	</nav>

	<div class="jumbotron overlay grey">
		<div class="container">
			<h1 class="main-comment">The Simple Tool That Will Help You Pick
				the Right Grad School</h1>
			<a class="btn col-xs-12 col-sm-3 col-lg-3 sns-login"
				style="background-color: #ffffff; color: #000000;"
				href="javascript:void(0);" onclick="modalOpen2();">
				<h4 class="sns-banner">이메일로 가입하기</h4>
			</a>


			<button id="main-naverlogin"
				class="btn col-xs-12 col-sm-3 col-lg-3 sns-login btn-social "
				style="background-color: #1EC800; color: #FFFFFF;">
				<span id='naverLogo' class="fa" style="width: 51.2px"></span>
				<h4 class="sns-banner">네이버로 계속하기</h4>

			</button>


			<button id="main-facebooklogin"
				class="btn col-xs-12 col-sm-3 col-lg-3 sns-login btn-social "
				style="background-color: #4267b2; color: #FFFFFF;">
				<span id="facebooklogo" class="fa fa-facebook"
					style="width: 51.2px; line-height: 200%;"></span>
				<h4 class="sns-banner">페이스북으로 계속하기</h4>
			</button>

		</div>
	</div>

	<div class="container majors-container">
		<div class="row">
			<h2 class="sub-comment">Find your grad schools or interests</h2>
			<div class="divider"></div>
			<!--// main major 1-->
			<a href="${pageContext.servletContext.contextPath }/submain#Humanities">
				<div
					class="majors thumbnail col-xs-5 col-lg-4 humanties overlay-major black">
					<h3 class="major-title">인문학</h3>
				</div>
			</a> <a href="${pageContext.servletContext.contextPath }/submain#SocialScience">
				<div
					class="majors thumbnail col-xs-5 col-lg-4 socialscience overlay-major black">
					<h3 class="major-title">사회과학</h3>
				</div>
			</a> <a href="${pageContext.servletContext.contextPath }/submain#NaturalScience">
				<div
					class="majors thumbnail col-xs-5 col-lg-4 naturalscience overlay-major black">
					<h3 class="major-title">자연과학</h3>
				</div>
			</a>

			<!--// main major 2-->
			<a href="${pageContext.servletContext.contextPath }/submain#Engineering">
				<div
					class="majors thumbnail col-xs-5 col-lg-4 engineering overlay-major black">
					<h3 class="major-title">공학</h3>
				</div>
			</a> <a href="${pageContext.servletContext.contextPath }/submain#MedicineandPharmacy">
				<div
					class="majors thumbnail col-xs-5 col-lg-4 medicine overlay-major black">
					<h3 class="major-title">의약학</h3>
				</div>
			</a> <a href="${pageContext.servletContext.contextPath }/submain#MarineAgricultureFishery">
				<div
					class="majors thumbnail col-xs-5 col-lg-4 ocean overlay-major black">
					<h3 class="major-title">농수해양학</h3>
				</div>
			</a>

			<!--// main major 3-->
			<a href="${pageContext.servletContext.contextPath }/submain#ArtsandKinesiology">
				<div
					class="majors thumbnail col-xs-5 col-lg-4 art overlay-major black">
					<h3 class="major-title">예술체육학</h3>
				</div>
			</a> <a href="${pageContext.servletContext.contextPath }/submain#ScienceandTechnologyStudies">
				<div
					class="majors thumbnail col-xs-5 col-lg-4 interdisciplinary overlay-major black">
					<h3 class="major-title">복합학</h3>
				</div>
			</a>
		</div>
	</div>

	<div class="row">
		<div class="alert-info">
			<div class="container">
				<h2 class="sub-comment">Few steps to find your grad schools</h2>
				<div class="col-sm-4">
					<h3>Choose</h3>
					<p>Lorem ipsum dolor..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
				</div>
				<div class="col-sm-4">
					<h3>Gathering</h3>
					<p>Lorem ipsum dolor..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
				</div>
				<div class="col-sm-4">
					<h3>Contact</h3>
					<p>Lorem ipsum dolor..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
					<p>Ut enim ad..</p>
				</div>
			</div>
			<br> <br>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/login.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/signup.js"></script>

</body>
</html>