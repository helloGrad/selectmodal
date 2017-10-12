
var results;
var availableTags=new Array();
var resultSet = new Array();
var NoResultsMsg = "검색 결과 없음";
var index=0;
var checkList = [];

var clickDelete=function(id){

	delete checkList[checkList.indexOf($("#"+id+" span").text())];
	$("#"+id).remove();
}

var fetchListByStudy=function(researchNames){
	availableTags=null;
	availableTags=new Array();
	$.ajax({
		url : "/net/api/getResearchCode?researchNames="+researchNames,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			for(var i=0;i<response.data.length;i++){
				resultSet = response.data;
				availableTags.push(resultSet[i]["cdNm"]);
			}
		},
		error : function(jqXHR, status, e) {
			console.error(status + " : " + e);
		}
	});
	
};

var findNo=function(name){
	for(var i=0;i<availableTags.length;i++){
		if(availableTags[i]===name){
			return i;
		}
	}
}

function addScrollEvent(){
	
	$.extend($.ui.autocomplete.prototype, {
	    _renderMenu: function (ul, items) {
	        $(ul).unbind("scroll");
	        var self = this;
	        self._scrollMenu(ul, items);
	    },

	    _scrollMenu: function (ul, items) {
	        var self = this;
	        var maxShow = 5;
	        var results = [];
	        var pages = Math.ceil(items.length / maxShow);
	        var ids;
	        results = items.slice(0, maxShow);

	        
	        if (pages > 1) {
	            $(ul).scroll(function () {
	                if (isScrollbarBottom($(ul))) {
	                    ++window.pageIndex;
	                    if (window.pageIndex >= pages) return;

	                    results = items.slice(window.pageIndex * maxShow, window.pageIndex * maxShow + maxShow);

	                    $.each(results, function (index, item) {
	                    	ids = $('#'+$(ul).attr('id')+' li:last-child div').attr('id').replace('ui-id-','');
	                    	ids = parseInt(ids) + 1
	                    	
	                        self._renderItemData(ul, item);
	                    	$('#'+$(ul).attr('id')+' li:last-child div').attr('id','ui-id-'+ids);
	                        
	                        
	                    });
	                    $('#' + $(ul).attr('id') + " li").addClass('ui-menu-item');
	                    $( ul ).find( "li div" ).addClass( "ui-menu-item-wrapper" );
	                    
	                    if (typeof(self.menu.deactivate) == "function")
	                    	self.menu.deactivate();
	                    
	                    self.menu.refresh();
	                    ul.show();
	                    self._resizeMenu();
	                    ul.position($.extend({
	                        of: self.element
	                    }, self.options.position));
	                    if (self.options.autoFocus) {
	                        self.menu.next(new $.Event("mouseover"));
	                    }
	                }
	            });
	        }

	        $.each(results, function (index, item) {

	        	$(item).addClass("ui-menu-item");
	            self._renderItemData(ul, item);
	        });
	    }
	});
	
}

function isScrollbarBottom(container) {
     var height = container.outerHeight();
     var scrollHeight = container[0].scrollHeight;
     var scrollTop = container.scrollTop();
     
     if (scrollTop >= scrollHeight - height) {
         return true;
     }
     
     return false;
 };
 
function autoComplete(){
	addScrollEvent();
	
    $("#tags").autocomplete({
    	source: function(request, response) {
    		$("#duplicateMsg").css("display","none");
    		
            results = $.ui.autocomplete.filter(availableTags, request.term);
            if (!results.length) {
                results = [NoResultsMsg];
            }
            response(results);
            
        },
        select:function(event, ui, request, response){
        	if(checkDuplicate(ui.item.label)){
        		$("#duplicateMsg").css("display","block");
        		$("#tags").select();
        		return;
        	}
        	
        	if(ui.item.label===NoResultsMsg){
        		event.preventDefault();
        		return;
        	}else{
        		
        		var name = ui.item.label
        		$("#duplicateMsg").css("display","none");
        		
        		if($($('#researchList div')[0]).text()==='미설정'){
					$('#researchList').empty();
				}
        		$("#researchList").append("<div>"+name+"<button type='button' class='btn delete' style='visibility: visible' value='"+name+"'>X</button></div>");
        		addNames('research', name)
        		return;
        	}
        },
        minLength: 0,
        delay: 0
    }).focus(function () {
        window.pageIndex = 0;
        $(this).autocomplete("search");
    });
    
    $( "#tags" ).click(function() {
    	$("#tags").val("");
		$("#tags").autocomplete("search");
    });
	
};
