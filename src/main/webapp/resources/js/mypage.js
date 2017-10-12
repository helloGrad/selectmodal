/**
 * 허주한
 */

var infoListVar = ['studyList', 'researchList', 'purposeList', 'arList'];
var cdNames = new Array();
var studyNames = new Array();
var researchNames = new Array();
var purposeNames = new Array();
var arNames = new Array();
var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
var mbno = $('#mbNo').val();

//맞춤정보 박스 클릭하면 배열에 추가
var addNames = function(type, name){
	if(type==='study'){
		studyNames.push(name);
	}else if(type==='research'){
		researchNames.push(name);
	}else if(type==='purpose'){
		purposeNames.push(name);
	}else if(type==='ar'){
		arNames.push(name);
	}
};

var momo = function(){
	
	swal({
		  title: "정말 탈퇴 하시겠습니까?",
		  text: "탈퇴 후 14일 이내에 탈퇴 신청을 취소 하실수 있습니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    swal("탈퇴 신청 되었습니다.", {
		      icon: "success", 
		    });
		  } 
		});
}

//맞춤정보 박스 클릭하면 배열에 제거
var removeNames = function(type, name){
	if(type==='study'){
		studyNames.splice(studyNames.indexOf(name),1);
	}else if(type==='research'){
		researchNames.splice(researchNames.indexOf(name),1);
	}else if(type==='purpose'){
		purposeNames.splice(purposeNames.indexOf(name),1);
	}else if(type==='ar'){
		arNames.splice(arNames.indexOf(name),1);
	}
};

//연구분야 중복 체크
var checkDuplicate = function(name){

	for(var i=0;i<$('#researchList div').length;i++){
		if(researchNames[i]===name){
			return true;
		}
	}
	return false;

}

var nknmCheck = function(nknm){
	var end = false
	if(nknm===''){
		$('#nkname-warn').css('display','block');
		$('#nkname-warn').text('닉네임은 필수 항목입니다.')
		return false;
	}else if(nknm.length < 2 || nknm.length > 8){
		$('#nkname-warn').css('display','block');
		$('#nkname-warn').text('닉네임은 2~8자리 이어야 합니다')
		return false;
	}else {
		$.ajax({
			url : "/net/api/checknknm",
			type : "post",
			data : "nknm=" + nknm,
			success : function(response) {
				// 닉네임 이미 존재하는 경우
				if (response.data === true) {
					$('#nkname-warn').css('display','block');
					$("#nkname-warn").text("닉네임이 이미 존재 합니다.");
				}
				// 닉네임 없는 경우
				else {

					$.ajax({
						url : "/net/api/updatenknm",
						type : "post",
						data : "nknm=" + nknm +"&mbNo="+$('#mbNo').val(),
						success : function(response) {
							$('#nkname-warn').css('display','none');
							$('.rowcontent input').prop('disabled',true);
							$('#pri-info').text('정보 수정');
						},
						error : function(jqXHR, status, e) {
						}

					});

				}
			},
			error : function(jqXHR, status, e) {
			}

		});
	}
}


