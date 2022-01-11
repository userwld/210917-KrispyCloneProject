<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<title>Project!</title>

<h2 class="hide_text">본문 영역</h2>

<div id="main">

	<!-- s:main_visual-->
	<div id="content" class="visual_content">
		<div class="vis_controller origin clfix">
			<ul class="vis_stoper num8 clfix">
				<li><a href="#"><img src="/project/images/main/img_mainvis_stop.png" alt="메인 롤링 일시 정지" /></a></li>
				<li class="last"><a href="#"><img src="/project/images/main/img_mainvis_play_on.png" alt="메인 롤링 시작" /></a></li>
			</ul>
			<ul class="visual_sec num8 clfix">
				<li class="on">
					<a href="#">KKD 도넛극장 보기</a>
					<div class="vis00_theater" style="background:#fff url('/project/images/main/bg_theater.jpg') no-repeat center 0;overflow:hidden;">
						<div class="vinner_con">
							<div class="ani_theater_01"  id="ani_theater_01" style="position: absolute;left:57px;top:133px;opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/theater_txt.png" alt=""  />
							</div>
							<div class="ani_theater_02"  id="ani_theater_02" style="position: absolute;left:63px;top:278px;opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/theater_txt1.png" alt=""  />
							</div>
							<div class="ani_theater_btn"  id="ani_theater_btn" style="position: absolute;left:157px;top:360px;opacity:0;filter:alpha(opacity=0)">
								<a href="#"><img src="/project/images/main/btn_famDay0824.png" alt="자세히 보기"  /></a>
							</div>
						</div>
					</div>				
				</li>
				<li>
					<a href="#">메이플 페스티벌 신제품 보기</a>
					<div class="vis00_mapleF" style="background:#fff url('/project/images/main/bg_mapleF.jpg') no-repeat center 0;overflow:hidden;">
						<div class="vinner_con">
							<div class="ani_mapleF_btn"  id="ani_mapleF_btn" style="position: absolute;left:50%;top:337px;transform: translateX(-50%);opacity:0;filter:alpha(opacity=0)">
								<a href="#"><img src="/project/images/main/btn_green_left.png" alt="자세히 보기"  /></a>
							</div>
							<ul class="sns_sec clfix">
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns01.png" alt="" /></a></li>
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns02.png" alt="" /></a></li>
							</ul>
						</div>
					</div>				
				</li>
				<li>
					<a href="#">매월 5일, 15일, 25일! 오! 잇츠데이 모음</a>
					<div class="vis00_eatzD" style="background:#fff url('/project/images/main/eatz9_bg.jpg') no-repeat center 0;overflow:hidden;">
						<div class="vinner_con">
							<div class="ani_eatzD_01"  id="ani_eatzD_01" style="position: absolute;left:auto;right: 40px;top:278px;opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/eatz9_txt.png" alt=""  />
							</div>
							<div class="ani_eatzD_02"  id="ani_eatzD_02" style="position: absolute;left:0px;top:170px;opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/eatz9_txt2.png" alt=""  />
							</div>
							<div class="ani_eatzD_btn"  id="ani_eatzD_btn" style="position: absolute;left:158px;top:360px;opacity:0;filter:alpha(opacity=0)">
								<a href="#"><img src="/project/images/main/btn_famDay0824.png" alt="자세히 보기"  /></a>
							</div>
							<ul class="sns_sec clfix">
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns01.png" alt="" /></a></li>
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns02.png" alt="" /></a></li>
							</ul>
						</div>
					</div>				
				</li>
				<li>
					<a href="#">달달한 수요일 1+1 이벤트 보기</a>
					<div class="vis00_sweetW" style="background:#fff url('/project/images/main/bg_sweetW.png') no-repeat center 0;overflow:hidden;">
						<div class="vinner_con">
							<div class="ani_sweetW_01"  id="ani_sweetW_01" style="position: absolute;left:130px; top:0px; opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/sweetW_txt.png" alt=""  />
							</div>
							<div class="ani_sweetW_btn"  id="ani_sweetW_btn" style="position: absolute;left:160px; top:435px; opacity:0;filter:alpha(opacity=0)">
								<a href="#"><img src="/project/images/main/btn_green_left.png" alt="자세히 보기"  /></a>
							</div>
							<ul class="sns_sec clfix">
								<li><a href="#"><img src="/project/images/main/btn_main_sns01.png" alt="" /></a></li>
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns02.png" alt="" /></a></li>
							</ul>
						</div>
					</div>				
				</li>
				
				<li>
					<a href="#">LOTTE EATZ 보기</a>
					<div class="vis00_leatz" style="background:#fff url('/project/images/main/bg_leatz.png') no-repeat center 0;overflow:hidden;">
						<div class="vinner_con">
							<div class="ani_leatz_01"  id="ani_leatz_01" style="position: absolute;left:0px;top:110px;opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/leatz_txt.png" alt="5개 브랜드 모두 온라인으로 주문할 수 있는"  />
							</div>
							<div class="ani_leatz_02"  id="ani_leatz_02" style="position: absolute;left:0px;top:235px;opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/leatz_txt02.png" alt="LOTTE EATZ를 만나보세요!"  />
							</div>
							<div class="ani_leatz_btn"  id="ani_leatz_btn" style="position: absolute;left:0px;top:370px;opacity:0;filter:alpha(opacity=0)">
								<a href="#" ><img src="/project/images/main/btn_leatz.png" alt="자세히 주문 바로가기"  /></a>
							</div>
						</div>
					</div>
				</li>
				<li>
					<a href="#">KRISPY KREME COFFEE 보기</a>
					<div class="vis00_mainCoffee" style="background:#fff url('/project/images/main/bg_mainCoffee.jpg') no-repeat center 0;overflow:hidden;">
						<div class="vinner_con">
							<div class="ani_mainCoffee_01"  id="ani_mainCoffee_01" style="position: absolute;left:0px;top:120px;opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/mainCoffee_txt01.png" alt="KRISPY KREME COFFEE So Good"  />
							</div>
							<div class="ani_mainCoffee_btn"  id="ani_mainCoffee_btn" style="position: absolute;left:80px;top:376px;opacity:0;filter:alpha(opacity=0)">
								<a href="#"><img src="/project/images/main/btn_famDay0824.png" alt="자세히 보기"  /></a>
							</div>
							<ul class="sns_sec clfix">
								<li><a href="#"><img src="/project/images/main/btn_main_sns01.png" alt="" /></a></li>
								<li><a href="#"><img src="/project/images/main/btn_main_sns02.png" alt="" /></a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="#">크리스피 크림 단체주문 보기</a>
					<div class="vis00_groupSale" style="background:#fff url('/project/images/main/bg_groupSale2.jpg') no-repeat center 0;overflow:hidden;">
						<div class="vinner_con">
							<div class="ani_groupSale_01"  id="ani_groupSale_01" style="position: absolute;left:58px;top:135px;opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/groupSale2_txt01.png" alt="Share the love"  />
							</div>
							<div class="ani_groupSale_02"  id="ani_groupSale_02" style="position: absolute;left:9px;top:206px;opacity:0;filter:alpha(opacity=0)">
								<img src="/project/images/main/groupSale2_txt02.png" alt="단체주문 할인"  />
							</div>
							<div class="ani_groupSale_btn"  id="ani_groupSale_btn" style="position: absolute;left:140px;top:330px;opacity:0;filter:alpha(opacity=0)">
								<a href="#"><img src="/project/images/main/btn_detail_160926.png" alt="자세히 보기"  /></a>
							</div>
							<ul class="sns_sec clfix">
								<li><a href="#"><img src="/project/images/main/btn_main_sns01.png" alt="" /></a></li>
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns02.png" alt="" /></a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="#">크리스피 크림 도넛 보기</a>
					<div class="vis01">
						<div class="vinner_con">
							<div class="ani_vis01_01"  id="ani_vis01_01">
								<img src="/project/images/main/img_intro01_01.png" alt="Krispy Kreme DOUGHNUTS®"  />
							</div>
						
							<ul class="sns_sec clfix">
								<li><a href="#"><img src="/project/images/main/btn_main_sns01.png" alt="크리스피 크림 도넛 facebook 공유" /></a></li>
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns02.png" alt="크리스피 크림 도넛 twiiter 공유" /></a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="#">크리스피크림 커피&amp;음료 보기</a>
					<div class="vis02">
						<div class="vinner_con">
							<div  id="vis2_logo">
								<img src="/project/images/main/img_intro02_01.png" alt="Krispy Kreme DOUGHNUTS®" />
							</div>
						 	<div id="vis2_txt01">
								<img src="/project/images/main/img_intro02_txt_01.png" alt="달콤한 도넛과 조화를 이루는 커피와 음료 맛을 느껴보세요"  />
							</div>
							<div  id="vis2_txt02">
								<img src="/project/images/main/img_intro02_txt_02.png" alt="다양한 크리스피크림 도넛의 세계로 초대합니다." />
							</div>
							<div id="vis2_prd">
								<img src="/project/images/main/vis_02_obj.png" alt=""  />
							</div>
							<div id="vis2_line01">
								<img src="/project/images/main/vis_02_ani_line01.png" alt="" />
							</div>
							<div id="vis2_line02">
								<img src="/project/images/main/vis_02_ani_line02.png" alt="" />
							</div>
							<div class="vis2_btn01" id="vis2_btn01">
								<a href="#" ><img src="/project/images/main/btn_vis01.png" alt="커피&amp;음료 바로가기" /></a>
							</div>
							<div class="vis2_btn02" id="vis2_btn02" >
								<a href="#" ><img src="/project/images/main/btn_vis02.png" alt="도넛 바로가기" /></a>
							</div>
							<ul class="sns_sec clfix">
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns01.png" alt="크리스피 도넛, 커피 facebook 공유" /></a></li>
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns02.png" alt="크리스피 도넛, 커피 twiiter 공유" /></a></li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
			<!-- s:20130821 수정 -->
			<a href="#" class="go_story" id="go_story"><img src="/project/images/main/btn_go_story.png" alt="브랜드 스토리 보기" /></a>
			<!-- e:20130821 수정 -->
		</div>

		<div class="vis_controller clfix br_story">
			<ul class="vis_stoper clfix">
				<li><a href="#"><img src="/project/images/main/img_mainvis_stop.png" alt="브랜드 스토리 롤링 일시 정지" /></a></li>
				<li class="last"><a href="#"><img src="/project/images/main/img_mainvis_play_on.png" alt="브랜드 스토리 롤링 시작" /></a></li>
			</ul>
			<ul class="visual_sec clfix">
				<li class="on">
					<a href="#">브랜드 스토리 첫번째 비주얼</a>
					<div class="brs01">
						<div class="vinner_con">
							<div  id="vs_br_01_txt01">
								<img src="/project/images/main/vis_br_01_txt1.png" alt="HOT NOW"/>
							</div>
							<div  id="vs_br_01_txt02">
								<img src="/project/images/main/vis_br_01_txt2.png" alt="네온사인이 켜지면 매장으로 달려가세요!" />
							</div>
							<div id="vs_br_01_ani01">
								<img src="/project/images/main/vs_br_01_ani0.jpg" alt="" />
							</div>
							<div id="vs_br_01_ani02">
								<img src="/project/images/main/vs_br_01_ani1.jpg" alt=""  />
							</div>
							<ul class="hotnow_btn clfix">
								<li>
									<span id="vs_br_01_txt03">
										<a href="#"><img src="/project/images/main/btn_hotlight.png" alt="HOT LIGHT HOUR" /></a>
									</span>
								</li>
								<li>
									<span  id="vs_br_01_txt04">
										<a href="#"><img src="/project/images/main/btn_store.png" alt="매장찾기" /></a>
									</span>
								</li>
							</ul>
							<ul class="sns_sec clfix">
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns01.png" alt="핫나우 facebook 공유" /></a></li>
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns02.png" alt="핫나우 twiiter 공유" /></a></li>
							</ul>
						</div>
					</div>
				</li>
				
				<li>
					<a href="#">브랜드 스토리 두번째 비주얼</a>
					<div class="brs02">
						<div class="vinner_con">
							<div  id="vs_br_02_txt01">
								<img src="/project/images/main/vis_br_02_txt1.png" alt="오리지널 글레이즈 도넛" />
							</div>
							<div  id="vs_br_02_txt02">
								<img src="/project/images/main/vis_br_02_txt2.png" alt="따뜻하고 달콤한 도넛이 나오고 있으니까요!"/>
							</div>
							<div class="donut_btn" id="vs_br_02_txt03" >
								<a href="#" ><img src="/project/images/main/btn_donut_shortcut.png" alt="도넛 메뉴바로가기" /></a>
							</div>
							<ul class="sns_sec clfix">
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns01.png" alt="오리지널 글레이즈 도넛 facebook 공유" /></a></li>
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns02.png" alt="오리지널 글레이즈 도넛 twiiter 공유" /></a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="#">마지막 - 브랜드 스토리 세번째 비주얼</a>
					<div class="brs03">
						<div class="vinner_con">
							<div  id="vs_br_03_txt01">
								<img src="/project/images/main/vis_br_03_txt1.png" alt="특별한 가격 크리스피 크림 더즌"/>
							</div>
							<div  id="vs_br_03_txt02">
								<img src="/project/images/main/vis_br_03_txt2.png" alt="사랑하는 사람들과 함께 나누세요!" />
							</div>
							<span  class="dozen_btn" id="vs_br_03_txt03">
								<a href="#" ><img src="/project/images/main/btn_dozen_shortcut.png" alt="더즌 메뉴바로가기" /></a>
							</span>
							<ul class="sns_sec clfix">
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns01.png" alt="크리스피 크림 더즌 facebook 공유" /></a></li>
								<li><a href="#" title="새창 열림"><img src="/project/images/main/btn_main_sns02.png" alt="크리스피 크림 더즌 twiiter 공유" /></a></li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
			<a href="#" class="close_story"><img src="/project/images/main/btn_close_story.png" alt="브랜드 스토리 닫기" /></a>
		</div>

	</div>
	<!-- e:main_visual-->
	<!-- s:notice_area-->
	<div class="notic_wrap">
		<div class="notic_area clfix">
			<h3><img src="/project/images/main/h3_main_notice.png" alt="NOTICE" /></h3>

			<p><a href="#" >개인정보처리방침 변경 안내&nbsp;<span>[2021.07.30]</span></a></p>

		</div>
	</div>
	<!-- s:notice_area-->

	<!-- s:middle_con-->
	<div class="middle_wrap">
		<div class="middle_con clfix">
			<!-- s:HOT n NEW -->
			<div>
				<h3><img src="/project/images/main/h3_mainm_01.png" alt="신제품 /인기제품" /></h3><!-- 20130910 -->
				<ul class="banner_li01">

					<li class="on">
						<a href="#" class="ban_cont po1">신제품 /인기제품 1번째 배너</a>
						<div class="clfix">
							<span>
								<img src="/project/images/upload/202192174814_5382.jpg" alt="http://www.krispykre" width="80" />
							</span>
							<div class="cont_ban">
								<span>메이플페스티벌</span><!-- 20130910 -->
								<p>
									-더블 메이플 도넛: 2,300원
