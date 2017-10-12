$(function(){
	$("#allBtn").click(clickTab);
	$("#gradBtn").click(clickTab);
	$("#labBtn").click(clickTab);
	var temp;
})

var global = "all";

function clickTab(){
	var $tablinks;
	
	var type;
	
	tablinks = document.getElementsByClassName("tablinks");
	tablinks = $(".tablinks")
	
	for (var i = 0; i < tablinks.length; i++) {
		
	$(tablinks[i]).removeClass("active");
	}
	
	$(this).addClass("active");
	type = $(this).html();
	
	global = $(this).html();
	
	addList(type);
}


var addList = function(type,page){
	
	
	temp = $(this).html();
	var p ;
	var engType = typeToEng(type);
	var $tablinks;
	
	if(type=="전체"){
		type=" "
	}
	
	if (typeof(page) == "undefined") {
		p=1;
	} else{
		p=page;
	}
	
	
	
	
	

	$.ajax({
		url : "/net/noti/api/list?type="+type+"&page="+p,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			
			$("#tabView").empty();
			$("#tabView").append("<div class='col-md-12'> <h3>"+
								"<a " +
									"href='${pageContext.servletContext.contextPath }/noti/detail?no=${list.slctnNotiNo}&tabnm=${list.slctnNotiDstnct}'>"+response.data[0].slctnTitle+"</a>"+
							"</h3>" +
							"<hr>" +
						"</div>");
			
			
		},
		error : function(jqXHR, status, e) {
			console.error(status + " : " + e);
		}
	});
}

function typeToEng(type){
	if(type=="연구실"){
		return "lab";
	}else if(type=="대학원"){
		return "grad";
	}
}



function openTab(evt, tabName, temp) {
	var i, tabcontent, tablinks;

	if (temp === 'organz' || temp === 'noti') {
		tabcontent = document.getElementsByClassName("col-lg-8");
	} else if (temp === 'admin') {
		tabcontent = document.getElementsByClassName("col-lg-12");
	}

	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(tabName).style.display = "block";
	evt.currentTarget.className += " active";

}


document.getElementById("defaultOpen").click();

