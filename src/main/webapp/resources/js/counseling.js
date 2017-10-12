
	var bbsNo;
	var test;
	var order; 
	var boardtype;
	var count=0;
	var totalListNum = 0;


	var isEnd = false;

	var dislistItemTemplate = new EJS({	url : "/net/resources/js/ejs-template/discussion-list-item.ejs"});
	var dislistTemplate = new EJS({	url : "/net/resources/js/ejs-template/discussion-list.ejs"});
	var counlistItemTemplate = new EJS({	url : "/net/resources/js/ejs-template/counseling-list-item.ejs"});
	var counlistTemplate = new EJS({	url : "/net/resources/js/ejs-template/counseling-list.ejs"});	
	var pagelistTemplate = new EJS({url : "/net/resources/js/ejs-template/page-list.ejs"});
	var disbFetching = false;
	
	
	function reset(type,order1){
				
		if(totalListNum >= 20){
			pageList(type, order1, '1');
		}
		else {
		$("#list").empty();
	
		order=order1;
		 isEnd=false;
		 disfetchList(type,order);
		 totalListNum = 0;
		}
		 
	}
	
	
	var disfetchList = function(type,order, callback) {
			
		if (isEnd === true) {
			return;
		}
		
		var startNo;
		var startNo2; 
		var user = 	$("#authUser").val();
		
			
		if(type == '전체') {
			startNo = $("#list .w3-card-2:last-child").find('input').val() || 0;
		}else{
			
			startNo = $("#list .w3-card-4:last-child").find('input').val() || 0;
		}


		$.ajax({
			url : "/net/counseling/api/list?sno="+startNo+"&type="+type+"&order="+order,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
			test=response.data;
			

				if (response.result === "fail") {
					console.warn(response.message);
					return;
				}

				if (response.data.counselingList.length < 5) {
					console.log(response.data.counselingList.length);
					isEnd = true;
				}
				$.each(response.data.counselingList, function(index, vo) {
					
					vo.user = user;
					disrender(type, vo);
					totalListNum++;
					if (totalListNum >= 20) {
						isEnd = true;
						pageList(type, order, '1', 'init');
					}
				});

				disbFetching = false;
				
				startNo2=startNo;
				for(var i=0; i<response.data.counselingList.length; i++){
					
					
					for(var j=0; j<response.data.fileList[i].length; j++){
						
						
						count=1+parseInt(i)+parseInt(startNo2);

						$('.listimg'+count).css("background-image"," url('"+response.data.fileList[i][j].storgPath+"')"); 
						$('.listimg'+count).css("background-position","center"); 
						$('.listimg'+count).css("height","200px"); 
						$('.listimg'+count).css("margin","5px 0 5px 0"); 
						
						break;
					}
					
					
					
				}
				
				if (typeof(callback) == "function") callback();
				
				
			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
				disbFetching = false;
			}
		});

	}
	

	var disrender = function(type,vo, mode) {
		var html;

		if(type==='전체'){
			html = counlistItemTemplate.render(vo);
		}
		else{
			
			html = dislistItemTemplate.render(vo);
			
		}

		if (mode === true) {
			$("#list").prepend(html);
		} else {
			$("#list").append(html);
			
		}

	}


	var pageList = function(type, order, page, check) {


		var user = 	$("#authUser").val();
		
		$.ajax({
			url : "/net/counseling/api/pagelist?page=" + page + "&type=" + type
					+ "&order=" + order + "&user=" + user,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
				console.log(response);

				if (response.result === "fail") {
					console.warn(response.message);
					return;
				}

				var vo;

				vo = response.data;
				vo.type = type;
				vo.order = order;
				vo.check = check;
				vo.user = user;

				pageListrender(type, vo);

			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
			}
		});

	}


	var pageListrender = function(type, vo, mode) {
		var html;
		var listhtml;
		

		html = pagelistTemplate.render(vo);

		if (vo.check != 'init') {
			if (type === '전체') {
				listhtml = counlistTemplate.render(vo);
			} else if(type === '공학'){
				listhtml = dislistTemplate.render(vo);
			}
		}

		$("#list").html(listhtml);
		$("#pagelist").html(html);
		

		for(var i=0;i<vo.scrapList.length;i++){
			if(vo.scrapList[i].prntsDstnct==='게시글'){ //게시글
				$('.do-scrapcoun' + vo.scrapList[i].prntsNo).addClass('scrap-on');
			}
		};

	}

	function changeColor(obj) {

		
	   $(".objectbutton1").removeClass("on");
	   $(".objectbutton2").removeClass("on");
	   
	   if(obj.value == "일반게시판"){
		   
		   $(".objectbutton2").addClass("on");
		  
		   
	   }else{
		   
		   $(".objectbutton1").addClass("on");
		  
	   }	   
	}
	

	$(function() {

		
	
		var authUser = $("#authUser").val();

		 		 
			$("#headerBtn").click(function(event) {
				
				type="전체";	
				
			
			});
			
			$("#myBtn").click(function(event) { 
				
				type=boardtype;
				

			});
			
			
			type=boardtype;
			

			$(".writeBtn").click(function() { 
				

				console.log("글쓰기")
				if (authUser === null || authUser === '' || authUser === undefined) {
					
					$("#loginForm").css({
						"display" : "block"
					});

				} else {
					
					$("#boardoption").val(type).attr("selected", "selected");
					
					

					$("#writeModal").css({
						"display" : "block"
					});
										

				}

			});
		
		
		$(document).on('click', "a.detail", function() { 
			
			if (authUser === null || authUser === '') {
			
			$(".detail").removeAttr("href");
			
			$("#login").css({
				"display" : "block"
			});

		}        
		});
		
		
		
		$(".close").click(function() {
			$("#writeModal").css({
				"display" : "none"
			});
			
			
		});

		$("html").click(function(event) {
			
			if (event.target.id === "writeModal") {
				$("#writeModal").css({
					"display" : "none"
				});
			}
			
			if (event.target.id === "searchForm") {
				$("#searchForm").css({
					"display" : "none"
				});
			}
			
			
			if (event.target.id === "registerForm") {
				$("#registerForm").css({
					"display" : "none"
				});
				
				initSignupModal();
			}
			

			if (event.target.id === "loginForm") {
				$("#loginForm").css({
					"display" : "none"
				});
				
				initLoginModal();
			}
			

			
			
		});
		
		
		$('#writrInfoOpngYn2 li > a').on('click', function() { 

			
			 document.getElementById("writrInfoOpngYn").innerHTML = 
				 
				 "<option  class='hide' value='Y'></option>"+
				  "<option value='N' selected='selected'>비공개로 작성하기</option>";
		});

		
		
		$(document).keydown(function(e) { 
			

			  var modal1 = document.getElementById('writeModal');
		    if (e.keyCode == 27) { 
		    	
				   modal1.style.display = "none";
		    } 
		});
		
		

	})
	
	function resize(obj) {
			

			 obj.style.height = "1px";
			 obj.style.height = (12+obj.scrollHeight)+"px";
			
			 $("#writeModal").scrollTop($("#writeModal")[0].scrollHeight);


	}
	

	function titleResize(obj) {

		obj.style.height = "1px";

		obj.style.height = (20 + obj.scrollHeight) + "px";

	}


	function counselinginsert() {

		
		
		 var formData = new FormData($("#counselingform")[0]);

		 
		var boardoption=$("#boardoption").val();
		 
		 var writrInfoOpngYn = $("#writrInfoOpngYn").val();
		
		
		formData.append('writrInfoOpngYn', writrInfoOpngYn);
		

		$("#writeModal").css({
			"display" : "none"
		});

		
		$.ajax({
			url : "/net/counseling/api/write",
			type : "post",
			data : formData,
			processData : false,
            contentType : false,


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
	

	
	
	

