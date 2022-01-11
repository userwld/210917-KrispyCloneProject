

var LNB = function(){	
	var mouseoutTimer = null;
	var activeMenu1 = -1;
	var activeMenu2 = -1;
	
	function init(){
		activeMenu1 = -1;
		activeMenu2 = -1;
		
		$(".snb_list>li").each(function(idx, obj){
			if($(this).hasClass("on")){
				activeMenu1 = idx;
				
				if($(this).find(">ul").length > 0){
					$(this).find(">ul>li").each(function(i, o){
						if($(this).hasClass("on")){
							activeMenu2 = i;
						}
					});
				}
			}
		});
		
		addEvents();
	}
	
	function addEvents(){
		$(".snb_list>li").each(function(idx, obj){
			
			if($(obj).find(">ul").length > 0){						
				$(obj).find(">a").on("click", function(e){					
					e.preventDefault();
					$(".snb_list>li").removeClass("on");
					$(".snb_list>li>ul").hide();
					$(this).closest("li").addClass("on");
					$(this).closest("li").find(">ul").show();
				});
			}
		});
		
		$(".snb_list").find("a").on("mouseenter", function(e){
			clearTimeout(mouseoutTimer);
		}).on("focus", function(e){
			clearTimeout(mouseoutTimer);
		}).on("blur", function(e){
			$(".snb_list").triggerHandler("mouseleave");
		});
		
		$(".snb_list").on("mouseleave", function(e){
			mouseoutTimer = setTimeout(function(){
				$(".snb_list>li").removeClass("on").eq(activeMenu1).addClass("on");
				$(".snb_list>li").each(function(idx, obj){
					if(idx == activeMenu1){
						$(this).find(">ul").show();
					}else{
						$(this).find(">ul").hide();
					}
				});
				$(".snb_list>li").eq(activeMenu1).find(">ul>li").removeClass("on").eq(activeMenu2).addClass("on");
				
			}, 1000);
		});
		
	}

	return {
		init: init
	};
}


$(function(){
	
	// pwd find tab control	
	$('.tab_find_pwd li').on('click', function(){
		var btn_index = $('.tab_find_pwd li').index(this) + 1;
		
		$('.tab_find_pwd li').removeClass('on');
		$(this).addClass('on');
		//$('.tab_find_table').css({display:'none'});
		//$('#tabFindTable0' + btn_index).css({display:'block'}).focus();
	});
	
	// menu nutrient info view
	$('.nutrient_area .view_nutrient').on('click', function(e){
		e.preventDefault();
		$('.nutrient_info').css({display:'block'});
	});
	$('.nutrient_area .nutrient_close').on('click', function(e){
		e.preventDefault();
		$('.nutrient_info').css({display:'none'});
	});
	
});


var GNB = function(){
	var timer = null;
	
	function init(){
		$(".gnb_sub_menu").css({"opacity":0});
		$(".gsm_bg").css({"opacity":0});
		addEvents();
	}
	
	function addEvents(){
		$(".gnb_menu>li>a").on("mouseenter focus", function(e){
						
			$(".gnb_sub_menu").show().stop().animate({"opacity":1},300)
			$(".gsm_bg").show().stop().animate({"opacity":1},300)
			destroyTimer();
		}).on("mouseleave blur", function(e){
			createTimer();
		});
		
		$(".gnb_sub_menu").on("mouseenter", function(e){
			e.preventDefault();
			
			destroyTimer();
		}).on("mouseleave", function(e){
			createTimer();
			/*$(".gnb_sub_menu").stop().animate({"opacity":0},400,function(){
				$(".gnb_sub_menu").hide();			
			});
			
			$(".gsm_bg").stop().animate({"opacity":0},400,function(){
				$(".gsm_bg").hide();			
			});
	 		*/			
		});
		
		$(".gnb_sub_menu a").on("focus", function(e){
			destroyTimer();
		}).on("blur", function(e){
			createTimer();
		});
	}
	
	function createTimer(){
		timer = setTimeout(function(){
			$(".gnb_sub_menu").stop().animate({"opacity":0},200,function(){
				$(".gnb_sub_menu").hide();			
			});
			$(".gsm_bg").stop().animate({"opacity":0},200,function(){
				$(".gsm_bg").hide();			
			});
		}, 300);
	}
	
	function destroyTimer(){
		clearTimeout(timer);
	}
	
	return {
		init: init
	};
};

