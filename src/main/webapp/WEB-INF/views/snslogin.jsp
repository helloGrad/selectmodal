<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>

	<script type="text/javascript">
	
	
		var naver_id_login = new naver_id_login("4XJQVjfPiPo3e5Xe23hL",
				"http://127.0.0.1:8080/net/user/snslogin/");
		// 접근 토큰 값 출력
		naver_id_login.setDomain(".127.0.0.1:8080/net/"); //상태 토큰 비교를 위한 domain 설정

		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function

		function naverSignInCallback() {

			event.preventDefault();

			var vo = {};

			vo.token = naver_id_login.oauthParams.access_token;
			vo.birthday = naver_id_login.getProfileData('birthday');
			vo.email = naver_id_login.getProfileData('email');
			vo.nickname = naver_id_login.getProfileData('nickname');
			vo.age = naver_id_login.getProfileData('age');
			vo.name = naver_id_login.getProfileData('name');
			vo.gender = naver_id_login.getProfileData('gender');
			

			$.ajax({
				url : "/net/api/snslogin",
				data : "name="+vo.name
				 +"&email="+vo.email
				 +"&gender="+vo.gender
				 +"&birthday="+vo.birthday
				 +"&token="+vo.token
				 +"&nickname="+vo.nickname
				 +"&age="+vo.age
				 +"&sns=naver",

				success : function(response) {

					if(response.data.exist===true){
						
						parent.window.location.href = "/net/submain/";
					}
					else{
						
						parent.window.location.href = "/net?id="+vo.email;
						
					}
					if (response.result === "fail") {

						console.error(response.message);
						return;
					}


				},
				error : function(jqXHR, status, e) {

					console.log(status + " : " + e);
				}
			});


		}

</script>

</body>
</html>