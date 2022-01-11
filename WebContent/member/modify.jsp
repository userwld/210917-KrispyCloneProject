<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>정보수정</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<%
	String email = (String)session.getAttribute("email");
	String mode = request.getParameter("mode");
	
	if(email == null){
		out.print("<script>alert('로그인 후 이용 가능합니다.'); location.href='login.jsp';</script>");
		return;
	}
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.selectEmail(email);
	
	String[] address = dto.getAddress().split("&-");	// 주소,전화번호 분리해서 3개영역으로 나오지 않으면 공백으로 출력되게 함(아래에서 사용시 index오류 막기위함)
	if(address.length != 3){
		address = new String[]{"","",""};
	}
	String[] mobile = dto.getMobile().split("-");
	if(mobile.length != 3){
		mobile = new String[]{"","",""};
	}
%>

<script>

function pwCheck(){
	pw = document.getElementById("pw").value;
	
	if(pw == ""){
		alert('비밀번호를 입력해주세요.');
		return;
	}		
	modi.action="modifyPwCheck.jsp";
	modi.submit();
		
}

function modifyCheck(){
	
	phone1 = document.getElementById("cellnum").value;
	phone2 = document.getElementById("phone2").value;
	phone3 = document.getElementById("phone3").value;
	phone = phone1 + "-" + phone2 + "-" + phone3;
	var auth = document.getElementById("auth");
	
	if(phone != "<%=dto.getMobile()%>" && auth.value !="Y"){
		alert("변경된 번호로 휴대폰 인증을 해주세요.");
		return false;
	}
	
	if(newPwCheck() == false || hintCheck() == false || addCheck() == false  ){
		alert("빈 항목이 존재하거나, 유효하지 않은 값이 있습니다.");
		return false;
	}
	
	return true;
}

function newPwCheck(){
	pw = document.getElementById("p_input").value;
	confirmPw = document.getElementById("p_repeat").value;
	var chkPw = document.getElementById("chkPw");
	var reg = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z\d]{8,16}$/;
	
	if(pw == "" || confirmPw == ""){
		chkPw.innerHTML = "비밀번호와 비밀번호 확인 모두 입력해주세요."; chkPw.style.color="red";
		return false;
	}
	if(!reg.test(pw)){
		chkPw.innerHTML = "8~16자의 영문자와 숫자의 조합만 가능합니다."; chkPw.style.color="red";
		return false;
	}
	if(pw != confirmPw){
		chkPw.innerHTML = "입력하신 비밀번호가 서로 다릅니다."; chkPw.style.color="red";
		return false;
	}
	
	chkPw.innerHTML = "사용가능한 비밀번호 입니다."; chkPw.style.color="green";
	return true;	
}


function hintCheck(){
	pwQuestion = document.getElementById("question_select").value;
	pwAnswer = document.getElementById("p_answer").value;
	
	if(pwQuestion == "" || pwAnswer == ""){
		return false;
	}

	return true;
}

function addCheck(){
	zipcode = document.getElementById("p_zipcode").value;
	address1 = document.getElementById("address1").value;
	address2 = document.getElementById("address2").value;

	
	if(zipcode == "" || address1 == "" || address2 ==""){
		return false;
	}
	
	return true;
}

function mobileCheck(){
	phone1 = document.getElementById("cellnum").value;
	phone2 = document.getElementById("phone2").value;
	phone3 = document.getElementById("phone3").value;
	var chkMobile = document.getElementById("chkMobile");
	var auth = document.getElementById("auth");
	
	var phone2Reg = /\d{3,4}$/;
	var phone3Reg = /\d{4}$/;
	
	if(phone1 == "" || phone2 == "" || phone3 == "" ){
		alert("휴대폰 번호를 입력해주세요."); chkMobile.innerHTML = "";
		return false;
	}
	if(!phone2Reg.test(phone2) || !phone3Reg.test(phone3)){
		alert("휴대폰 번호가 올바르지 않습니다."); chkMobile.innerHTML = "";
		return false;
	}
	
	auth.value = "Y";
	chkMobile.innerHTML = "인증완료"; chkMobile.style.color = "green";
	return true;
}

function mobileAuth(){
	var auth = document.getElementById("auth");
	auth.value = "N";
}


/*	다음api 연동 우편번호찾기	*/
var zipsearch = function (){
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

					 // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					 fullAddr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				 // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				 if(data.userSelectedType === 'R'){
					  //법정동명이 있을 경우 추가한다.
					  if(data.bname !== ''){
							extraAddr += data.bname;
					  }
					  // 건물명이 있을 경우 추가한다.
					  if(data.buildingName !== ''){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					  }
					  // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					  fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				 }

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("input[name='zipcode']").val(data.zonecode);
				$("input[name='address1']").val(fullAddr);
				$("input[name='address2']").val("");
				$("input[name='address2']").focus();
		}
	}).open();
}


