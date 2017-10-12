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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ejs/ejs.js"></script>


<link href="${pageContext.request.contextPath}/resources/css/counseling.css" rel="stylesheet">
<style>



</style>
<script>
//글쓰기 폼
function wrightMenu() {
    document.getElementById("writeModal").style.display = "block";
}

function closeMenu() {
    document.getElementById("writeModal").style.display = "none";
}

//글쓰기 폼 end

window.onclick = function (e) {

    if (e.target == document.getElementById("writeModal")) {
        closeMenu();
    }
 
}

$(function() {
	
	$(document).ready(function() {
		
		

		$("#cfile").click(function () {
			
				
			  $("input[type='file']").trigger('click');
			});

			$('input[type="file"]').on('change', function() {
			  var val = $(this).val();
			  $(this).siblings('span').text(val);
		});
			


	});
	
	
})




</script>
</head>
<body>


<form class="counselingform" id="counselingform" name="counseling"  enctype="multipart/form-data">
		  <div id="writeModal" class="w3-modal w3-animate-opacity"  tabindex=-1>
                <div class="w3-modal-content w3-card-2 w3-round-large w3-padding-16">
                    <header class="w3-container">
                    <span class="w3-medium w3-text-grey ">@
                        <select class="w3-border-0 w3-white" name="boardoption" id="boardoption">
                            <option value="전체" disabled selected>you are posting at</option>
                            <option value="인문학">인문학</option>
                            <option value="사회과학">사회과학</option>
                            <option value="자연과학">자연과학</option>
                            <option value="공학">공학</option>
                            <option value="의약학">의약학</option>
                            <option value="농수해양학">농수해양학</option>
                            <option value="예술체육학">예술체육학</option>  
                            <option value="복합학">복합학</option>      
                                  
                        </select>
                        
							
					<input id="boardtype" type="hidden" name="boardtype" value="${boardtype }">
					
                    </span>
                        <span class="w3-right">작성자 정보
                        <label>
                            <input class="w3-radio" type="radio" id="writrInfoOpngYn" name="writrInfoOpngYn" value="Y" checked>공개
                        </label>
                        <label>
                            <input class="w3-radio" type="radio" id="writrInfoOpngYn" name="writrInfoOpngYn" value="N">비공개
                        </label>
                    </span>
                    </header>
                    <div class="w3-container">
                        <input type="text" class=" w3-xxlarge w3-border-0 w3-padding-16" id="wrtbtTitle" name="wrtbtTitle" placeholder="TITLE…"
                               style="width: 100%;">
                        <textarea class="w3-container w3-xlarge w3-border-0" id="wrtbtText" name="wrtbtText" style="width: 100%; height: 13em;"
                                  placeholder="my story is…."></textarea>
                    </div>
                    <footer class="w3-container">
                        <label>
                            <input class="w3-radio" type="radio" name="writeoption" value="일반게시판" id="writeoption">일반
                        </label>
                        <label>
                            <input class="w3-radio" type="radio" name="writeoption" value="상담게시판" id="writeoption" checked>상담
                        </label>
                        
                        
                        <table id="filetable" cellpadding="5" cellspacing="0">
								<tr name="tr_attach_file">
									
									<td>
											
										<div class="element">
										  <span id="cfile" class="name"><i class="far fa-file-image fa-lg"></i></span>
										  <input class="hide" id="file" type="file" name="file"  accept="image/*" multiple />
										</div>
															
				
									</td>
								</tr>

							</table>
							<div id='apndngfiles'></div>
							
                        
                        
                        <button 
                                class="w3-button w3-right w3-green w3-margin-left w3-round-large" onClick="counselinginsert();"
                                style="background: linear-gradient(141deg, #0fb8ad, #1fc8db , #2cb5e8);">확 인
                        </button>
                        <button type="button" onclick="closeMenu()" class="w3-button w3-right w3-round-large">Cancel
                        </button>
                    </footer>
                </div>
            </div>
            
  </form>	          


	
</body>
</html>