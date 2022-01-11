
var br_first = true;

/* 애니메이션용 png Filter */
function addPngFilter(a_obj){   
    $(a_obj).children('img').attr('style' , "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='crop',src='" + $(a_obj).children('img').attr('src') + "')");
};

function event_act(t){
	var bg = ".vis00_" + event_obj[t].ename;
	var txt01 = "#ani_" + event_obj[t].ename + "_01";
	var txt02 = "#ani_" + event_obj[t].ename + "_02";
	var btn = "#ani_" + event_obj[t].ename + "_btn";

	function start_ani(){
		$(bg).stop().animate({"opacity":"1"},1600,"easeInCubic");
		if(event_obj[t].txt02==null){
			$(txt01).stop().animate({"opacity":"0","top":event_obj[t].txt01+50},1800,function(){
				$(txt01).stop().animate({"opacity":"1","top":event_obj[t].txt01},600,"easeOutBack");
			});
			$(btn).stop().animate({"opacity":"0","top":event_obj[t].btn+50},2400,function(){
				$(btn).stop().animate({"opacity":"1","top":event_obj[t].btn},650,"easeOutBack");
			});				
		}else{
			$(txt01).stop().animate({"opacity":"0","top":event_obj[t].txt01+50},1800,function(){
				$(txt01).stop().animate({"opacity":"1","top":event_obj[t].txt01},600,"easeOutBack");
			});
			$(txt02).stop().animate({"opacity":"0","top":event_obj[t].txt02+50},2200,function(){
				$(txt02).stop().animate({"opacity":"1","top":event_obj[t].txt02},650,"easeOutBack");
			});
			$(btn).stop().animate({"opacity":"0","top":event_obj[t].btn+50},2800,function(){
				$(btn).stop().animate({"opacity":"1","top":event_obj[t].btn},700,"easeOutBack");
			});			
		}
	}
	function stop_ani(){
		$(txt01).stop().css({"opacity":"0"})
		$(txt02).stop().css({"opacity":"0"})
		$(btn).stop().css({"opacity":"0"})
	}	
	return {
		start_ani:start_ani,
		stop_ani:stop_ani
	};
}

/* 5번째 비주얼 */
var main_ani01 = function(){ 
	
	function  start_ani(){		
		$(".vis01").stop().css("opacity","1").animate({"background-position-y":"0px"},20000,"easeOutQuad");
		$("#ani_vis01_01").stop().delay(2400).animate({"opacity":"1","top":46},900,"easeOutSine");
		//$("#ani_vis01_02").stop().delay(2600).animate({"opacity":"1"},600,"easeInCubic");
	};
	
	function  stop_ani(){
		$(".vis01").stop().css({"background-position-y":"-166px"});
		$("#ani_vis01_01").stop().css({"opacity":"0","top":"166px"});
		//$("#ani_vis01_02").stop().css({"opacity":"0"});
	};
	
	return {
		start_ani:start_ani,
		stop_ani:stop_ani
	};
};

