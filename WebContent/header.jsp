<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" xmlns:fb="http://ogp.me/ns/fb#">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="facebook-domain-verification" content="7xuz8xz5veobpdow4whjqvg5w01q8y" /> 
<link href="/project/css/main.css?2021" type="text/css" rel="stylesheet" />
<link href="/project/css/nanumgothic.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="/project/images/common/favicon.ico" />
<script src="/project/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/project/js/default.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript" src="/project/js/common.js"></script>
<script src="/project/js/jquery.easing.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/project/js/bgpos.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	var event_obj =[{ename:"theater",txt01:133, txt02:278, btn:360},
	                     {ename:"mapleF",txt01:null, txt02:null, btn:420},
	                     {ename:"eatzD",txt01:80, txt02:80, btn:400},	                    
						 {ename:"sweetW",txt01:0, txt02:0, btn:435},				
						 {ename:"leatz",txt01:110, txt02:235, btn:370},
						 {ename:"mainCoffee",txt01:120, txt02:null, btn:376},
						 {ename:"groupSale",txt01:135, txt02:206, btn:330}
	]
</script>
<script src="/project/js/main.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/main/main_facebook.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$.ajax({
		url : "/main/ASPTwitter.asp",
		type : "get",
		dataType : "json",
		success : function(data){
			try{					
				var str = '';
				var idxt = 0;
				str += "<ul class='social_bask'>"
				$.each(data, function($i, $ret){
						str += '<li class="clfix">';						
					str += '<div>';
					str += '<strong>'+$ret.user.name+'</strong>&nbsp;<span>@KrispyKremeKr</span>';
					str += '<p><a href="https://twitter.com/'+$ret.user.screen_name+'/status/'+$ret.id_str+'" target="_blank" title="새창열기">'+$ret.text+'</a></p>';
					str += '</div>';
						str += '</li>';
					idxt++;
					if(idxt == 10) return false;
				});
				str += "</ul>"
			}catch(e){
			}
		},
		error:function(xhr,error,code) {
			if(error=='parsererror') {
				var json = eval(xhr.responseText);
			}else {
			}
		}
	});
	var mCoupon = new small_banner_controller();
	mCoupon.init(".mcoupon_list");
});


</script>

</head>
<body>

<!-- s:header include area -->
<h1 class="hide_text">크리스피 크림 도넛</h1>

<ul class="skipnav">
	<li><a href="#content">본문으로 바로가기</a></li>
</ul>

<h2 class="hide_text">주메뉴 영역</h2>
<div id="header">
	<div class="header_content clfix">
		
		<a href="/project/main.jsp" class="logo"><img src="/project/images/common/logo.png" alt="Krispy Kreme Doughnuts - Make Today Special" /></a>

		<div class="menu_area clfix">
			<div class="util_menu_wrap">
				<ul class="util_menu clfix">
					<% if(session.getAttribute("name") == null){ %>
						<li><a href="/project/member/login.jsp">로그인</a></li>
						<li><a href="/project/member/register_agree1.jsp">회원가입</a></li>
					<%}else{ %>
						<li><a href="/project/member/logout.jsp">로그아웃</a></li>
						<li><a href="/project/member/modify.jsp?mode=pwAuth">마이페이지</a></li>
					<%} %>
					<li><a href="/project/customer/list.jsp">고객의소리</a></li>
					<li><a href="#">윤리경영</a></li>
					<li><a href="#">사이트맵</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>

			<ul class="gnb_menu clfix">
				<!-- s:GNB배경영역 -->
				<li class="sub_background">
					<div class="gsm_bg">
						<div class="gsm_bg_inner">
							<div class="gsm_bg_content clfix">
								<div class="gsm_bg_visual">
									<img src="/project/images/common/gnb_sub_menu_visual_202109.png" alt="" />
								</div>
							</div>
						</div>
					</div>
				</li>
				<!-- e:GNB배경영역 -->
				<li class="gm"><a href="#" class="gm_link gnb_link01">MENU</a>
					<div class="gnb_sub_menu">
						<div class="gnb_sub_menu_inner">
							<div class="gsm_list gsm_list01">
								<ul class="gsm_sub_list">
									<li><a href="#">신제품/인기제품</a></li>
									<li><a href="#">이달의 메뉴</a></li>
									<li><a href="#">도넛</a></li>
									<li><a href="#">커피/음료</a></li>
									<li><a href="#">아이스크림/프로즌</a></li>
									<li><a href="#">브랜딩 제품소개</a></li>
								</ul>
							</div>
						</div>
					</div>
				</li>
				<li class="gm"><a href="#" class="gm_link gnb_link02">STORE</a>
					<div class="gnb_sub_menu">
						<div class="gnb_sub_menu_inner">
							<div class="gsm_list gsm_list02">
								<ul class="gsm_sub_list">
									<li><a href="#">매장찾기</a></li>
								</ul>
							</div>
						</div>
					</div>
				</li>
				<li class="gm"><a href="#" class="gm_link gnb_link08">HOME SERVICE</a>
					<div class="gnb_sub_menu">
						<div class="gnb_sub_menu_inner">
							<div class="gsm_list gsm_list08">
								<ul class="gsm_sub_list">
									<li><a href="#">홈서비스</a></li>
								</ul>
							</div>
						</div>
					</div>
				</li>
				<li class="gm"><a href="#" class="gm_link gnb_link03">EVENT</a>
					<div class="gnb_sub_menu">
						<div class="gnb_sub_menu_inner">
							<div class="gsm_list gsm_list03">
								<ul class="gsm_sub_list">
									<li><a href="#">진행 이벤트</a></li>
									<li><a href="#">종료 이벤트</a></li>
									<li><a href="#">당첨자 발표</a></li>
									<li><a href="#">제휴 서비스</a></li>
								</ul>
							</div>
						</div>
					</div>
				</li>
			
				<li class="gm"><a href="#" class="gm_link gnb_link05">BRAND</a>
					<div class="gnb_sub_menu">
						<div class="gnb_sub_menu_inner">
							<div class="gsm_list gsm_list05">
								<ul class="gsm_sub_list">
									<li><a href="#">도넛극장</a></li>
									<li><a href="#">브랜드스토리</a></li>
									<li><a href="#">브랜드영상</a></li>
									<li><a href="#">상품권 구입안내</a></li>
									<li><a href="#">공지사항</a></li>
								</ul>
							</div>
						</div>
					</div>
				</li>
		
				<li class="gm last_child"><a href="#" class="gm_link gnb_link07">SURVEY</a>
					<div class="gnb_sub_menu">
						<div class="gnb_sub_menu_inner">
							<div class="gsm_list gsm_list07">
								<ul class="gsm_sub_list">
									<li><a href="#">설문조사</a></li>
								</ul>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

</div>
