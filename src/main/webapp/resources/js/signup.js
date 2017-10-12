/*
 * 정예린 170905 select 값 할당
 */

$(function() {

	for (var i = 1; i < 13; i++) {
		if(i<10){
			$("#birthm").append("<option value='0" + i + "'>" + i + "</option>");
		}
		else {
			$("#birthm").append("<option value='" + i + "'>" + i + "</option>");
		}
		
	}

	for (var i = 1; i < 32; i++) {
		if(i<10){
			$("#birthd").append("<option value='0" + i + "'>" + i + "</option>");
		}
		else {
			$("#birthd").append("<option value='" + i + "'>" + i + "</option>");
		}
	}

})

/*
 * 정예린 170905 성별 선택 시 색깔 바꿔주기
 */
function changeGenderColor(obj) {

	$(".genderlabel").removeClass("on-gender");
	$("#" + obj.value).addClass("on-gender");

}

// 2017-09-01 박가혜
$(function() {

	
	
	/*$(document).ready(function() {
		$("#myBtnlogin").click(function() {
			$("#login").css({
				"display" : "block"
			});
		});
		$(".close").click(function() {
			$("#login").css({
				"display" : "none"
			});
			initLoginModal();
			$("#signup").css({
				"display" : "none"
			});
			// initLoginModal();
		});
		$("html").click(function(event) {
			if (event.target.id === "login") {
				$("#login").css({
					"display" : "none"
				});
				// initLoginModal();
			}
		});

	});

	$(document).keydown(function(e) {

		var modal1 = document.getElementById('login');
		var modal2 = document.getElementById('signup');
		// var modal1 = document.getElementById('writeModal');
		if (e.keyCode == 27) {

			modal2.style.display = "none";
			modal1.style.display = "none";
			initLoginModal();
			initSignupModal();
		}
	});*/

	/*
	 * $('#naverLoginBtn2').click(function() {
	 * 
	 * $("#naverLoginBtn").click(); });
	 */
	
	
	// 허주한
	// 학문 선택 클릭이벤트
	
	$(document).on('click', '.study', function (event) { 
		
		if($(this).hasClass('black')){
			
			if(studyCnt>=1){
				return;
			}
			console.log("일")
			$(this).removeClass('black');
			$(this).css("background","rgba(0,0,0.3)");
			studyArr.push($(this).text());
			studyCnt++
			
		} else{
			console.log("일")
			$(this).addClass('black');
			$(this).css("background","rgba(0,0,0.3)");
			var index = studyArr.indexOf($(this).text());
			
			if(index>=0){
				studyArr.splice(index,1);
			}
			
			studyCnt--
			
		}
		
		if(studyCnt==0){
			$('#studySubmit').addClass('disabled');
		} else{
			$('#studySubmit').removeClass('disabled');
		}
		
		console.log(studyCnt, studyArr);
		
		
	});

})


/*
 * 정예린 170905 (년입력할때)
 */
function maxLengthCheck(object) {
	if (object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength);
	}
}


/* 비밀번호 타입 변경 */

function pwChangeType(){

     $("#rpwd").attr("type", "password"); 
}

function pwInitType(){

     $("#rpwd").attr("type", "text"); 
}



/* 정예린2017-09-06 회원가입 폼 유효성 검사 */

var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

var regYN = false;

var nickCheck = function() {
	var inputnknm = $("#nickname").val();
	
	if (inputnknm === "") {
		$("#nknmcheck").text("닉네임은 필수 입력 항목입니다.");
		$("#nknmcheck").addClass("oninput");
	} else if (inputnknm.length < 2 || inputnknm.length > 8) {
		$("#nknmcheck").text("닉네임은 2~8자리 이상입니다.");
		$("#nknmcheck").addClass("oninput");
	} else {
		$.ajax({
			url : "/net/api/checknknm",
			type : "post",
			data : "nknm=" + inputnknm,
			success : function(response) {

				
				if (response.data === true) {
					$("#nknmcheck").text("닉네임이 이미 존재 합니다.");
					$("#nknmcheck").addClass("oninput");
				}
		
				else {
					$("#nknmcheck").removeClass("oninput");
					$("#nknmcheck").empty();
				}

			},
			error : function(jqXHR, status, e) {
			}

		});
	}
}


var emailCheck = function() {
	var inputEmail = $("#remail").val();

	if (inputEmail === "") {
		
		$("#idencheck").text("이메일은 필수 입력 항목입니다.");
		$("#idencheck").addClass("oninput");
	} else if (!regEmail.test(inputEmail)) {

		$("#idencheck").text("@를 포함한 올바른 이메일 형식으로 입력바랍니다.");
		$("#idencheck").addClass("oninput");
	} else {

		$.ajax({
			url : "/net/api/checkemail",
			type : "post",
			data : "email=" + inputEmail,
			success : function(response) {
			
			
				if (response.data === true) {
					$("#idencheck").text("이메일이 이미 존재 합니다.");
					$("#idencheck").addClass("oninput");
				}
				
				else {
					$("#idencheck").removeClass("oninput");
					$("#idencheck").empty();
				}

			},
			error : function(jqXHR, status, e) {
			}

		});
	}
}