</script>



<h2 class="hide_text">본문 영역</h2>
<div id="container">
<div class="container_inner">
	<div class="content_wrap clfix">
		<!-- s:snb include area -->
		<div class="snb">
	<h3 class="snb_tit"><img src="/project/images/common/snb_tit_mypage.png" alt="마이페이지" /></h3>
	<ul class="snb_list">
		<li class="snb_1depth on"><a href="/project/member/modify.jsp?mode=pwAuth" class="snb_1depth_link"><span class="snb_txt">개인정보수정</span></a></li>
		<li class="snb_1depth"><a href="/project/member/delete.jsp" class="snb_1depth_link"><span class="snb_txt">회원탈퇴</span></a></li>
	</ul>
</div>
		<!-- e:snb include area -->

	
	<div id="content">
		<div class="content_top clfix" >
			<div class="content_tit bg_mypage">
				<h4 class="txt">개인정보수정</h4>
				<p class="tit_copy02">크리스피 크림 회원정보를 수정하시면, 이벤트 당첨 및 다양한 혜택을 받으실 수 있습니다.</p>
			</div>
			<!-- s:location include area -->
			<ul class="location_bar clfix" style="background-color: #22741C;">
	<li class="home"><a href="/project/main.jsp" class="bar_item"><img src="/project/images/common/ico_home.gif" alt="홈" /></a></li>
<li><a href="/project/member/modify.jsp?mode=pwAuth" class="bar_item">마이페이지</a></li>
<li><a href="#" class="bar_item" title="현재위치">개인정보수정</a></li>
</ul>
				<!-- e:location include area -->
			</div>
	
