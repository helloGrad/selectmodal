<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<title>하이그래드넷</title>
    
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ejs/ejs.js"></script>
	        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontello-embedded.css">
<link href="${pageContext.request.contextPath}/resources/css/counseling.css" rel="stylesheet">
    
<style>
body {
   padding-top: 7em;
 }	


 .pagelist {
   margin : 5%;
   text-align: center;
}

.selectbtn {
   background-color: #ff0000;
}

a.btn.disabled.numbtn {
   background-color: #D9534F;
   color : #ffffff;
}

.scrap-on {
	color: #FF0000;
}

</style>


<script>

var authUser = '${authUser.mbNo }';


	$(function() {
		
		
		disfetchList("전체", "최신순", function() {

	
			if(authUser == null || authUser == "" ){
				
			
			}else{
				
				var scrapList=JSON.parse('${scrapList}');
				for(var i=0;i<scrapList.length;i++){

					if(scrapList[i].prntsDstnct==='게시글'){
						
						
						$('.do-scrapcoun' + scrapList[i].prntsNo).addClass('scrap-on');
					}
				};	
				
			}
		});
		
		$(window).scroll(function() {
			var $window = $(this);
			var scrollTop = $window.scrollTop();
			var windowHeight = $window.height();
			var documentHeight = $(document).height();
			if (scrollTop + windowHeight + 10 > documentHeight) {
				if (!disbFetching) {
					disbFetching = true;
					disfetchList("전체", "최신순", function() {
						

				
						if(authUser == null || authUser == "" ){
							
						
						}else{
							
							var scrapList=JSON.parse('${scrapList}');
							for(var i=0;i<scrapList.length;i++){

								if(scrapList[i].prntsDstnct==='게시글'){ 
									
									
									$('.do-scrapcoun' + scrapList[i].prntsNo).addClass('scrap-on');
								}
							};	
							
						}
					});
				}
			}
			

		});
		
		
	});
</script>

<body>
<c:import url="/WEB-INF/views/include/header.jsp" />

<div class="container">
   
    <div class="row">
        <div class="col-lg-3">
        	    분야
            <a href="*" class="remove-btn">EDIT</a>

            <hr>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 즐겨찾기
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 답변을 기다리는 중 ...
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 데이터베이스
                <a href=""> <i class="glyphicon glyphicon-remove remove-btn"></i></a>
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 인공지능
                <a href=""> <i class="glyphicon glyphicon-remove remove-btn"></i></a>
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 빅 데이터
                <a href=""> <i class="glyphicon glyphicon-remove remove-btn"></i></a>
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 컴퓨터
                <a href=""> <i class="glyphicon glyphicon-remove remove-btn"></i></a>
            </div>
        </div>



    <div class="col-lg-9">
    
	
		
		<div class="w3-container">
		
            <div id="myBtn" class="btn btn-danger web-volunteer writeBtn">질문하기</div>
            
            <div class="dropdown option">
                <button class="w3-button w3-padding w3-padding w3-round-large" type="button" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-option-horizontal"></i>
                </button>
                <ul class="dropdown-menu dropdown-menu-right">
                     <li><a href="javascript:void(0);" onclick="reset('전체','조회순');">조회순</a></li>
                     <li><a href="javascript:void(0);" onclick="reset('전체','공감순');">공감순</a></li>
                     <li><a href="javascript:void(0);" onclick="reset('전체','최신순');">최신순</a></li>
                </ul>
            </div>
   
 </div>

			<input type="hidden" id="authUser" name="authUser" value="${authUser.mbNo }">
        	<div id="list"></div>
        
         	<div id="pagelist" class="pagelist"></div>
        


    </div>


    </div>
</div>


<c:import url="/WEB-INF/views/include/footer.jsp" />

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/doscrap.js"></script>	
</body>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">	
</html>