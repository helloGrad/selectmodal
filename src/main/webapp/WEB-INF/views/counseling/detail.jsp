<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("newLine", "\n");
%>                  
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>하이그래드넷</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>  
		  
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

		
<style>
body {
	padding-top: 80px;
}
.question {
	font-size : 1.5em;
    font-weight: bold;
}
.remove-btn {
	float : right;
}
.web-volunteer {
	font-size: 1.5em;
}
.info {
	border-top: 1px solid lightgray;
}
.interest {
	color : gray;
}
.option {
	float : right;
}
p {
	line-height: 170%;
}
.disabled {
	pointer-events: none;
   	cursor: default;
}
.winter { 
	border:7px solid #FF8080; 
	background-color: #FF8080;
	border-radius: 8px;
}
.hide{
	display:none;  
}		
select {
	-webkit-appearance: none; 
	-moz-appearance: none;   
	appearance: none;       
}
select::-ms-expand {
	display: none;           
}	

textarea {
	width:300px; 
	overflow:visible;
} 
</style>   
</head>

<script>

    function resize(obj) {
      obj.style.height = "1px";
      obj.style.height = (20+obj.scrollHeight)+"px";
    }
    
	var list = [];
	var counselingPrnts = JSON.parse('${jsoncounselingPrnts}');
	var existLike = JSON.parse('${jsonexistLike}');
	var counselingReply = JSON.parse('${jsoncounselingReply}');

	$(function() {
		
		var authUser= $("#authUser").val();
		var replysize = $("#replysize").val();

		var type = "${type}";
		
		var existLikelist = []; 
	
		if (replysize == 0) { 

			if (type === 'prnts') {

				div_hide();
			}

		} else {

			div_hide();
		
		}
		
		

		for( var i=0; i<existLike.length; i++){
			
			
			if(existLike[i].wrtbtNo == counselingPrnts[0].wrtbtNo){
			
				var link ="like"+existLike[i].wrtbtNo+"like";
				
				
				list.push(link);
				
				$('.'+link).addClass("winter");
			
				
			}
			
			
		}
		
			
			for( var i=0; i<counselingReply.length; i++){
				
				for( var j=0; j<existLike.length; j++){
				
				if(existLike[j].wrtbtNo == counselingReply[i].wrtbtNo){
			
	
					var link ="like"+existLike[j].wrtbtNo+"like";

					var dislink ="like"+existLike[j].wrtbtNo+"dislike";
					
					list.push(link);
					
					
					list.push(dislink);
					
					$('.'+link).addClass("winter");
					$('.'+dislink).addClass("winter");
					
				
				}
			}
			
			
		}
		

		$(document).ready(function() {

			$("#myBtn").click(function() {
				
				
				if(authUser === null || authUser===''){
					
		    		
		    		location.href='${pageContext.request.contextPath }/user/login';
					
					
				}else{
					
					var con = document.getElementById("reply-form");

					if (con.style.display == 'none') {
						con.style.display = 'block';
					} else {
						con.style.display = 'none';
					}

				}

			});
			
			$('#writrInfoOpngYn2 li > a').on('click', function() { 

				
				 document.getElementById("writrInfoOpngYn").innerHTML = 
					 
					 "<option  class='hide' value='Y'></option>"+
					  "<option value='N' selected='selected'>비공개로 작성하기</option>";
			});
			
		

		});
		
	

	})
	
	


	
	function div_show() {

		document.getElementById("reply-form").style.display = "block";

	}

	function div_hide() {
		document.getElementById("reply-form").style.display = "none";
	}

	
	function counselingreplyinsert() {

		event.preventDefault();

		var authUser= $("#authUser").val();
		if(authUser === null || authUser===''){
			
    		location.href='${pageContext.request.contextPath }/user/login';
			return;
			
		}
		
		var prntsWrtbtNo=$("#prntsWrtbtNo").val();
		var wrtbtText = $("#wrtbtText2").val();			
		var writrInfoOpngYn = $("#writrInfoOpngYn").val();				
		var bbsNo = $("#bbsNo").val();

		var replylist = {
			prntsWrtbtNo : prntsWrtbtNo,
			wrtbtText : wrtbtText,
			writrInfoOpngYn : writrInfoOpngYn,
			bbsNo : bbsNo
		};

		div_hide();

		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			url : "${pageContext.request.contextPath }/counseling/api/replywrite",
			type : "post",
			dataType : "json", 
			data : JSON.stringify(replylist),
			contentType : 'application/json; charset=utf-8', 

			success : function(response) {

				if (response.result === "fail") {

					console.error(response.message);
					return;
				}

				location.reload();

			},
			error : function(jqXHR, status, e) {
				
				console.error(status + " : " + e);
				console.log(jqXHR);
			}
		});

	}

	function likeupdate(num, value) {

	

		var authUser= $("#authUser").val();
		if(authUser === null || authUser===''){
			
    		location.href='${pageContext.request.contextPath }/user/login';
			return;
			
		}
	

		var likevalue = {
				wrtbtNo : num,
				mbNo : authUser,
				infroDstnct : value
			};
		
		
		$.ajax({
			url : "${pageContext.request.contextPath }/counseling/api/likeadd",
			type : "post",
			dataType : "json",
			data : JSON.stringify(likevalue),
			contentType : 'application/json; charset=utf-8',

			success : function(response) {

				if (response.result === "fail") {

					console.error(response.message);
					return;
				}

				
				location.reload();
				
				
				if(value == 'like'){

					 var check=0;
					 var result;
					 
					 for( var i=0; i<counselingReply.length; i++){
						 
						 if(num== counselingReply[i].wrtbtNo){
							 
							 check=1;
							 
						 }
						 
					 }
					 
					 if(check ==1){ 
						 
							for( var i=0; i<existLike.length; i++){
								if(num== counselingReply[i].wrtbtNo){
									
									result = existLike[i].infoDstnct;
								}
								
								
							}
							

						 	$(".like"+num+"like").html("<a class='like"+response.data.wrtbtNo+"like' onclick='likeupdate("+response.data.wrtbtNo+",'like')' value='like'> Up <span class='w3-badge w3-white'>"+response.data.rcmdCo+"</span></a>");
							 if($(".like"+num+"dislike").hasClass("winter") === true) {
								 $(".like"+num+"dislike").removeClass("winter");
								 $(".like"+num+"like").removeClass("winter");
								}else{
									
									 $(".like"+num+"dislike").addClass("winter");
									 $(".like"+num+"like").addClass("winter");
								}		
						
						
						 
					 }else{ 
					 	$(".like"+num+"like").html("<a class='like"+response.data.wrtbtNo+"like' onclick='likeupdate("+response.data.wrtbtNo+",'like')' value='like'> 공감 <span class='w3-badge w3-white'>"+response.data.rcmdCo+"</span></a>");
	
					 	 if($(".like"+num+"like").hasClass("winter") === true) {
							 $(".like"+num+"like").removeClass("winter");
							}else{
								
								 $(".like"+num+"like").addClass("winter");
							}

						}

					
				}else{
					
					for( var i=0; i<existLike.length; i++){
						if(num== counselingReply[i].wrtbtNo){
							
							result = existLike[i].infoDstnct;
						}
						
						
					}
					
					
						 $(".like"+num+"dislike").html("<a class='like"+response.data.wrtbtNo+"dislike' onclick='likeupdate("+response.data.wrtbtNo+",'dislike')' value='dislike'> Down <span class='w3-badge w3-white'>"+response.data.ncmdCo+"</span></a>");

						 if($(".like"+num+"dislike").hasClass("winter") === true) {
							 $(".like"+num+"dislike").removeClass("winter");
							 $(".like"+num+"like").removeClass("winter");
							}else{
								
								 $(".like"+num+"dislike").addClass("winter");
								 $(".like"+num+"like").addClass("winter");
							}	
				
					
						
					
				}
				
			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
				console.log(jqXHR);
			}
		});
	}
