
var doScrap = function(type, id, user) {
	


	if (user === undefined || user ==null || user =='' ) {

		$("#login").css({
			"display" : "block"
		});

		return;
		
		
	} else {

		var classType;
		if (type === '모집공고') {
			classType = 'noti';
		} else if (type === '게시글') {
			classType = 'coun';
		}
		

		if ($('.do-scrap' + classType + id).hasClass("w3-text-red")) {
			
			console.log("클릭")

			
			$('.do-scrap' + classType + id).removeClass("w3-text-red");

			$.ajax({
				url : "/net/api/deletescrap?type=" + type + "&id=" + id
						+ "&user=" + user,
				type : "get",
				dataType : "json",
				data : "",
				success : function(response) {
				

					if (response.result === "fail") {
						console.warn(response.message);
						return;
					}

				},
				error : function(jqXHR, status, e) {
					console.error(status + " : " + e);
				}
			});
		} else {
			$('.do-scrap' + classType + id).addClass("w3-text-red");


			$.ajax({
				url : "/net/api/addscrap?type=" + type + "&id=" + id + "&user="
						+ user,
				type : "get",
				dataType : "json",
				data : "",
				success : function(response) {
				

					if (response.result === "fail") {
						console.warn(response.message);
						return;
					}

				},
				error : function(jqXHR, status, e) {
					console.error(status + " : " + e);
				}
			});
		}
	}

}