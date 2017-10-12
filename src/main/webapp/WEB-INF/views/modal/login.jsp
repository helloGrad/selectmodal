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
<script type="text/javascript" src="js/bootstrap.js"></script>

<link href="css/higrad-signup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-social.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

<style type="text/css">
.study{
	display: inline-block;
	margin-bottom: 5px;
	margin-right: 2px;
	width: 49%;
	height: 75px;
	text-align: center;
	line-height: 75px;
	color: white;

}
.over{
display: inline-block;
}

.black:after {
	background-color: black;
	z-index: -1;
}

.over:after {
	z-index: -2;
	position: absolute;
	content: "";
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0.8;
}
</style>

</head>
<body>

	<div id="login" class="login-modal">
		<div class="login-modal-content">
			<span class="close">×</span>
			<div class="signupbnt">
				<button id="loginBtn" class="btn btn-social btn-facebook socialbtn">
					<span class="fa fa-facebook"></span> 페이스북 아이디로 로그인
				</button>
				<div id="naver_id_login"></div>
				<div class="login-devider">
					<span>또는</span>
				</div>

				<div class="form-group1">
					<input type="text" class="form-control logininputbox" id="email"
						name="iden" placeholder="Enter email">
				</div>
				<div id='emailMsg' class="text-danger"></div>
				<div class="form-group1">
					<input type="password" class="form-control logininputbox" id="pwd"
						name="pw" placeholder="Enter password">
				</div>
				<div id="passwdMsg" class="text-danger"></div>
				<div id="loginMsg" class="text-danger"></div>
				<div class="form-group">
					<label class="remember-me"><input type="checkbox">
						로그인 상태 유지 </label>
					<p class="sighup">
						<a href="javascript:void(0);" onclick="modalOpen3();">비밀번호 찾기</a>
						/ <a href="javascript:void(0);" onclick="modalOpen2();">회원가입</a>
					</p>
				</div>
				<button type="submit" class="btn formbtn" onclick="login();">로그인</button>
				<div class="login"></div>
			</div>
			<span class="close"></span>
		</div>
	</div>

	
	<div id="signup" class="login-modal">
		<div class="login-modal-content">
			<span class="close">×</span>

			<div class="signupbnt">

				<button id="facebookLogin"
					class="btn btn-social btn-facebook socialbtn">
					<span id="facebooklogo" class="fa fa-facebook"></span> 페이스북으로 계속하기
				</button>

				<button id="naverLoginBtn2"
					class="btn btn-social socialbtn naverlogin" style='color: white;'>
					<span id='naverLogo' class="fa "></span> 네이버로 계속하기
				</button>

			</div>
			<div class="login-devider">
				<span>또는</span>
			</div>

			<form action="#" id="join-form">
				<div class="input">

					<div class="signupinput">
						<input type="text" class="inputbox" id="nickname"
							placeholder="닉네임(2~8자리)" name="nknm">
						<div class="checkinput" id="nicknamecheck">경고</div>
					</div>

					<div class="signupinput">
						<input type="text" class="inputbox" id="remail" placeholder="이메일"
							name="iden">
						<div class="checkinput" id="emailcheck">경고</div>
					</div>

					<div class="signupinput">
						<input type="password" class="inputbox" placeholder="비밀번호(6~20자)"
							id="rpwd" name="pw">
						<div class="checkinput" id="pwdcheck">경고</div>
					</div>
					<div class="signupinput" id="lastinput">
						<input type="password" class="inputbox" placeholder="비밀번호 확인"
							id="rpwd_again">
						<div class="checkinput" id="pwdcheck2">경고</div>
					</div>
					<hr class="loginhr">
					<div class="gender">
						<label class="genderlabel on-gender" id="M"> <input type="radio"
							name="sex" value="M" id="radiomale" checked
							onclick="changeGenderColor(this);"> 남자
						</label> <label class="genderlabel" id="F"> <input type="radio"
							name="sex" value="F" id="radiofemale"
							onclick="changeGenderColor(this);">여자
						</label>
					</div>
					<div class="birth">
						<input type="number" name="birdt" maxlength="4" id="birthy"
							max="9999" min="1900" maxlength="4"
							oninput="maxLengthCheck(this)">
					</div>
					<div class="birth">
						<select id="birthm" name="birdt">
							<option selected disabled id="selectm">월</option>
						</select>
					</div>
					<div class="birth">
						<select id="birthd" name="birdt">
							<option selected disabled id="selectd">일</option>
						</select>
					</div>
					<button type="submit" class="btn formbtn">회원가입</button>
				</div>
			</form>
			<div class="login">
				이미 가입한 회원이라면 <a onclick="modalOpen();" href="javascript:void(0);">로그인
					하러 가기</a>
			</div>
		</div>
	</div>
	
	
	
	<div id="selectModal" class="login-modal">
	
		<div class="login-modal-content">
		
			<div class="modal-header">
        		<h4 class="modal-title">관심 학문을 하나만 선택해주세요</h4>
        		
      		</div>
      		<form action="#" id="join-form">
      			<div class="modal-body">
        			<div class='study col-xs-5 interdisciplinary over black'>인문학</div>
        			<div class='study col-xs-5 socialscience over black'>사회과학</div>
        			<div class='study col-xs-5 naturalscience over black'>자연과학</div>
        			<div class='study col-xs-5 engineering over black'>공학</div>
        			<div class='study col-xs-5 medicine over black'>의약학</div>
        			<div class='study col-xs-5 ocean over black'>농수해양학</div>
        			<div class='study col-xs-5 art over black'>예술체육학</div>
        			<div class='study col-xs-5 interdisciplinary over black'>복합학</div>
      			</div>
      		
      			<button id='studySubmit' type="submit" style="margin-bottom: 10px" class="btn formbtn disabled">선택완료</button>
      			<br>
      		</form>
      		
		</div>
						
    </div>

</body>
</html>