</script>
<body>


<c:import url="/WEB-INF/views/include/header.jsp" />
	
	
<div class="container">
    <div class="row">
     
        <div class="col-lg-8">
          
            <div class="w3-card-4 w3-margin w3-topbar w3-border-red">

                <div class="w3-container">
                    <h3><b>${counselingPrnts.wrtbtTitle }</b></h3>

                </div>

                <div class="w3-container">
                <h6>
                <c:if test="${counselingPrnts.writrInfoOpngYn =='Y' }"	>
 
                <c:choose>
 
					 <c:when test="${counselingPrnts.birdt == null and counselingPrnts.agrg == null}">
				              없음
				    </c:when>
 					
				    <c:when test="${counselingPrnts.birdt == null}">
				       ${counselingPrnts.nknm}, ${counselingPrnts.agrg }대
				    </c:when>
				 
				    <c:when test="${counselingPrnts.agrg == null }">
				        ${counselingPrnts.nknm}, ${counselingPrnts.birdt }대
				    </c:when>
				 
				    <c:otherwise>
				        기타
				    </c:otherwise>
 
				</c:choose>

                </c:if>
                
                
                <c:if test="${counselingPrnts.writrInfoOpngYn =='N' }"	>
                                      비공개
                </c:if>
                    <span class="w3-opacity">• ${counselingPrnts.avlblBeginDt }에 작성</span></h6>
               </div>

                <div class="w3-container">
                    <p>
                    ${fn:replace(counselingPrnts.wrtbtText, newLine,"<br>") }
                    </p>
                    
                   	<c:forEach items="${fileList }" var="list" varStatus="status">
					  <img src="${list.storgPath }" style="max-width: 100%; height: auto;" >  
					</c:forEach>
                
                </div>

                <div class="w3-container interest">
                </div>

                <div class="w3-container">
                    <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large disabled">
                        조회수 <span class="w3-badge w3-white">${counselingPrnts.findCo }</span>
                    </div>
                    
                   
					 
					 	 
                   		 <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                      	<a class="like${counselingPrnts.wrtbtNo }like" onclick="likeupdate(${counselingPrnts.wrtbtNo },'like')" value="like"> 공감 <span class="w3-badge w3-white">${counselingPrnts.rcmdCo }</span></a>
                   		 </div>
                  
                 
                    
                    
                    <div class="dropup option">
                        <button class="w3-button w3-padding w3-padding w3-round-large" type="button" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-option-horizontal"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#">익명으로 답변하기</a></li>
                            <li><a href="#">스크랩하기</a></li>
                            <li><a href="#">신고하기</a></li>
                        </ul>
                    </div>
                    
                    <br>
                    <div class="row w3-margin">
					<c:forEach items="${fileList }" var="list" varStatus="status">
					<a id="down" href="${pageContext.servletContext.contextPath }/download?no=${list.apndngFileNo}">${list.apndngFileNm }</a>
					</c:forEach>
					</div>
                    
                </div>
                <Br>
            </div>

            <div class="w3-container">

                    <h4><b>답변</b> <span class="w3-badge w3-white">${fn:length(counselingReplyList)}</span></h4>
                    <input type="hidden" id="replysize" name="replysize" value="${fn:length(counselingReplyList)}">
                    
                    <div id="myBtn" class="btn btn-danger" >답변하기</div>
                   
                <hr>
            </div>

         
            <div class="w3-card-4 w3-margin w3-topbar w3-border-lightgray" id="reply-form">
              
			
				 <form class="reply-form" id="reply-form" name="reply-form" onsubmit="counselingreplyinsert();">
				 
					<input type="hidden" id="authUser" name="authUser" value="${authUser.mbNo }">
					<input type="hidden" id="prntsWrtbtNo" name="prntsWrtbtNo" value="${counselingPrnts.wrtbtNo }">
					 <input type="hidden" id="bbsNo" name="bbsNo" value="${counselingPrnts.bbsNo}"> <br>
					<div>답변</div> 
					<textarea class="form-control" onkeydown="resize(this)" onkeyup="resize(this)" id="wrtbtText2" name="wrtbtText"></textarea>
					
					 <div class="dropdown writedropdown">
	               			<button  class="w3-button w3-padding w3-round-large dropdown-toggle" type="button" data-toggle="dropdown" style="float:right;">
	                   		 <i class="glyphicon glyphicon-option-horizontal"></i>
	               			 </button>
	               			 <ul id="writrInfoOpngYn2" class="dropdown-menu dropdown-menu-right">
	                  	     <li class="hide"><a href="#" value="Y">공개로 작성하기</a></li>
	                  	     <li><a href="#" value="N">비공개로 작성하기</a></li>
	                  	  
	                		</ul>
	               
	                
	             	</div>
	           
	           		<select id="writrInfoOpngYn" class="hide">
	           		
					  <option  class="hide" value="Y" selected="selected"></option>
					  <option value="N">비공개로 작성하기</option>
					</select>
				

					<button type="submit" class="form-control">입력</button>
				</form>
			</div>
            
            
            
            
            <c:forEach items="${counselingReplyList}" var="counselingReplyList" varStatus="status">
            	
            	
            	 <c:if test="${status.index == 0 }"	>
            
            <div class="w3-card-4 w3-margin w3-topbar w3-border-green">
               
                <div class="w3-container">
                    <br>
                    <img src="images/portfolio/1.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:4em; height: 4em;">
                    
                    <c:if test="${counselingReplyList.writrInfoOpngYn =='Y' }"	>
                	<p><span class="w3-large w3-margin-right">${counselingReplyList.nknm}</span>
                 	 <span class="w3-medium w3-opacity"></span>
                 	  </p>
                	</c:if>
                
                
               		 <c:if test="${counselingReplyList.writrInfoOpngYn =='N' }"	>
                      <p><span class="w3-large w3-margin-right">비공개</span></p>
               		 </c:if>
                    
                    
                  
                <h6>
                    <span class="w3-small w3-opacity">${counselingReplyList.avlblBeginDt}에 답변</span></h6>
                </div>

                <br>

           
                <div class="w3-container">
                    <p>${fn:replace(counselingReplyList.wrtbtText, newLine,"<br>") } </p> 
                </div>

                <div class="w3-container">
                
                 <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                  <a class="like${counselingReplyList.wrtbtNo }like" onclick="likeupdate(${counselingReplyList.wrtbtNo },'like')" value="like" >  Up <span class="w3-badge w3-white">${counselingReplyList.rcmdCo }</span></a>
                  </div>
                   
                       
                    <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                     <a class="like${counselingReplyList.wrtbtNo }dislike" onclick="likeupdate(${counselingReplyList.wrtbtNo },'dislike')" value="dislike">  Down <span class="w3-badge w3-white">${counselingReplyList.ncmdCo }</span></a>
                    </div>



                    <div class="dropup option">
                        <button class="w3-button w3-padding w3-padding w3-round-large" type="button" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-option-horizontal"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#">신고하기</a></li>
                        </ul>
                    </div>
                </div>
                <br>
            </div>

  			</c:if>
  			
  			<c:if test="${status.index != 0 }"	>
  			
            <div class="w3-card-4 w3-margin w3-topbar w3-border-lightgray">
                
                <div class="w3-container">
                    <br>
                    <img src="http://placehold.it/40x40" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:4em; height: 4em;">
                    
                    
                    <c:if test="${counselingReplyList.writrInfoOpngYn =='Y' }"	>
                	<p><span class="w3-large w3-margin-right">${counselingReplyList.nknm}</span>
                 	 <span class="w3-medium w3-opacity"></span>
                 	  </p>
                	</c:if>
                
                
               		 <c:if test="${counselingReplyList.writrInfoOpngYn =='N' }"	>
                      <p><span class="w3-large w3-margin-right">비공개</span></p>
               		 </c:if>
               		 
               		 
                    <h6>
                        <span class="w3-small w3-opacity">${counselingReplyList.avlblBeginDt}에 답변</span></h6>
                </div>

                <br>

                <div class="w3-container">
                    <p>${counselingReplyList.wrtbtText} </p>
                </div>
                
                

                <div class="w3-container">
                    <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                  <a class="like${counselingReplyList.wrtbtNo }like" onclick="likeupdate(${counselingReplyList.wrtbtNo },'like')" value="like">  Up <span class="w3-badge w3-white">${counselingReplyList.rcmdCo }</span></a>
                  </div>
                   
                       
                    <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                     <a class="like${counselingReplyList.wrtbtNo }dislike" onclick="likeupdate(${counselingReplyList.wrtbtNo },'dislike')" value="dislike">  Down <span class="w3-badge w3-white">${counselingReplyList.ncmdCo }</span></a>
                    </div>
                    <div class="dropup option">
                        <button class="w3-button w3-padding w3-padding w3-round-large" type="button" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-option-horizontal"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#">신고하기</a></li>
                        </ul>
                    </div>
                </div>
                <br>
            </div>

			</c:if>	
		
			</c:forEach>

     
        </div>

 
        <div class="col-lg-4">
            <div class="w3-card-2 w3-margin">
                <div class="w3-container">
                <h5>Related Questions</h5>
                    <div class="interest">#유학 #외국 #컴퓨터
                    </div>
                </div>
                <br>
                <ul class="w3-ul">
                    <li><a href="">What are things about 5-star hotels that they do not want you to know?</a> </li>
                    <li><a href="">전문대 석사</a> </li>
                    <li><a href="">전문대 졸업을햇는데 학사학위 안따고 그냥 바로 석사 따도대나오??</a> </li>
                    <li><a href="">전문대 졸업을햇는데 학사학위 안따고 그냥 바로 석사 따도대나오??</a> </li>
                    <li><a href="">수능 접수하는 기간에 따라 학교배정 받는 것도 달라지나요?</a> </li>
                    <li><a href="">의대생 생활 (의대생 분들만 답변해 주셨으면 좋겠습니다) </a> </li>
                    <li><a href="">한국장학재단 농어촌융자금 등록금 납부</a> </li>

                </ul>

                <br>
            </div>
        </div>
    </div>
</div>


</body>
</html>