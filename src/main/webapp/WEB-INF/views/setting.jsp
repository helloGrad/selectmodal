<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">   
<title>하이그래드넷</title>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/autoCompleteSroll.js"></script>
			    
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
    
    

<style>

.distinct-line {
padding-top: 4.5em;
}

</style>	
	
</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp" />


<div class="container">
	<input id='mbNo' type="hidden" value="${authUser.mbNo }">
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8 distinct-line">

            <div class="row">
                <div class="col-lg-4 centering">
                    <h2>설정</h2>
                </div>
            </div>
            <hr class="nav-line">

            <div class="row">
                <div class="col-lg-4 centering">
                    <h3>맞춤정보 관리</h3>
                </div>
            </div>
            <ul class="w3-ul ">
                <li class="w3-padding-16">
                    <span id='study' class="w3-button w3-white w3-large w3-right modify">정보 수정</span>
                    <span class="w3-large">분야 </span><br>
                    <div id='studyList'>
						<c:forEach var='infoList' items='${infoList }'>
                    		<c:if test="${infoList.cdDstnct=='학문' }">
                    			<c:if test="${infoList.prntsNo>0 }">
                    				<div>${infoList.cdNm }</div>
                    			</c:if>
                    		</c:if>
                    	</c:forEach>                    
                    </div>
                    <br>
                    <div id='studyModify' class='modifyList' style='display: none'>
                    	<c:forEach var='infoList' items='${infoList }'>
                    		<c:if test="${infoList.cdDstnct=='학문' }">
                    			<c:if test="${infoList.prntsNo==0 }">
                    				<div class='box'>${infoList.cdNm }</div>
                    			</c:if>
                    			<c:if test="${infoList.prntsNo>0 }">
                    				<div class='box on'>${infoList.cdNm }</div>
                    			</c:if>
                    		</c:if>
                    	</c:forEach>
					 </div>
                    
                    
                </li>
            </ul>
            <hr class="">
            <ul class="w3-ul ">
                <li class="w3-padding-16">
                     <span id='research' class="w3-button w3-white w3-large w3-right modify">정보 수정</span>
                    <span class="w3-large">연구분야</span><br>
                    <div id='researchList' class='list'>
						<c:forEach var='infoList' items='${infoList }'>
                    		<c:if test="${infoList.cdDstnct=='연구분야' }">
                    			<c:if test="${infoList.prntsNo>0 }">
                    				<div>${infoList.cdNm }<button type='button' class='btn delete' style='visibility: hidden' value='${infoList.cdNm }'>X</button></div>
                    			</c:if>
                    		</c:if>
                    	</c:forEach>                   
                    </div>
                    <br>
                    <div id='researchModify' class='modifyList' style='display: none'> 
                   		<div>검색대상은 선택한 분야의 연구분야가 제공됩니다.</div>
                   		<label for="tags">연구분야 : </label>
	  					<input id="tags">
	  					<div id="duplicateMsg" style="display: none">중복입니다 !!</div><br>
                    </div>
                </li>
            </ul>
            <hr class="">
            <ul class="w3-ul ">
                <li class="w3-padding-16">
                     <span id='purpose' class="w3-button w3-white w3-large w3-right modify">정보 수정</span>
                    <span class="w3-large">방문 목적</span><br>
                    <div id='purposeList'>
						<c:forEach var='infoList' items='${infoList }'>
                    		<c:if test="${infoList.cdDstnct=='방문목적' }">
                    			<c:if test="${infoList.prntsNo>0 }">
                    				<div>${infoList.cdNm }</div>
                    			</c:if>
                    		</c:if>
                    	</c:forEach>                    
                    </div>
                    <br>
                    <div id='purposeModify' class='modifyList' style='display: none'> 
                    	<c:forEach var='infoList' items='${infoList }'>
                    		<c:if test="${infoList.cdDstnct=='방문목적' }">
                    			<c:if test="${infoList.prntsNo==0 }">
	                    			<div class='box'>${infoList.cdNm }</div>
                    			</c:if>
                    			<c:if test="${infoList.prntsNo>0 }">
	                    			<div class='box on'>${infoList.cdNm }</div>
                    			</c:if>
                    		</c:if>
                    	</c:forEach>
                    </div>
                    
                </li>
            </ul>
            <hr class="">
            <ul class="w3-ul ">
                <li class="w3-padding-16">
                     <span id='ar' class="w3-button w3-white w3-large w3-right modify">정보 수정</span>
                    <span class="w3-large">지역</span><br>
                    <div id='arList'>
						<c:forEach var='infoList' items='${infoList }'>
                    		<c:if test="${infoList.cdDstnct=='지역' }">
                    			<c:if test="${infoList.prntsNo>0 }">
                    				<div>${infoList.cdNm }</div>
                    			</c:if>
                    		</c:if>
                    	</c:forEach>                    
                    </div>
                    <br>
                    <div id='arModify' class='modifyList' style='display: none'>
						<c:forEach var='infoList' items='${infoList }'>
                    		<c:if test="${infoList.cdDstnct=='지역' }">
                    			<c:if test="${infoList.prntsNo==0 }">
	                    			<div class='box'>${infoList.cdNm }</div>
                    			</c:if>
                    			<c:if test="${infoList.prntsNo>0 }">
	                    			<div class='box on'>${infoList.cdNm }</div>
                    			</c:if>
                    		</c:if>
                    	</c:forEach> 
					</div>
                </li>
            </ul>
            <hr class="">


            <div class="row">
                <div class="col-lg-4 centering">
                    <h3>개인정보 관리</h3>
                </div>
            </div>
            <ul class="w3-ul ">
                <li class="w3-padding-16">
                <span id ='pri-info' class="w3-button w3-white w3-large w3-right modify">정보 수정</span>
                    
                <div class='rowform'>
    				<div class='rowlabel'><span class="w3-large">닉네임</span></div>
				   <div class='rowcontent'><input  id='nickname' type="text" class="form-control input-sm input-nknm" value='${privateInfo.nknm }' disabled/></div>
  				</div>
  				
 				<div id='nkname-warn' class='rowcontent' style='color: red; display:none;'></div>
  				
  				<div class='rowform'>
    				<div class='rowlabel'><span class="w3-large">성별</span></div>
    				
    				<c:if test="${privateInfo.sex=='F' }">
    					<div class='rowcontent'>여성</div>
    				</c:if>
				   	
				   	<c:if test="${privateInfo.sex=='M' }">
    					<div class='rowcontent'>남성</div>
    				</c:if>
				   
  				</div>
  				
  				<div class='rowform'>
  				<c:set var = "birth" value = "${privateInfo.birdt }"/>
  				<c:set var = "year" value = "${fn:substring(birth, 0,4) }"/>
  				<c:set var = "month" value = "${fn:substring(birth, 4,6) }"/>
  				<c:set var = "day" value = "${fn:substring(birth, 6,8) }"/>
    				<div class='rowlabel'><span class="w3-large">연령</span></div>
    				
    				
    				<c:if test="${privateInfo.snsDstnct=='네이버' }">
    					<div class='rowcontent'>${privateInfo.agrg}</div>
               		</c:if>
               		
               		
               		
               		<c:if test="${privateInfo.snsDstnct==''||privateInfo.snsDstnct==null||privateInfo.snsDstnct=='페이스북' }">
               			<div class='rowcontent'>${year } / ${month } / ${day }</div>
            		</c:if>
  				</div>
                    
                </li>
            </ul>
            <hr class="">

            <div class="row">
                <div class="col-lg-4 centering">
                    <h3>알림설정 관리</h3>
                </div>
            </div>
            <ul class="w3-ul ">
                <li class="w3-padding-16">
                    <span class="w3-button w3-white w3-large w3-right">정보 수정</span>
                    <span class="w3-large">알림 받을 컨텐츠 설정</span><br>
                    <span>상담실 : Disabled</span>
                    <br>
                    <span>모집공고 : Disabled</span>
                </li>

            </ul>

            <hr>

            <div class="row">
                <div class="col-lg-4 centering">
                    <h3>연결계정 관리</h3>
                </div>
            </div>
            <ul class="w3-ul">
            
            	<c:if test="${privateInfo.snsDstnct==''||privateInfo.snsDstnct==null }">
            		<li class="w3-padding-16">
            			<span class="w3-large">연결된 계정이 없습니다. </span><br>
            		</li>
            		
            	</c:if>
            	<c:if test="${privateInfo.snsDstnct=='네이버' }">
                	<li class="w3-padding-16">
                    	<span id='disconNaver' class="w3-button w3-white w3-large w3-right">계정 연동 끊기</span>
                    	<span class="w3-large">네이버 계정연동 중</span><br>
                    	<span>${privateInfo.iden }</span>
                    	
	                </li>
                </c:if>
                
                <c:if test="${privateInfo.snsDstnct=='페이스북' }">
                	<li class="w3-padding-16">
	                    <span id='disconFace' class="w3-button w3-white w3-large w3-right">계정 연동 끊기</span>
                    	<span class="w3-large">페이스북 계정연동 중</span><br>
                    	<div>
                    	</div>
                    	
	                </li>
                </c:if>
            </ul>

            <hr>

            <div class="row">
                <div class="col-lg-4 centering">
                    <h3>계정 관리</h3>
                </div>
            </div>
            <ul class="w3-ul">
                <li class="w3-padding-16">
                    <span class="w3-large">회원 탈퇴</span>
                    <span id='withdraw ' onclick="momo();" class="w3-button w3-white w3-large w3-right">회원 탈퇴하기</span>

                </li>

            </ul>

            <hr>



        </div>

        <div class="col-lg-2"></div>

    </div>
    
    

</div>
  	<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
</body>

</html>