<div class="content_body mgt50">
	
	<% if(mode.equals("modify")){ %>
	<form name="frmMain" method="post" id="modify" action="modifyService.jsp" onsubmit="return modifyCheck();" >
	
		<div class="content_body mgt50">
				
				<h5 class="table_tit">개인정보입력</h5>

				<div class="data_table">
					<table>
						<caption>개인정보입력</caption>
						<colgroup>
							<col width="24%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="user_name">이름</label></th>
								<td class="no_right"><%=dto.getName() %></td>
							</tr>
							<tr>
								<th scope="row"><label for="user_email_id">E-mail</label></th>
								<td class="no_right"> <%=dto.getEmail() %>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="p_input">변경 비밀번호</label></th>
								<td class="no_right">
									<div class="txt_info_inline">
										<span class="notice_right add_txt02">영문/숫자조합으로 10자 이상 입력하세요.</span><input type="password" class="abs" id="p_input" name="newPw" value="" maxlength="20" title="비밀번호 입력" style="width:196px" onblur="newPwCheck();" />
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="p_repeat">변경 비밀번호 확인</label></th>
								<td class="no_right">
									<div class="txt_info_inline">
										<span class="notice_right add_txt02" id = "chkPw">비밀번호를 한번 더 입력하세요.</span><input type="password" class="abs" id="p_repeat" name="newPwConfirm" value="" maxlength="20" title="비밀번호 확인 입력" style="width:196px" onblur="newPwCheck();" />
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="question_select">비밀번호 힌트 질문</label></th>
								<td class="no_right">
									<select class="term_left" title="비밀번호 힌트 질문 선택" id="question_select" style="width:300px" name="pwQuestion">
										<option value='1' <%="1".equals(dto.getPwQuestion())?"selected":"" %>>가장 기억에 남는 장소는?</option>
										<option value='2' <%="2".equals(dto.getPwQuestion())?"selected":"" %>>나의 좌우명은?</option>
										<option value='3' <%="3".equals(dto.getPwQuestion())?"selected":"" %>>나의 보물 제1호는?</option>
										<option value='4' <%="4".equals(dto.getPwQuestion())?"selected":"" %> >가장 기억에 남는 선생님 성함은?</option>
										<option value='5' <%="5".equals(dto.getPwQuestion())?"selected":"" %>>다른 사람은 모르는 나만의 신체비밀은?</option>
										<option value='6' <%="6".equals(dto.getPwQuestion())?"selected":"" %>>오래도록 기억하고 싶은 날짜는?</option>
										<option value='7' <%="7".equals(dto.getPwQuestion())?"selected":"" %>>받았던 선물 중 기억에 남는 독특한 선물은?</option>
										<option value='8'<%="8".equals(dto.getPwQuestion())?"selected":"" %> >가장 생각나는 친구 이름은?</option>
										<option value='9' <%="9".equals(dto.getPwQuestion())?"selected":"" %>>인상 깊게 읽은 책 이름은?</option>
										<option value='10' <%="10".equals(dto.getPwQuestion())?"selected":"" %>>읽은 책 중에서 좋아하는 구절은?</option>

									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="p_answer">비밀번호 힌트 정답</label></th>
								<td class="no_right">
									<div class="txt_info_inline">
										<span class="notice_right add_txt02">10자 이내로 입력해주세요.</span><input type="text" id="p_answer" name="pwAnswer" value="<%=dto.getPwAnswer() %>" maxlength="10" title="비밀번호 힌트 정답 입력" style="width:196px" />
									</div>
								</td>
							</tr>
							<tr>
								
								<th scope="row"><label for="p_zipcode">주소</label></th>
								<td class="no_right">
									<input type="text" id="p_zipcode" name="zipcode" value="<%=address[0]%>" maxlength="5" onkeyup="isNumber(this)" title="우편번호" style="width:93px" readonly/>									
									
									<a href="#" onclick="zipsearch(); return false;" title="우편번호검색 새창으로 열림"><img src="/project/images/util/btn_zipcode.gif" alt="우편번호검색" /></a>
									
									<br />
									<input type="text" name="address1" id="address1" value="<%=address[1]%>" maxlength="70" title="주소 입력" style="width:400px" class="mgt7" readonly />
									<br />
									<input type="text" name="address2" id="address2" value="<%=address[2]%>" maxlength="70" title="상세주소 입력" style="width:400px" class="mgt7" />
								</td>
							</tr>
						
							
							<tr class="last">
								<th scope="row"><label for="cellnum">휴대폰번호</label></th>
								<td class="no_right">
									<select class="term_left" id="cellnum" title="휴대폰번호 앞자리 선택" style="width:100px" name="phone1" onchange="mobileAuth();">
										<option value='010' <%="010".equals(mobile[0])?"selected":"" %>>010</option>
										<option value='011' <%="011".equals(mobile[0])?"selected":"" %>>011</option>
										<option value='016' <%="016".equals(mobile[0])?"selected":"" %>>016</option>
										<option value='017' <%="017".equals(mobile[0])?"selected":"" %>>017</option>
										<option value='018' <%="018".equals(mobile[0])?"selected":"" %>>018</option>
										<option value='019' <%="019".equals(mobile[0])?"selected":"" %>>019</option>

									</select>
									<input type="text" name="phone2" id = "phone2" value="<%=mobile[1] %>" maxlength="4" onkeyup="isNumber(this)" title="휴대폰번호 가운데자리 입력" style="width:80px" onchange="mobileAuth();"/>
									<input type="text" name="phone3" id = "phone3" value="<%=mobile[2] %>" maxlength="4" onkeyup="isNumber(this)" title="휴대폰번호 뒷자리 입력" style="width:80px" onchange="mobileAuth();"/>
									<a href="javascript:mobileCheck();" id="authHP" title="새창 열림"><img src="/project/images/common/btn_phone_c.gif" alt="휴대폰 인증" /></a>
									<label id = "chkMobile"></label>
									<input type="hidden" name="auth" id = "auth" value="">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
				<div class="btn_area02">
					<input type="image" src="/project/images/common/btn_modify.gif" alt="수정" />
					<a href="/project/main.jsp"><img src="/project/images/common/btn_cancel.gif" alt="취소" /></a>
				</div>
			</form>	
<%}else{ %>
	<form name="frmMain" method="post" id="modi" >
		<div class="tbl_wrap02">
					<div class="info_pw_box">
						<p class="txt_info">고객님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다. <br /> 항상 비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</p>
					</div>
					<p class="txt_tit">비밀번호 입력</p>
					<table class="tbl_view" summary="개인정보수정을 위해 비밀번호를 입력해주세요.">
					<caption>비밀번호 입력</caption>
					<colgroup>
						<col width="25%" /><col width="75%" />
					</colgroup>
					<tbody>
						<tr class="last">
							<th class="c_th02" scope="row"><label for="in_now_pw">비밀번호</label></th>
							<td><input type="password" id="pw" name="pw" value="" maxlength="20" title="비밀번호 입력" style="width:198px" /></td>
						</tr>						
					</tbody>
					</table>
				</div>

				<div class="btn_area right">
					<input type="image" src="/project/images/util/btn_confirm.gif" alt="확인" onclick ="javascript:pwCheck();"/>
				</div>		
		</form>
<%}%>
				
			</div>
		</div>
	</div>
</div>
</div>

		

<%@ include file="../footer.jsp"%>