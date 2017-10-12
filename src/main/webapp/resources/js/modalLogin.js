
var emptyPasswdMsg = "비밀번호를 입력해주세요";
var emptyEmailMsg = "이메일을 입력해주세요";
var regEmailMsg = "이메일 형식이 아닙니다";
var loginFailMsg = "로그인 정보가 틀립니다";
var emailRegExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;


$(function(){
	
	
	if (matchMedia("screen and (min-width: 600px)").matches) {

		$("#writerleft").insertAfter("#writeright");
	} else {

		$("#writeright").insertAfter("#writeleft");

	}

	$(document).ready(function() {

		$("#myBtnlogin").click(function() {

			$("#login").css({
				"display" : "block"
			});

		});

		$(".close").click(function() {
			
			
			$("#login").css({
				"display" : "none"
			});
			
			$("#signup").css({
				"display" : "none"
			});
			
			$("#signup2").css({
				"display" : "none"
			});
		});

		$("html").click(function(event) {
			if (event.target.id === "login") {
				$("#login").css({
					"display" : "none"
				});
			}
		});

	});

	$(document).keydown(function(e) {

		var modal1 = document.getElementById('login');
		var modal2 = document.getElementById('signup2');
		var modal3 = document.getElementById('writeModal');
		
		
		if (e.keyCode == 27) {

			modal2.style.display = "none";
			modal1.style.display = "none";
			modal3.style.display = "none";
		}
	});

	$('#naverLoginBtn2').click(function() {

		$("#naverLoginBtn").click();
	});
	
		
	$("#email").on('keypress',function(){
		$("#emailMsg").empty();
	})
	$("#pwd").on('keypress',function(){
		$("#passwdMsg").empty();
	})
	
	$(document).on('mouseover', '.naverlogin', function (event) { 
		
		$(this).find("#naverLogo").css("background-image",'url("/net/resources/images/logo-hover.png")');
		$(this).find("#naverLogo").css("background-size",'cover');
		$(this).find(".btn-social").css('background-color','#1BAA25');
	});
	
	$(document).on('mouseout', '.naverlogin', function (event) { 
		
		$(this).find("#naverLogo").css("background-image",'url("/net/resources/images/logo.png")');
		$(this).find("#naverLogo").css("background-size",'cover');
		$(this).find(".btn-social").css('background-color','#1EC800');
	});
	
})


var modalOpen = function() {

		var modal1 = document.getElementById('signup2');
		var modal2 = document.getElementById('login');

		modal2.style.display = "block";
		modal1.style.display = "none";

		window.onclick = function(event) {
			if (event.target == modal2) {
				modal2.style.display = "none";
			}
		}
	}

	var modalOpen2 = function() {

		var modal1 = document.getElementById('login');
		var modal2 = document.getElementById('signup2');

		modal2.style.display = "block";
		modal1.style.display = "none";

		window.onclick = function(event) {
			if (event.target == modal2) {
				modal2.style.display = "none";
			}
		}
	}





