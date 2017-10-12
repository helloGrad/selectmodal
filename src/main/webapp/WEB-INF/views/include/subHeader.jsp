<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<base target="_self" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id" content="31840955156-0oh8u23d3t24v4rguka78knp12vo9jm4.apps.googleusercontent.com">


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">		
<style>

.major-nav-box {
	height: 6em;
	border-bottom: 1px solid grey;
}

.navbar-left {
	font-weight: 400;
	padding-top: 15px;
	padding-bottom: 15px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 14px;
	letter-spacing: 5px;
}

.navbar-nav li a:hover {
	color: #1abc9c !important;
	background-color: white;
}


		
@media screen and (max-width: 400px) {
                
body {
    padding-top: 11em;
}  

             
}
@media screen and (min-width: 401px) and (max-width: 600px) {
               
   
body {
    padding-top: 11em;
}  

		
   
             
}
@media screen and (min-width: 801px) {
   
 body {
            padding-top: 7em;
 }	
 
                
}
    


</style>	
<script>
	
boardtype = "${boardtype}";
	
</script>
</head>


	<div class="row major-nav-box" style="height: auto;" >
		<div class="container">
			<div class=" text-center" style="background-color: white;">
				<div class="col-sm-2"></div>


				<div class="col-sm-8">
					<h2 class="subtitle" style="margin-bottom: -0.5em;"></h2>

				</div>
				<div class="col-sm-2"></div>
					<ul class="nav navbar-nav navbar-left">
						<li><a href="${pageContext.servletContext.contextPath }/study/main?boardtype=${boardtype}">전체</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/study/notice?boardtype=${boardtype}">모집공고</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/study/discussion?boardtype=${boardtype}">토론</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/study/research?boardtype=${boardtype}">연구과제</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/study/lab?boardtype=${boardtype}">연구실</a></li>
	
					</ul>
				
			</div>
		</div>


	</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/study.js"></script>


		
		