/* 6번째 비주얼 */
var main_ani02 = function(){			
	function  start_ani(){

		$("#vis2_logo").stop().animate({"opacity":"1"},400,"easeInCubic");
		$("#vis2_logo").delay(400).animate({"top":"365px"},500,"easeInCubic");
		$("#vis2_prd").stop().delay(1000).animate({"top":"49px","opacity":"1"},500,"easeOutSine");
							
		$("#vis2_txt01").stop().delay(1300).animate({"opacity":"1","left":"15px"},700,"easeOutCubic");
		$("#vis2_line01").stop().delay(1900).animate({"opacity":"1"},500,"easeOutCubic");
		$("#vis2_btn01").stop().delay(1900).animate({"opacity":"1"},500,"easeInCubic");
		
		$("#vis2_txt02").stop().delay(1600).animate({"opacity":"1","left":"777px"},700,"easeOutCubic");
		$("#vis2_line02").stop().delay(2100).animate({"opacity":"1"},500,"easeOutCubic");
		$("#vis2_btn02").stop().delay(2200).animate({"opacity":"1"},500,"easeInCubic");
			
	};
	
	function  stop_ani(){		
		$("#vis2_logo").stop().css({"opacity":"0","top":"97px"});
		$("#vis2_btn01,#vis2_btn02").stop().css({"opacity":"0"});		
		$("#vis2_txt01").stop().css({"opacity":"0","left":"80px"});
		$("#vis2_txt02").stop().css({"opacity":"0","left":"700px"});
		$("#vis2_prd").stop().css({"top":"69px","opacity":"0"});
		$("#vis2_line01").stop().css({"opacity":"0"});
		$("#vis2_line02").stop().css({"opacity":"0"});
	};
	
	return {
		start_ani:start_ani,
		stop_ani:stop_ani
	};
};

/* 브랜드 스토리 - 1 첫번째 비주얼 */
var main_ani03 = function(){			
	function  start_ani(){

		$("#vs_br_01_ani01").stop().animate({"opacity":"1"},400,"easeInCubic",function(){		
			$("#vs_br_01_ani01").stop().animate({"opacity":"0"},200,"easeInCubic",function(){
				$("#vs_br_01_ani01").stop().animate({"opacity":"1"},100,"easeInCubic",function(){
					$("#vs_br_01_ani01").stop().animate({"opacity":".3"},200,function(){
						$("#vs_br_01_ani01").stop().animate({"opacity":".7"},100,"easeInCubic");
						$("#vs_br_01_ani02").stop().animate({"opacity":".7"},100,"easeInCubic",function(){
							$("#vs_br_01_ani01").stop().animate({"opacity":"0.1"},100,"easeInQuint");
							$("#vs_br_01_ani02").stop().animate({"opacity":"0.1"},100,"easeInQuint",function(){
								$("#vs_br_01_ani01").stop().animate({"opacity":"1"},100,"easeOutQuint");
								$("#vs_br_01_ani02").stop().animate({"opacity":"1"},100,"easeOutQuint",function(){
									$("#vs_br_01_ani01").stop().animate({"opacity":".1"},100,"easeOutQuint");
									$("#vs_br_01_ani02").stop().animate({"opacity":".1"},100,"easeOutQuint",function(){
										$("#vs_br_01_ani01").stop().animate({"opacity":"1"},300,"easeOutQuint");
										$("#vs_br_01_ani02").stop().animate({"opacity":"1"},300,"easeOutQuint",function(){
											$("#vs_br_01_txt01").stop().animate({"opacity":"1","top":187},600,"easeOutCubic",function(){
												$("#vs_br_01_txt02").stop().animate({"opacity":"1"}, 300,function(){
													$("#vs_br_01_txt03").show().stop().animate({"opacity":"1"}, 500,"easeOutCubic");
													$("#vs_br_01_txt04").show().stop().animate({"opacity":"1"}, 500,"easeOutCubic");
												});																								
											});											
										});										
									});									
								});								
							});							
						});
					});								
				});			
			});			
		});					
	};
	
		
	function  stop_ani(){		
		$("#vs_br_01_ani01,#vs_br_01_ani02").stop().css({"opacity":"0"});
				
		$("#vs_br_01_txt01,#vs_br_01_txt02,#vs_br_01_txt03,#vs_br_01_txt04").stop().css({"opacity":"0"});
		$("#vs_br_01_txt01").css("top","251px");
		$("#vs_br_01_txt03").stop().hide();
		$("#vs_br_01_txt04").stop().hide();
		
		
	};
	
	return {
		start_ani:start_ani,
		stop_ani:stop_ani
	};
};