$(function(){

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


	//기존 설정된 학문 맞춤정보 불러오기
	for(var i=0;i<$('#studyList div').length;i++){
		studyNames.push($($('#studyList div')[i]).text());
	}
	for(var i=0;i<$('#researchList div').length;i++){
		researchNames.push($($('#researchList div')[i]).contents().get(0).nodeValue);
	}
	for(var i=0;i<$('#purposeList div').length;i++){
		purposeNames.push($($('#purposeList div')[i]).text());
	}
	for(var i=0;i<$('#arList div').length;i++){
		arNames.push($($('#arList div')[i]).text());
	}

	//각 맞춤정보에 설정된 값이 없는 경우 미설정으로 세팅
	for(var i=0;i<infoListVar.length;i++){
		if($('#'+infoListVar[i]).children().length==0){
			$('#'+infoListVar[i]).html('<div>미설정</div>');
		}
	}


	$('#research').click(function(){
		fetchListByStudy(studyNames);
		autoComplete();
	})

	//수정 하기 클릭시
	$(document).on('click', '.modify', function(event) {
		
		if($(this).siblings('.modifyList').css('display')==='block'){
			
			var mbNo = $('#mbNo').val();
			var type = $(this).attr('id');


			//해달 배열 ajax로 연결
			if(type === 'study'){
				cdNames = studyNames;
			}else if(type === 'research'){
				cdNames = researchNames;
			}else if(type === 'purpose'){
				cdNames = purposeNames;
			}else if(type === 'ar'){
				cdNames = arNames;
			}else{
				return;
			}

			$.ajax({
				url : "/net/api/modifyInfo",
				type : "post",
				data : "mbNo="+mbNo
				+"&type="+type
				+"&cdNames="+cdNames,

				success : function(response) {
					//parent.window.location.href = "/net/user/mypage";
					$('#'+type+'Modify').css('display','none')
					$('#'+type+'List div button').css('visibility','hidden')
				},
				error : function(jqXHR, status, e) {
					console.log(status + " : " + e);
				}
			});
			
			$(this).text('정보 수정');
			
			$(this).siblings('.modifyList').css('display','none');
			$($(this).siblings('.list')).find('div button').css('visibility','hidden')
		}
		
		
		else{
			$(this).text('수정 완료');
			$(this).siblings('.modifyList').css('display','block')
			$($(this).siblings('.list')).find('div button').css('visibility','visible')
		}
		
		
		
	});

	//맞춤정보 속성 박스 클릭시
	$(document).on('click', '.box', function(event) {

		var listName = $(this).parents('div').siblings('span').attr('id');
		var listLength = $('#'+listName+'List div').length;
		
		if($(this).hasClass('on')){

			$(this).removeClass('on');
			for(var i=0; i<listLength; i++){
				if($($('#'+listName+'List div')[i]).text() === $(this).text()){
					$($('#'+listName+'List div')[i]).remove();
					removeNames(listName, $(this).contents().get(0).nodeValue)
				}
			}

		}

		else{
			//분야 정보는 하나만 되도록
			if(listName==='study'&&studyNames.length==1){
				return;
			}
			$(this).addClass('on');
			if($($('#'+listName+'List div')[0]).text()==='미설정'){
				$('#'+listName+'List').empty();
			}

			$('#'+listName+'List').append('<div>'+$(this).text()+'</div>');
			addNames(listName, $(this).contents().get(0).nodeValue)

		}
	});


	$(document).on('click', '.delete', function(event){

		var listLength = $('#researchList div').length;
		var deleteValue = $(this).val();

		for(var i=0;i<listLength;i++){
			if($($('#researchList div')[i]).contents().get(0).nodeValue === deleteValue){
				$($('#researchList div')[i]).remove();
				removeNames('research',deleteValue)
			}
		}

	})

	$('#pri-info').click(function(){
		
		if($('.rowcontent input').prop('disabled')){
			$(this).text('수정 완료')
			prevNknm = $('.input-nknm').val();
			$('.rowcontent input').prop('disabled',false);
			
		}else{
			
			if(nknmCheck($('.input-nknm').val())){
				$(this).text('정보 수정')
				$('.rowcontent input').prop('disabled',true)
			}
		}
	})


	$( '.input-nknm' ).on( 'keydown', function(){
		$('#nkname-warn').css('display','none');
	});
	
	$('.close').click(function(){
		$('#snsdiscon').css('display','none');
	})
	
	
	$('#disconNaver').click(function(){
		swal({
			title: "네이버 연동 끊기", 
			showCancelButton: true,
			closeOnConfirm: false,
			cancelButtonText:"취소",
			confirmButtonText: "연동 끊기",
			confirmButtonColor: "#A3DD82"
		}, function() {
			$.ajax({
				url: "/net/api/updateMbDstnct",
		        data: { email: "-1",
		        		mbNo: mbno},
		        type: "POST"
			})
			.done(function(data) {
				swal("네이버 연동 해체", "네이버 연동 해체되었습니다", "success");
			})
			.error(function(data) {
		        swal.showInputError("오류 발생");
			});
		});
	})
	
	$('#disconFace').click(function(){
		swal({
			title: "페이스북 연동 끊기", 
			text: "아이디로 사용할 이메일을 입력해주세요", 
			type: "input",
			inputType: "text",
			showCancelButton: true,
			closeOnConfirm: false,
			cancelButtonText:"취소",
			confirmButtonText: "연동 끊기",
			confirmButtonColor: "#A3DD82"
		}, function(typedEmail) {

			if (typedEmail === "") {
				swal.showInputError("이메일을 입력해주세요");
		        return false;
			}
			if(!regEmail.test(typedEmail)){
				swal.showInputError("올바른 이메일 형식을 입력해주세요");
				return false;
			}

			$.ajax({
				url: "/net/api/checkemail",
		        data: { email: typedEmail },
		        type: "GET"
			})
			.done(function(data) {
				if(data.data){
					swal.showInputError("이미 사용중인 이메일 입니다");
					return false;
				}else{
					$.ajax({
						url: "/net/api/updateMbDstnct",
				        data: { email: typedEmail,
				        		mbNo: mbno},
				        type: "POST"
					})
					.done(function(data) {
						swal("페이스북 연동 해체", "페이스북 연동 해체되었습니다", "success");
					})
					.error(function(data) {
						swal.showInputError("오류 발생");
					});
				}
		       
			})
			.error(function(data) {
		        swal.showInputError("???????");
			});
		});
	})

})