var LNB = function(){
	var mouseoutTimer = null;
	var activeMenu1 = -1;
	var activeMenu2 = -1;
	
	function init(){
		activeMenu1 = -1;
		activeMenu2 = -1;
		
		$(".snb_list>li").each(function(idx, obj){
			if($(this).hasClass("on")){
				activeMenu1 = idx;
				
				if($(this).find(">ul").length > 0){
					$(this).find(">ul>li").each(function(i, o){
						if($(this).hasClass("on")){
							activeMenu2 = i;
						}
					});
				}
			}
		});
		
		addEvents();
	}
	
	function addEvents(){
		$(".snb_list>li").each(function(idx, obj){
			if($(obj).find(">ul").length > 0){
				$(obj).find(">a").on("click", function(e){
					e.preventDefault();
					$(".snb_list>li").removeClass("on");
					$(".snb_list>li>ul").hide();
					$(this).closest("li").addClass("on");
					$(this).closest("li").find(">ul").show();
				});
			}
		});
		
		$(".snb_list").find("a").on("mouseenter", function(e){
			clearTimeout(mouseoutTimer);
		}).on("focus", function(e){
			clearTimeout(mouseoutTimer);
		}).on("blur", function(e){
			$(".snb_list").triggerHandler("mouseleave");
		});
		
		$(".snb_list").on("mouseleave", function(e){
			mouseoutTimer = setTimeout(function(){
				$(".snb_list>li").removeClass("on").eq(activeMenu1).addClass("on");
				$(".snb_list>li").each(function(idx, obj){
					if(idx == activeMenu1){
						$(this).find(">ul").show();
					}else{
						$(this).find(">ul").hide();
					}
				});
				$(".snb_list>li").eq(activeMenu1).find(">ul>li").removeClass("on").eq(activeMenu2).addClass("on");
				
			}, 1000);
		});
		
		
	}
	
	return {
		init: init
	};
}



//placeholder
var textPlaceHolderInit = function(){

	var havePlaceholder = false;
	var input = document.createElement("input");
	havePlaceholder = ("placeholder" in input);
	
	if(!havePlaceholder){
		$("input[type=text], textarea").each(function(idx, obj){
			var _this = $(this);
			var placeholderAttr = "placeholder";
			
			var placeholderText = _this.attr(placeholderAttr);
			/*
			if(_this.val() == ""){
				_this.val(placeholderText);
			}
			*/
			
			_this.before("<span class=\"placeholder_guidetext\"></span>");
			var prevGuideText = _this.prev(".placeholder_guidetext");
			prevGuideText.css({position:"absolute"}).text(placeholderText);
			prevGuideText.hide();
			if(_this.val() == ""){
				prevGuideText.show();
			}

			prevGuideText.addClass("placeholder_text");

			_this.bind("mousedown focus", function(e){
				prevGuideText.hide();
			}).bind("blur", function(e){
				if($(this).val() == ""){
					prevGuideText.show();
				}
			});

			prevGuideText.bind("mousedown", function(e){
				$(this).hide();
				setTimeout(function(){
					_this.focus();
				}, 100);
			});
		});
	}
	
};
$(function(){textPlaceHolderInit();
	new GNB().init();
});


/* 레이어변환 */
function ch_layer(hidden1 ,hidden2 , show){ 
	var hl_1  = document.getElementById(hidden1);
	var hl_2  = document.getElementById(hidden2);
	var sl  = document.getElementById(show);
	
    if ( hl_1 != null )
    {
        //console.log('hl_1 have');
        hl_1.style.display = "none";
    }
    if ( hl_2 != null )
    {
        //console.log('hl_2 have');
        hl_2.style.display = "none";
    }
    if ( sl != null )
    {
        //console.log('sl have');
        sl.style.display = "";
    }
}


$(function(){
	// 회원 등급 레이어팝업
	$(".open_popup_grade").on("click", function(e){
		$(".popup_grade").show();
		return false;
	});
	$(".close_popup_grade").on("click", function(e){
		$(".popup_grade").hide();
		return false;
	});
});