/* 브랜드 스토리 - 2 두번째 비주얼 */
var main_ani04 = function(){			
	function  start_ani(){
		$("#vs_br_02_txt01").stop().animate({"background":"0 0"},400,function(){
			$("#vs_br_02_txt01").stop().animate({"opacity":"1","top":"114px"},600,function(){
				$("#vs_br_02_txt02").stop().animate({"opacity":"1"},500,function(){
					$("#vs_br_02_txt03").show().stop().animate({"opacity":"1"},400);				
				});				
			});			
		});
	}
	
	function  stop_ani(){				
				
		$("#vs_br_02_txt01,#vs_br_02_txt02,#vs_br_02_txt03").stop().css({"opacity":"0"});
		$("#vs_br_02_txt01").css({"top":"171px"});
		$("#vs_br_02_txt03").stop().hide();
	};
	
	return {
		start_ani:start_ani,
		stop_ani:stop_ani
	};
};

var main_ani05 = function(){			
	
	function  start_ani(){
		$("#vs_br_03_txt03").css({"opacity":"0"});
		$("#vs_br_03_txt01").stop().animate({"background":"0 0"},400,function(){
			$("#vs_br_03_txt01").stop().animate({"opacity":"1","top":"164px"},600,function(){
				$("#vs_br_03_txt02").stop().animate({"opacity":"1"},500,function(){
					$("#vs_br_03_txt03").show().stop().animate({"opacity":"1"},400);				
				});				
			});			
		});
	};
		
	function  stop_ani(){			
				
		$("#vs_br_03_txt01, #vs_br_03_txt02, #vs_br_03_txt03").stop().css({"opacity":"0"});
		$("#vs_br_03_txt01").css({"top":"221px"});
		$("#vs_br_03_txt03").stop().hide();
		
	};
	
	return {
		start_ani:start_ani,
		stop_ani:stop_ani
	};
};

function clsAct(){
	for(var i=0; i < 	event_obj.length; i++ ){
		event_act(i).stop_ani();
	}
	main_ani01().stop_ani(); 
	main_ani02().stop_ani(); 
}

