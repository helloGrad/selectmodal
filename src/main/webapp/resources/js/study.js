


var boardtype;



$(function() {	
		
			if (boardtype == '인문학') {
		
				$('.subtitle').text('Humanities');
			} else if (boardtype == '사회과학') {
		
				$('.subtitle').text('Social Science');
		
			} else if (boardtype == '자연과학') {
		
				$('.subtitle').text('Natural Science');
		
			} else if (boardtype == '공학') {
		
				$('.subtitle').text('Engineering');
		
			} else if (boardtype == '의약학') {
		
				$('.subtitle').text('Medicine and Pharmacy');
		
			} else if (boardtype == '농수해양학') {
		
				$('.subtitle').text('Marine Agriculture, Fishery');
		
			} else if (boardtype == '예술체육학') {
		
				$('.subtitle').text('Arts and Kinesiology');
			} else if (boardtype == '복합학') {
		
				$('.subtitle').text('Science and Technology Studies');
		
			}
				

	
})