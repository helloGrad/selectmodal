<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<base target="_self" /> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ejs/ejs.js"></script>

<script>
var boardtype; 
</script>


<link href="${pageContext.request.contextPath}/resources/css/bootstrap-social.css" rel="stylesheet"> 	
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
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

.hide{

display:none;

}

.search{

position: relative;
display: block;
margin: 15px 5px 15px 5px;
width: -webkit-fill-available;
height: auto;

}

.search:focus {
  outline: none;
}


 @media screen and (max-width: 400px) {
                
body {
    padding-top: 10em;
}  
.sidebar {
    background-color: #6bc59a;
   
}   


.modal-dialog.modal-fullsize {
	width: 100%;
	height1: 100%;
	margin: 0;
	padding: 0;
	padding-right: 0;
}
.modal-content.modal-fullsize {
	height: auto%;
	min-height: 100%;
	border-radius: 0; 
	padding-right: 0;
}
.modal{
    padding-top: 0px;
}

.objectbutton1, .objectbutton2 {
				    
	width: 30%;
}
             
}
@media screen and (min-width: 401px) and (max-width: 600px) {
               
   
body {
    padding-top: 10em;
}  
.sidebar {
    background-color: #6bc59a;
   
}   


.modal-dialog.modal-fullsize {
	width: 100%;
	height1: 100%;
	margin: 0;
	padding: 0;
	padding-right: 0;
}
.modal-content.modal-fullsize {
	height: auto%;
	min-height: 100%;
	border-radius: 0; 
	padding-right: 0;
}
.modal{
	padding-top: 0px;
}
.objectbutton1, .objectbutton2 {
	width: 30%;
}
    
}
@media screen and (min-width: 801px) {
   
.sidebar{
	background-color: #6bc59a;
	height: 566px;
}   
                
}
</style>



<script>

	$(function() {

		$(".searchBtn").click(function(event) {

			if ($(".search").hasClass("hide") === true) {

				$(".search").removeClass("hide");
			} else {
				$(".search").addClass("hide");

			}

		});

	})
</script>

</head>

<nav class="navbar navbar-default navbar-fixed-top al">
    <div class="container">
    
    <div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			  <a class="navbar-brand" href="${pageContext.servletContext.contextPath }/submain">하이그래드넷</a>
			  
				<ul class="nav navbar-nav">
					<li><a id="headerBtn" class=" navbar-qna nav-btn w3-mobile writeBtn" href="#"> <span
							class=" w3-btn w3-border w3-round-large w3-mobile" style="margin:0 0 0 1em;"><i
								class="glyphicon glyphicon-pencil"></i>글쓰기</span></a></li>
					<li><a class=" navbar-qna w3-mobile" href="${pageContext.servletContext.contextPath }/counseling/list"> <span
							class="w3-btn w3-border w3-round-large w3-mobile" style="margin:0 0 0 1em;"><i
								class="glyphicon glyphicon-check"></i>답변하기</span></a></li>
				</ul>
				
				
			</div>
		

            <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
            
                <li>
                	<form name="searchform" action="${pageContext.servletContext.contextPath }/search" onKeydown="javascript:if(event.keyCode == 13) form.submit();">
					  <input type="text" class="w3-border w3-round-large search hide" name="text" placeholder="Search..">
					</form>
                </li>

                <li>
    		
				<a href="#" class="searchBtn"> <i class="glyphicon glyphicon glyphicon-search" style="font-size: 1.5em;"></i></a>

                <li><a data-toggle="dropdown"> <i class="glyphicon glyphicon-user" style="font-size: 1.5em;"></i></a>
                    <ul class="dropdown-menu">
                         	<c:choose>
					<c:when test="${empty authUser }">
						
						<li>
						<li><a href="#" onclick="modalOpen2();">회원가입</a></li>
						  <hr class="setting-hr">
		  			    <li><a id="myBtnlogin" href="javascript:void(0);" onclick="modalOpen();">로그인</a></li>
			
						<li>
					</c:when>
					<c:otherwise>
						<li><a>${authUser.nknm }님</a></li>
						<li><a href="${pageContext.servletContext.contextPath }/user/setting">계정 설정</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/user/mypage">마이페이지</a>
						</li>
						  <hr class="setting-hr">
						<li><a
							href="${pageContext.servletContext.contextPath }/user/logout" id="logout">로그아웃</a>
						</li>

					</c:otherwise>
				</c:choose>
              </ul>
            </li>
         </ul>
     </div>

		<div id="login" class="login-modal" >
		   <div class="login-modal-content">
		   
		  
		   		 <span class="close">×</span>
		
		   		 
		      <div class="signupbnt">
		      	
		       
		          <a id="loginBtn" class="btn btn-social btn-facebook socialbtn">
   				 <span class="fa fa-facebook"></span> 페이스북 아이디로 로그인
 				 </a>	
 				 	
		        
		         <div id="naver_id_login">
		        
 				 </div>
 			
 			
 				<div class="login-devider"><span>또는</span></div>
 				
		    
		         
		         	<div class="form-group1">
					<input type="text"
							class="form-control logininputbox" id="email" name="iden"
							placeholder="Enter email">
					</div>
					
					<div id='emailMsg' class="text-danger"></div>
					
					<div class="form-group1">
					 <input type="password"
							class="form-control logininputbox" id="pwd" name="pw"
							placeholder="Enter password">
					</div>
					

					<div id="passwdMsg" class="text-danger"></div>
					
					 <div id="loginMsg" class="text-danger"></div>
					 
					<div class="form-group">
						<label class="remember-me"><input type="checkbox"> 로그인 상태 유지 </label>
						
						<p class="sighup">
						<a href="javascript:void(0);" onclick="modalOpen3();">비밀번호 찾기</a>  /  <a href="javascript:void(0);" onclick="modalOpen2();">회원가입</a>
						</p>
					    
					</div>

		         <button type="submit" class="btn formbtn" onclick="login();" >로그인</button>
		      	<div class="login">
				
			    </div>	
		      	 
			
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
	

<c:import url="/WEB-INF/views/modal/write.jsp" />
	 
	
				
    </div>
</nav>



<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modalLogin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>




<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/counseling.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/write.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/signup.js"></script>

		
		