var m_visual_controller = function (){
	var isRoll = false;
	var overisRoll = true;
	var m_obj;
	var ctrl_btn;
	var ctrl_li;
	var total_num;
	var bnr_timer;
	var roll_num =0;
	var pause_stop_btn;
	var roll_time = 7 * 1000;
		
	function init(obj){
		m_obj = $(obj);	
		setObj();				
	};
	
	function setObj(){
		ctrl_li = m_obj.find(".visual_sec > li");
		ctrl_li.find(">div").css({"opacity":"0"});
		ctrl_li.find(">div").eq(0).css({"opacity":"1"});
		ctrl_btn  = m_obj.find(".visual_sec > li >a");
		pause_stop_btn = m_obj.find(".vis_stoper > li >a");
		total_num  = ctrl_li.length;	
		bindEvent();
		
	};
	
	function bindEvent(){
		event_act(0).stop_ani(); //시작하는 
		
		ctrl_btn.on("click",function(e){
			e.preventDefault();
			if( $(this).closest("li").hasClass("on") ){				
				return;
			}else{
				var ctrl_num  = $(this).closest("li").index();
				ctrl_li.removeClass("on");
				ctrl_li.find(">div").css({"opacity":"0"});
				ctrl_li.eq(ctrl_num).addClass("on")
				ctrl_li.eq(ctrl_num).find(">div").animate({"opacity":1},300);
				roll_num  = ctrl_num;
				var event_length =	event_obj.length;
				
				clsAct();
				if(ctrl_num > event_length-1){
					if(ctrl_num == event_length){
						main_ani01().start_ani();
					}else{
						main_ani02().start_ani();
					}
				}else{
					event_act(ctrl_num).start_ani();				
				}
			};						
		}).on("mouseover focus",function(){
			if( overisRoll == true ){
				
				stop_timer();
			}
			
		}).on("mouseout blur",function(){
			
			if( overisRoll == true ){
				
				start_timer();				
			}
		});
		
		pause_stop_btn.on("click",function(e){
			e.preventDefault();
			var ctrl_num  = $(this).closest("li").index();
						
			if( ctrl_num == 0){
				stop_timer();
				overisRoll = false;
				var ch_img0_obj = pause_stop_btn.eq(0).find("img");
				var ch_img1_obj = pause_stop_btn.eq(1).find("img");
				var ch_img0 = pause_stop_btn.eq(0).find("img").attr("src");
				var ch_img1 = pause_stop_btn.eq(1).find("img").attr("src");
								
				ch_img0_obj.attr("src",ch_img0.replace("_stop.png","_stop_on.png"));
				ch_img1_obj.attr( "src",ch_img1.replace( "_play_on.png", "_play.png" ));
			}else{						
				start_timer();				
				overisRoll = true;
				var ch_img0_obj = pause_stop_btn.eq(0).find("img");
				var ch_img1_obj = pause_stop_btn.eq(1).find("img");
				var ch_img0 = pause_stop_btn.eq(0).find("img").attr("src") ;
				var ch_img1 = pause_stop_btn.eq(1).find("img").attr("src") ;
											
				ch_img0_obj.attr("src",ch_img0.replace("_stop_on.png","_stop.png") );
				ch_img1_obj.attr("src",ch_img1.replace("_play.png","_play_on.png") );
			};					
		});
		
	};
									
	function start_timer(){
		
		
		if(isRoll == false){
			isRoll = true;
			bnr_timer = setInterval( bnr_roll ,roll_time );
			
		}							
	};
	
	function stop_timer(){		
		isRoll = false;
		clearInterval( bnr_timer );
		bnr_timer = null;
				
	}							
	
	function bnr_roll(){
		 roll_num++;
		 if(total_num == roll_num ){					 
			 roll_num = 0;
		 }				 
		 ctrl_btn.eq( roll_num ).trigger("click");				
	}
	
	return{ init:init,
				start_timer:start_timer,
				stop_timer:stop_timer };
	
};


var br_story_ani = function(){
	
	var obj_bs;
	var br_time= 8000;
	var br_timer;
	
	function init(){		
		obj_bs = $("#go_story > img");		
		
	};
	
	function start_ani(){
		
		$(obj_bs).stop().animate({"top":-20},850,"easeOutBounce",function(){
			
			$(obj_bs).stop().animate({"opacity":"1"},2200,function(){
								
				$(obj_bs).stop().animate({"top":-60},800);
			});
		});			
	};
	
	function start_timer(){		
		
		br_timer = setInterval(start_ani , br_time);
	};
	
	function stop_ani(){
		obj_bs.stop().animate({"top":-60},30);			
	};
	
	function stop_timer(){	
		clearInterval( br_timer );
		br_timer = null;
	};
	
	return{
		init:init,
		start_timer:start_timer,
		stop_timer:stop_timer
		
	};
};