var pwdCheck = function() {
	var inputPwd = $("#rpwd").val();
	var num = inputPwd.search(/[0-9]/g);
	var eng = inputPwd.search(/[a-z]/ig);
	var spe = inputPwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	if (inputPwd === "") {
		$("#pwcheck").text("비밀번호는 필수 입력 항목입니다.");
		$("#pwcheck").addClass("oninput");
	} else if (inputPwd.length < 6 || inputPwd.length > 20) {
		$("#pwcheck").text("비밀번호는 6~14자리 입니다.");
		$("#pwcheck").addClass("oninput");
	} else if (inputPwd.search(/₩s/) != -1) {
		$("#pwcheck").text("비밀번호는 공백업이 입력해주세요.");
		$("#pwcheck").addClass("oninput");
	} else if (num < 0 || eng < 0 || spe < 0) {
		$("#pwcheck").text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		$("#pwcheck").addClass("oninput");
	} else {
		$("#pwcheck").removeClass("oninput");
		$("#pwcheck").empty();
	}
}

/*
 * var pwdCheck2 = function() { var inputPwd = $("#rpwd").val(); var inputPwd2 =
 * $("#rpwd_again").val();
 * 
 * if ($("#pwdcheck").hasClass("oninput")) { $("#pwdcheck2").text("비밀번호를 올바르게
 * 입력하세요."); $("#pwdcheck2").addClass("oninput"); } else if (inputPwd === "") {
 * $("#pwdcheck2").text("비밀번호를 올바르게 입력하세요.");
 * $("#pwdcheck2").addClass("oninput"); } else if (inputPwd != inputPwd2) {
 * $("#pwdcheck2").text("비밀번호가 일치하지 않습니다.");
 * $("#pwdcheck2").addClass("oninput"); } else {
 * $("#pwdcheck2").removeClass("oninput"); } }
 */


$("#nickname").focusout(nickCheck);
$("#remail").focusout(emailCheck);
$("#rpwd").focusout(pwdCheck);
// $("#rpwd_again").focusout(pwdCheck2);

var iden='-1';
var facebookToken = '-1';
var naverToken = '-1';
var studyCnt = 0; // 학문 선택 갯수 카운트;
var studyArr = new Array();


$(function(){
	naverToken = decodeURIComponent(window.location.search.substring(1));
	
	naverToken = naverToken.split('&');
	
	naverToken = naverToken[0].split('=');
	
	
	if((naverToken[0]==='nknm'&&naverToken[1]!="") ||naverToken[0]==='id'&&naverToken[1]!=""){
		console.log(naverToken[0]+"-"+naverToken[1]+"-"+naverToken[2])
		console.log("232")
		$('#selectModal').css('display','block');
	}
})


$('#studySubmit').click(function(){

// $("#join-form").submit();
	
	var type;
	var id;
	
	
	
	if(naverToken[0]==='id'){
		type = 'naver'
		id = naverToken[1]
	}
	
	else if(naverToken[0]!='nknm'){
		type = 'facebook'; 
		id = facebookToken;
	}
	else if(naverToken[0]==='nknm'){
		type = 'common';
		id = naverToken[1];
	}
	
	console.log("id>",id);
	event.preventDefault();
	$.ajax({
		url : "/net/api/registerStudy",
		type : "post",
		data : "iden="+id
		+"&studys="+ studyArr+"&type="+type,

		success : function(response) {
			parent.window.location.href = "/net/submain";

		},
		error : function(jqXHR, status, e) {
			console.log(jqXHR);
			console.error(status);
			console.error(e);
		}

	});
	
	

})





function register(){

			
			var check=false;

			nickCheck();
			emailCheck();
			pwdCheck();
			
// pwdCheck2();

			if ($("#nicknamecheck").hasClass("oninput") == true
					|| $("#emailcheck").hasClass("oninput") == true
					|| $("#pwdcheck").hasClass("oninput") == true
					|| $("#pwdcheck2").hasClass("oninput") == true) {
				return false;
			} else {
			

				$.ajax({
					url : "/net/api/register",
					type : "post",
					data : "iden="+$("#remail").val()
					+"&nknm="+$("#nickname").val()
					+"&pw="+ $("#rpwd").val()
					+"&sex="+ $('.gender').find('.on-gender').find('input').val()
					+"&birdt="+ $("#birthy").val()+$("#birthm").val()+$("#birthd").val(),
					
					success : function(response) {
						$("#nknmcheck").empty();
						$("#idencheck").empty();
						$("#pwcheck").empty();
						if(response.data.length > 0){					

							for(var i=0; i<response.data.length ;i++){
								
								console.log($("#"+response.data[i].field+"check").text() );
								if(response.data[i].codes[3] === 'NotEmpty'){
									$("#"+response.data[i].field+"check").text(response.data[i].defaultMessage);
								} 
								else if($("#"+response.data[i].field+"check").text() == '') {
									$("#"+response.data[i].field+"check").text(response.data[i].defaultMessage);
								}
							}
						}
						else if (response.data === true) {

							$.ajax({
								url : "/net/api/setsession",
								type : "post",
								data : "iden="+$("#remail").val()
								+"&pw="+ $("#rpwd").val(),

								success : function(response) {

									iden = $("#remail").val();
									event.preventDefault();
									
									console.log("setsession");
									$('#registerForm').css('display','none');

								},
								error : function(jqXHR, status, e) {
									console.log(jqXHR);
									console.error(status);
									console.error(e);
								}

							});
							event.preventDefault();
						} else if (response.data === false) {
							$("#loginMsg").text(loginFailMsg);
							event.preventDefault();
						}

					},

					error : function(jqXHR, status, e) {
						console.log(jqXHR);
						console.error(status);
						console.error(e);
					}

				});
				
			}				
			return false;				
}