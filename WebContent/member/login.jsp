<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>로그인</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />
<%
	Cookie[] cookies = request.getCookies();	// 이메일 저장체크시 생성된 쿠키
	String email = "";
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("email")){
				email = c.getValue();
			}
		}
	}
%>

<script>

function loginCheck(){
	email = document.getElementById("log_email").value;
	pw = document.getElementById("log_pwd").value;
	
	if(email == "" || pw == ""){
		alert("모든 항목을 채워주세요");
		return;
	}
	
	frmLogin.submit();

}
</script>


<h2 class="hide_text">본문 영역</h2>
<div id="container">
<div class="container_inner">
	<div class="content_wrap clfix">
		<!-- s:snb include area -->
		<div class="snb">
	<h3 class="snb_tit"><img src="/project/images/common/snb_tit_membership.png" alt="MEMBER" /></h3>
	<ul class="snb_list">
		<li class="snb_1depth on"><a href="/project/member/login.jsp" class="snb_1depth_link"><span class="snb_txt">로그인</span></a></li>
		<li class="snb_1depth"><a href="/project/member/register_agree1.jsp" class="snb_1depth_link"><span class="snb_txt">회원가입</span></a></li>
	</ul>
</div>
		<!-- e:snb include area -->

		<div id="content">
			<div class="content_top clfix">
				<div class="content_tit bg_member">
					<h4 class="txt">로그인</h4>
					<span class="tit_copy02">달콤한 크리스피 크림 홈페이지에 오신 것을 환영합니다.</span>
				</div>
				<!-- s:location include area -->
				<ul class="location_bar clfix" style="background-color: #22741C;">
	<li class="home"><a href="/project/main.jsp" class="bar_item"><img src="/project/images/common/ico_home.gif" alt="홈" /></a></li>
<li><a href="#" class="bar_item" title="현재위치">로그인</a></li>
</ul>
				<!-- e:location include area -->
			</div>

			<div class="content_body mgt50">

				<!-- s:login_sec -->
				<div class="login_sec">
					<div class="login_sec_foot">
						<div class="login_sec_con clfix">
							<h5 class="hide_text">Welcome To Krispy Kreme Log-in</h5>
							<form name="frmLogin" id="frmLogin" method="post" action="loginService.jsp">
								<input type="hidden" id="returnurl" name="returnurl" value="" />
								<%if(email == ""){ %>
									<fieldset>
										<legend>로그인</legend>
										<ul class="input_idpw">
											<li>
												<label for="log_email">E-mail</label>
												<input type="text" id="log_email" name="email" value="" maxlength="100" style="width:306px"  />
											</li>
											<li>
												<label for="log_pwd">비밀번호</label>
												<input type="password" id="log_pwd" name="pw" value="" maxlength="20" style="width:306px"/>
											</li>
											<li class="last check_mail">
												<input type="checkbox" id="save_mail" name="remember" value="1" /><label for="save_mail" class="txt_gray6">이메일저장</label>
											</li>
										</ul>
										<a href="javascript:loginCheck();" class="log_in"><img src="/project/images/util/btn_login.gif" alt="로그인" /></a>
									</fieldset>
								<%}else{ %>
									<fieldset>
									<legend>로그인</legend>
									<ul class="input_idpw">
										<li>
											<label for="log_email">E-mail</label>
											<input type="text" id="log_email" name="email" value="<%=email %>" maxlength="100" style="width:306px"  />
										</li>
										<li>
											<label for="log_pwd">비밀번호</label>
											<input type="password" id="log_pwd" name="pw" value="" maxlength="20" style="width:306px"/>
										</li>
										<li class="last check_mail">
											<input type="checkbox" id="save_mail" name="remember" value="1" checked="checked"/><label for="save_mail" class="txt_gray6">이메일저장</label>
										</li>
									</ul>
									<a href="javascript:loginCheck();" class="log_in"><img src="/project/images/util/btn_login.gif" alt="로그인" /></a>
								</fieldset>
								<%} %>
							</form>
							<div class="login_util clfix">
								<p class="add_custom_info txt_gray6">대표문의 02-709-1114 (운영시간 : 월~금 09:00 ~ 18:00)</p>
								<a href="/project/member/register_agree1.jsp" class="second_btn"><img src="/project/images/util/btn_join.gif" alt="회원가입" /></a>
							</div>
						</div>
					</div>
				</div>
				<!-- e:login_sec -->

			</div>
		</div>
	</div>
</div>
</div>

<%@ include file="../footer.jsp"%>