var m_br_controller = function (){
	
	var isRoll = false;
	var overisRoll = true;
	var m_obj;
	var ctrl_btn;
	var ctrl_li;
	var total_num;
	var bnr_timer;
	var roll_num =0;
	var pause_stop_btn;
	var roll_time = 7 *1000;
	
	function init(obj){
		m_obj = $(obj);			
		setObj();				
	};
	
	function setObj(){
		ctrl_li = m_obj.find(".visual_sec > li");
		ctrl_li.find(">div").css({"opacity":"0"});
		ctrl_li.find(">div").eq(0).css({"opacity":"1"});
		ctrl_btn  = m_obj.find(".visual_sec > li >a");
		pause_stop_btn = m_obj.find(".vis_stoper > li >a");
		total_num  = ctrl_li.length;			
		bindEvent();
	};
	
	function bindEvent(){
		
		ctrl_btn.on("click",function(e){
			e.preventDefault();
			if( $(this).closest("li").hasClass("on") ){
				
				return;
			}else{
				var ctrl_num  = $(this).closest("li").index();
				ctrl_li.removeClass("on");
				ctrl_li.find(">div").css({"opacity":"0"});
				ctrl_li.eq(ctrl_num).addClass("on");
				ctrl_li.eq(ctrl_num).find(">div").animate({"opacity":1},300);
				roll_num = ctrl_num;
				
				if(ctrl_num == 0){			
					main_ani04().stop_ani();
					main_ani05().stop_ani();
					main_ani03().stop_ani();
					main_ani03().start_ani();					
					
				}else if(ctrl_num == 1){
					main_ani03().stop_ani();
					main_ani05().stop_ani();
					main_ani04().stop_ani();
					main_ani04().start_ani();
					
				}else if(ctrl_num == 2){					
					main_ani03().stop_ani();
					main_ani04().stop_ani();
					main_ani05().stop_ani();
					main_ani05().start_ani();
				}
					
				
			};					
		}).on("mouseover focus",function(){
			if( overisRoll == true ){
				
				stop_timer();
			}
			
		}).on("mouseout blur",function(){
			
			if( overisRoll == true ){				
				start_timer();				
			}
		});
		
		pause_stop_btn.on("click",function(e){
			e.preventDefault();
			var ctrl_num  = $(this).closest("li").index();
						
			if( ctrl_num == 0){
				stop_timer();
				overisRoll = false; 
				var ch_img0_obj = pause_stop_btn.eq(0).find("img");
				var ch_img1_obj = pause_stop_btn.eq(1).find("img");
				var ch_img0 = pause_stop_btn.eq(0).find("img").attr("src");
				var ch_img1 = pause_stop_btn.eq(1).find("img").attr("src");
								
				ch_img0_obj.attr("src",ch_img0.replace("_stop.png","_stop_on.png"));
				ch_img1_obj.attr( "src",ch_img1.replace( "_play_on.png", "_play.png" ));
			}else{						
				start_timer();
				overisRoll = true; 
				var ch_img0_obj = pause_stop_btn.eq(0).find("img");
				var ch_img1_obj = pause_stop_btn.eq(1).find("img");
				var ch_img0 = pause_stop_btn.eq(0).find("img").attr("src") ;
				var ch_img1 = pause_stop_btn.eq(1).find("img").attr("src") ;
											
				ch_img0_obj.attr("src",ch_img0.replace("_stop_on.png","_stop.png") );
				ch_img1_obj.attr("src",ch_img1.replace("_play.png","_play_on.png") );
			};					
		});				
	};
									
	function start_timer(){
				
		if(isRoll == false){
			isRoll = true;
			bnr_timer = setInterval( bnr_roll ,roll_time );
			
		};							
	};
	
	function stop_timer(){
		isRoll  = false;
		clearInterval( bnr_timer );
		bnr_timer = null;		
		
	};							
	
	function bnr_roll(){
		 roll_num++;		 
		 if(total_num == roll_num ){					 
			 roll_num = 0;
		 }				 
		 ctrl_btn.eq( roll_num ).trigger("click");				
	}
	
	return{ init:init,
				start_timer:start_timer,
				stop_timer:stop_timer };
	
};

	
	