-아몬드 메이플 도넛: 2...
								</p>
								
								<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="메이플페스티벌 자세히 보기" /></a>
								
							</div>
						</div>
					</li>

				</ul>
			</div>
			<!-- e:HOT & NEW -->
			<!-- s:KK EVENT -->
			<div>
				<h3><img src="/project/images/main/h3_mainm_02.png" alt="이벤트" /></h3><!-- 20130910 -->
				<ul class="banner_li02">

					<li class="on">
						<a href="#" class="ban_cont po1">이벤트 1번째 배너</a>
						<div class="clfix">
							<span>
								<img src="/project/images/upload/20219393531_4532.jpg" alt="매월 5일, 15일, 25일! 오!잇츠데이 모음" width="80" />
							</span>
							<div class="cont_ban">
								<span>매월 5일, 15일, ...</span><!-- 20130910 -->
								<p>
									매월 5일, 15일, 25일! 오!잇츠데이 모음
								</p>
								
								<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="매월 5일, 15일, 25일! 오!잇츠데이 모음.zip 자세히 보기" /></a>
								
							</div>
						</div>
					</li>

					<li>
						<a href="#" class="ban_cont po2">이벤트 2번째 배너</a>
						<div class="clfix">
							<span>
								<img src="/project/images/upload/20217121450_26782.jpg" alt="1번째, 3번째 수요일 오리지널글레이즈드 단품6개 구매 시 6개 증정" width="80" />
							</span>
							<div class="cont_ban">
								<span>달달한 수요일</span><!-- 20130910 -->
								<p>
									1번째, 3번째 수요일 오리지널글레이즈드 단품6개 구매 시 6...
								</p>
								
								<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="달달한 수요일 자세히 보기" /></a>
								
							</div>
						</div>
					</li>

					<li>
						<a href="#" class="ban_cont po">이벤트 3번째 배너</a>
						<div class="clfix">
							<span>
								<img src="/project/images/upload/202049154014_30216.jpg" alt="롯데리아,엔젤리너스,크리스피크림도넛,빌라드샬롯,TGI프라이데이스 모두 온라인으로 주문가능한  LOTTE EATZ를 만나보세요!" width="80" />
							</span>
							<div class="cont_ban">
								<span>LOTTE EA...</span><!-- 20130910 -->
								<p>
									롯데5개브랜드 온라인주문가능한 LOTTE EATZ!...
								</p>
								
								<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="LOTTE EATZ를 만나보세요! 자세히 보기" /></a>
								
							</div>
						</div>
					</li>

					<li>
						<a href="#" class="ban_cont po4">이벤트 4번째 배너</a>
						<div class="clfix">
							<span>
								<img src="/project/images/upload/201752134923_28470.jpg" alt="크리스피 크림 단체주문으로 소중한 사람들과 달콤한 사랑을 나누세요" width="80" />
							</span>
							<div class="cont_ban">
								<span>크리스피 크림 단체주문...</span><!-- 20130910 -->
								<p>
									크리스피 크림 단체주문으로 소중한 사람들과 달콤한...
								</p>
								
								<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="크리스피 크림 단체주문으로 소중한 사람들과 달콤한 사랑을 나누세요 자세히 보기" /></a>
								
							</div>
						</div>
					</li>

					<li>
						<a href="#" class="ban_cont po5">이벤트 5번째 배너</a>
						<div class="clfix">
							<span>
								<img src="/project/images/upload/2017224182610_4663.jpg" alt="빠르고 안전한 L.pay 결제 사용해 보셨나요? L.pay App으로 간편하게 결제하고 다양한 혜택 받아가세요!" width="80" />
							</span>
							<div class="cont_ban">
								<span>빠르고 안전한 L.p...</span><!-- 20130910 -->
								<p>
									L.pay App으로 간편하게 결제하고 다양한 혜택 받아...
								</p>
								
								<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="빠르고 안전한 L.pay 결제 사용해 보셨나요? 자세히 보기" /></a>
								
							</div>
						</div>
					</li>

				</ul>
			</div>
			<!-- e:KK EVENT -->
			<!-- s:HOMESERIVCE STORE -->
			<div class="last">
				<h3><img src="/project/images/main/h3_mainm_04.png" alt="홈서비스" /></h3>
				<ul class="banner_li03">

					<li class="on">
					<a href="#" class="ban_cont po1">홈서비스매장 1번째 배너</a>
					<div class="clfix">
						<span>
							<img src="/project/images/brand/img_default01.gif" alt="" height="80" width="80" />
						</span>
						<div class="cont_ban">
							<span>KKD 대구범어점</span>
							<p>
								
							</p>
							
							<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="KKD 대구범어점 자세히 보기" /></a>
							
						</div>
					</div>
				</li>

					<li>
					<a href="#" class="ban_cont po2">홈서비스매장 2번째 배너</a>
					<div class="clfix">
						<span>
							<img src="/project/images/brand/img_default01.gif" alt="" height="80" width="80" />
						</span>
						<div class="cont_ban">
							<span>KKD 세종청사점</span>
							<p>
								배달의민족/요기요/전화주문
							</p>
							
							<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="KKD 세종청사점 자세히 보기" /></a>
							
						</div>
					</div>
				</li>

					<li>
					<a href="#" class="ban_cont po">홈서비스매장 3번째 배너</a>
					<div class="clfix">
						<span>
							<img src="/project/images/upload/2017831155525_36880.jpg" alt="남영역점" width="80" />
						</span>
						<div class="cont_ban">
							<span>KKD 남영역점</span>
							<p>
								배달의민족/요기요/카카오/전화주문
							</p>
							
							<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="KKD 남영역점 자세히 보기" /></a>
							
						</div>
					</div>
				</li>

					<li>
					<a href="#" class="ban_cont po4">홈서비스매장 4번째 배너</a>
					<div class="clfix">
						<span>
							<img src="/project/images/upload/2017831155718_34540.jpg" alt="강남역점" width="80" />
						</span>
						<div class="cont_ban">
							<span>KKD 강남역점</span>
							<p>
								배달의민족/요기요/카카오/전화주문
							</p>
							
							<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="KKD 강남역점 자세히 보기" /></a>
							
						</div>
					</div>
				</li>

					<li>
					<a href="#" class="ban_cont po5">홈서비스매장 5번째 배너</a>
					<div class="clfix">
						<span>
							<img src="/project/images/upload/2017831155655_35142.png" alt="대치점" width="80" />
						</span>
						<div class="cont_ban">
							<span>KKD 대치점</span>
							<p>
								롯데잇츠 / 배민1 / 요기요 / 쿠팡이츠
							</p>
							
							<a href="#"><img src="/project/images/main/btn_detailview.gif" alt="KKD 대치점 자세히 보기" /></a>
							
						</div>
					</div>
				</li>

				</ul>
			</div>
			<!-- e:HOMESERIVCE STORE -->
		</div>
	</div>
	<!-- e:middle_con-->
	<!-- s:sns_wrap -->
	<div class="sns_wrap">
		<div class="sns_con clfix">
			<!-- s:face_book_s-->
			<div class="face_book_s">
				<h3><a href="#"><img src="/project/images/main/h3_title_facebook_gray.png" alt="FACEBOOK" id="sns_tab01" /></a></h3>
				<a href="#" class="tit_tab" onclick="sns_tab(1); return false;"><img src="/project/images/main/h3_title_twitter.png" alt="TWITTER" id="sns_tab02" /></a>
				
					<p style="height:24px;">
					</p>
				<!-- /p -->
				<div id="list_fb" style="display:none">
				</div>
				<div id="list_tw" style="display:block; padding:0px;">
											<a class="twitter-timeline" href="https://twitter.com/KrispyKremeKr" data-widget-id="625470936603471872" style="display:none;">@KrispyKremeKr 님의 트윗</a>
											<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
				</div>
			</div>
			<!-- e:face_book_s-->
			<!-- s:twitter_s-->
			<div class="coupon">
				<h3><img src="/project/images/main/h3_title_eatz.png" alt="LOTTE EATZ" /></h3>
			
				<a href="#" ><img src="/project/images/main/banner_eatz.gif" alt="롯데리아, 엔제리너스, 크리스피크림도넛, TGIF의 배달/주문/할인 이벤트를 한번에!" /></a>
			</div>
			<!-- e:twitter_s-->
			<!-- s:instagram_s-->
			<div class="instagram_s">
				<h3><img src="/project/images/main/h3_title_instgram.png" alt="INSTAGRAM" /></h3>
				<div class="instagram_cont">
					<p class="qr"><img src="/project/images/main/qr_instgram.png" alt="INSTAGRAM QR" /></p>
					<img src="/project/images/main/txt_instgram.png" alt="공식 인스타그램 오픈!!" />
				</div>
			</div>
			<!-- e:instagram_s-->
		</div>
	</div>
	<!-- e:sns_wrap -->

</div>

<!-- s:footer include area -->
<%@include file="footer.jsp" %>

</body>
</html>