$(function(){
	var navi_ver = navigator.userAgent.toLowerCase();
	/*2013 09 30 수정*/
	if(navi_ver.indexOf("msie") != -1) {
		addPngFilter("#ani_vis01_01");
		addPngFilter("#ani_vis01_02");
		
		addPngFilter("#ani_vis00_02");
		addPngFilter("#vis00_btn01 > a");
		
		addPngFilter("#ani_vis02_01");
		addPngFilter("#ani_vis02_02");
		/*addPngFilter("#ani_vis000_03");
		addPngFilter("#ani_vis000_04");
		addPngFilter("#ani_vis000_05");
		addPngFilter("#ani_vis000_05");*/
		addPngFilter("#vis02_btn01 > a"); 
		
		addPngFilter("#vis2_logo");
		addPngFilter("#vis2_txt01");
		addPngFilter("#vis2_txt02");
		addPngFilter("#vis2_prd");
		addPngFilter("#vis2_line01");
		addPngFilter("#vis2_line02");
		addPngFilter("#vis2_btn01 > a");
		addPngFilter("#vis2_btn02 > a");

		addPngFilter("#vs_br_01_txt01");
		addPngFilter("#vs_br_01_txt02");
		
		addPngFilter("#vs_br_01_txt03 > a");
		addPngFilter("#vs_br_01_txt04 > a");
		
		addPngFilter("#vs_br_02_txt01");
		addPngFilter("#vs_br_02_txt02");
		addPngFilter("#vs_br_02_txt03 > a");
		
		addPngFilter("#vs_br_03_txt01");
		addPngFilter("#vs_br_03_txt02");
		addPngFilter("#vs_br_03_txt03 > a");						
				
	};
	/*2013 09 30 수정*/
	
	$('.vis_controller.br_story').css({"opacity":"0"}).hide();
	var m_visual0  = new m_visual_controller();
	var m_visual1  = new m_br_controller();
	var br_story = new br_story_ani();
	m_visual0.init(".origin");
	clsAct();

	event_act(0).start_ani(); //시작하는

	m_visual1.init(".br_story");
								
	m_visual0.start_timer();
	
	br_story.init();
	br_story.start_timer();
	
	$('.go_story').bind('click',function(e){
		
		
		e.preventDefault();		
		br_story.stop_timer();
		
		m_visual0.stop_timer();
		m_visual1.start_timer();
		$(".br_story").show().stop().animate({"opacity":'1'},300);
		$('.origin').stop().css({"opacity":"0"}).hide();
		
		if( br_first ){
			main_ani03().start_ani();
			br_first = false;
		};
				
	});
	
	$('.close_story').bind('click',function(e){
		
		e.preventDefault();
		m_visual0.start_timer();
		m_visual1.stop_timer();
		
		br_story.start_timer();
		$('.br_story').stop().css({"opacity":"0"}).hide();
		$('.origin').show().stop().animate({"opacity":'1'},300,function(){
			
			$("#go_story").focus();
		});
	
	});
	
});	
		

var small_banner_controller = function(){
	
	var m_obj;
	var bnr_btns;
	var bnr_contents;
	var bnr_total;
	
	function init( obj ){				
		m_obj = $(obj);
		setObj();
		bindEvent();
		
	};
	
	function setObj(){
		bnr_btns  = m_obj.find( ".ban_cont" );				
		bnr_contents =  m_obj.find( ".clfix" );				
		bnr_total = bnr_btns.length;
		
		set_btn_pos();
	};
	
	function set_btn_pos(){
		bnr_btns.each(function(e){
			$(this).css({"right":16*(bnr_total-e-1)+ "px"});
			
		});
		
	};
	
	function bindEvent(){
		bnr_btns.on("click",function(e){
			e.preventDefault();
			var current_num = $(this).closest("li").index();
			contentController( current_num );
		
		});
		
	};
	
	function contentController( num ){
		m_obj.find("li").removeClass("on");
		m_obj.find("li").eq(num).addClass("on");
		
	};
	
	return {init:init};
		
};


$(document).ready(function(){
	
	var bnr01 = new small_banner_controller();
	var bnr02 = new small_banner_controller();
	var bnr03 = new small_banner_controller();
	
	bnr01.init(".banner_li01");
	bnr02.init(".banner_li02");
	bnr03.init(".banner_li03");
	
	var btn_left = ($("#main .visual_sec > li").length-1) * 24;
	$(".vis_stoper").css("margin-left", btn_left-44);
	$("#main .visual_sec").css("margin-left", -btn_left);
});

