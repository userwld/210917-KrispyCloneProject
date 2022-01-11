<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>회원가입 Step2</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<% 	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	if(name == null){		// 이 페이지로 바로 접근시 돌려보냄(동의페이지로)
		out.print("<script>location.href='register_agree1.jsp'</script>");
	}	
%>

<script>
function checkData() {
	duChk = document.getElementById("duChk").value;
	authMobile = document.getElementById("authMobile").value;
	
	if(duChk != "Y"){					// 중복확인과 휴대폰 인증 여부 확인!!!
		alert("이메일 중복확인을 해주세요.");
		return false;
	}
	
	if(authMobile != "Y"){
		alert("휴대폰 인증을 해주세요.");
		return false;
	}
	
	if(nameCheck() == false || pwCheck() == false || hintCheck() == false || addCheck() == false || mobileCheck() == false || duChk !="Y" || authMobile !="Y"){
		alert("모든 항목을 통과하셔야 합니다!");
		return false;
	}
	
	return true;
	
}

function nameCheck(){
	var name = document.getElementById("user_name").value;
	var chkName = document.getElementById("chkName");
	var reg =/^[가-힣a-zA-Z]+$/;
	if(name == ""){
		chkName.innerHTML = "이름을 입력해주세요."; chkName.style.color="red";
		return false;
	}
	
	if(!reg.test(name)){
		chkName.innerHTML = "한글과 영문자만 가능합니다."; chkName.style.color="red";
		return false;
	}
	
	chkName.innerHTML=""; chkName.style.color="black";
	return true;
}

function emailCheck(){
	emailId = document.getElementById("user_email_id").value;
	emailDomain = document.getElementById("user_email_addr").value;
	var chkId = document.getElementById("chkId");
	var reg = /^[a-z0-9]{5,12}$/;
	var domainReg = /^[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4})$/;
	
	if(emailId == "" || emailDomain == ""){
		chkId.innerHTML = "이메일 아이디와 도메인을 모두 입력해주세요."; chkId.style.color="red";
		return false;
	}
	
	if(!reg.test(emailId)){
		chkId.innerHTML = "이메일 아이디는 5~12자 영문자 소문자와 숫자만 가능합니다."; chkId.style.color="red";
		return false;
	 }
	
	if(!domainReg.test(emailDomain)){
		chkId.innerHTML = "도메인 형식이 올바르지 않습니다."; chkId.style.color="red";
		return false;
	}
	
	duplicateCheck(emailId+"@"+emailDomain);	// 위에 인증 다 통과시 이메일 중복체크 팝업열기
	
	chkId.innerHTML = "멋진아이디네요."; chkId.style.color="green";
	return true;
}

function duplicateCheck(email){
	window.open("registerEmailCheck.jsp?email="+email,"","width=200, height=200");
}

function pwCheck(){
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
	var chkHint = document.getElementById("chkHint");
	
	if(pwQuestion == "" || pwAnswer == ""){
		chkHint.innerHTML = "비밀번호 힌트 항목을 입력해주세요."; chkHint.style.color="red";
		return false;
	}

	chkHint.innerHTML = ""; chkHint.style.color="black";
	return true;
}

function addCheck(){
	zipcode = document.getElementById("p_zipcode").value;
	address1 = document.getElementById("address1").value;
	address2 = document.getElementById("address2").value;
	var chkAddredss = document.getElementById("chkAddress");
	
	if(zipcode == "" || address1 == "" || address2 ==""){
		chkAddress.innerHTML = "주소를 모두 입력해주세요."; chkAddress.style.color="red";
		return false;
	}
	
	chkAddress.innerHTML = ""; chkAddress.style.color="black";
	return true;
}

function mobileCheck(){		// 실제 휴대폰 인증 x --> 정규식 형식을 충족하면 인증성공하는 형식
	phone1 = document.getElementById("cellnum").value;
	phone2 = document.getElementById("phone2").value;
	phone3 = document.getElementById("phone3").value;
	var chkMobile = document.getElementById("chkMobile");
	var authMobile = document.getElementById("authMobile");
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
	chkMobile.innerHTML = "인증성공"; chkMobile.style.color = "green";
	authMobile.value="Y";
	return true;
}

function authM(){					// 이메일과 휴대폰 인증 후 값 바뀌었을 경우 다시 인증버튼 누르게 함
	var authMobile = document.getElementById("authMobile");
	authMobile.value="N";
}

function authE(){
	var duChk = document.getElementById("duChk");
	duChk.value="N";
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
	<h3 class="snb_tit"><img src="/project/images/common/snb_tit_membership.png" alt="MEMBER" /></h3>
	<ul class="snb_list">
		<li class="snb_1depth"><a href="/project/member/login.jsp" class="snb_1depth_link"><span class="snb_txt">로그인</span></a></li>
		<li class="snb_1depth on"><a href="/project/member/register_agree1.jsp" class="snb_1depth_link"><span class="snb_txt">회원가입</span></a></li>
	</ul>
</div>
		<!-- e:snb include area -->

		<div id="content">
			<div class="content_top clfix">
				<div class="content_tit bg_member">
					<h4 class="txt">회원가입</h4>
					<span class="tit_copy02">크리스피 크림에 가입하시면 다양한 서비스를 제공받으실 수 있습니다.</span>
				</div>
				<!-- s:location include area -->
				<ul class="location_bar clfix" style="background-color: #22741C;">
	<li class="home"><a href="/project/main.jsp" class="bar_item"><img src="/project/images/common/ico_home.gif" alt="홈" /></a></li>
<li><a href="#" class="bar_item" title="현재위치">회원가입</a></li>
</ul>

				<!-- e:location include area -->
	</div>
			
	<form name="frmMain" id="frmMain" method="post" action="registerService.jsp" onsubmit="return checkData()">
				
			<div class="content_body mgt50">
				<p class="txt_c"><img src="/project/images/util/img_join_process02.png" alt="회원가입 절차 step1 약관동의 회원인증,  step2. 개인정보입력, step3. 가입완료 3단계중에 step2.개인정보 입력 단계입니다." /></p>

				<h5 class="table_tit">개인정보입력</h5>
				<!-- s:data_table -->
				<div class="data_table">
					<table summary="개인정보 입력 이름, e-mail, 비밀번호, 비밀번호 확인, 비밀번호 힌트 질문, 비밀번호 힌트 정답, 주소, 전화번호, 휴대폰번호를 입력하는 표">
						<caption>개인정보입력</caption>
						<colgroup>
							<col width="24%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="user_name">이름</label></th>
								<td class="no_right"><input type="text" id="user_name" name="name" value="<%=name %>" maxlength="20" title="이름 입력" style="width:196px" onblur="nameCheck()" /> <label id ="chkName"></label></td>
							</tr>
							<tr>
								<th scope="row"><label for="user_email_id">E-mail</label></th>
								<td class="no_right">
									<div class="txt_info_inline2">
										<p class="add_text" style="z-index:-1" id = "chkId">
											(입력하신 이메일은 ID로 사용됩니다. ID는 사용중간에 변경되지 않습니다.<br />탈퇴 시 활동내역이 모두 삭제되므로 신중히 선택해주세요.)
										</p>
										<p>
											<input type="text" id="user_email_id" name="emailId" value="" maxlength="50" title="이메일 아이디 입력" onkeydown="authE();" style="width:140px"  /><span class="at_mark">@</span><input type="text" id="user_email_addr" name="emailDomain" value="" maxlength="50"  title="이메일 주소 도메인 입력" style="width:140px" onkeydown="authE();"  />
											<select class="term_left" title="이메일 주소 도메인 선택" style="width:100px" name="emailDomainSelect" onchange="changeEmailDomain(frmMain.emailDomain, this.value); authE(); ">
												<option value="self">직접입력</option>
												<option value='hanmail.net' >hanmail.net</option>
												<option value='gmail.com' >gmail.com</option>
												<option value='naver.com' >naver.com</option>
												<option value='nate.com' >nate.com</option>
												<option value='paran.com' >paran.com</option>
												<option value='yahoo.co.kr' >yahoo.co.kr</option>
											</select>
											<input type="hidden" name = "duChk" id = "duChk" value="">
											<a href="javascript:emailCheck();" id="checkEmail"><img src="/project/images/util/btn_overlapchk.gif" alt="이메일 중복확인" /></a>
											
										</p>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="p_input">비밀번호</label></th>
								<td class="no_right">
									<div class="txt_info_inline">
										<span class="notice_right add_txt02">영문/숫자조합으로 8~16자 입력하세요.</span><input type="password" class="abs" id="p_input" name="pw" value="" maxlength="20" title="비밀번호 입력" style="width:196px" onblur= "pwCheck()"/>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="p_repeat">비밀번호 확인</label></th>
								<td class="no_right">
									<div class="txt_info_inline">
										<span class="notice_right add_txt02" id ="chkPw">비밀번호를 한번 더 입력하세요.</span><input type="password" class="abs" id="p_repeat" name="confirmPw" value="" maxlength="20" title="비밀번호 확인 입력" style="width:196px" onblur="pwCheck()"/>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="question_select">비밀번호 힌트 질문</label></th>
								<td class="no_right">
									<select class="term_left" title="비밀번호 힌트 질문 선택" id="question_select" style="width:300px" name="pwQuestion">
										<option value='1' >가장 기억에 남는 장소는?</option>
										<option value='2' >나의 좌우명은?</option>
										<option value='3' >나의 보물 제1호는?</option>
										<option value='4' >가장 기억에 남는 선생님 성함은?</option>
										<option value='5' >다른 사람은 모르는 나만의 신체비밀은?</option>
										<option value='6' >오래도록 기억하고 싶은 날짜는?</option>
										<option value='7' >받았던 선물 중 기억에 남는 독특한 선물은?</option>
										<option value='8' >가장 생각나는 친구 이름은?</option>
										<option value='9' >인상 깊게 읽은 책 이름은?</option>
										<option value='10' >읽은 책 중에서 좋아하는 구절은?</option>

									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="p_answer">비밀번호 힌트 정답</label></th>
								<td class="no_right">
									<div class="txt_info_inline">
										<span class="notice_right add_txt02" id="chkHint">10자 이내로 입력해주세요.</span><input type="text" id="p_answer" name="pwAnswer" value="" maxlength="10" title="비밀번호 힌트 정답 입력" style="width:196px" onblur="hintCheck()"/>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="p_zipcode">주소</label></th>
								<td class="no_right">
									<input type="text" id="p_zipcode" name="zipcode" value="" maxlength="5" onkeyup="isNumber(this)" title="우편번호" style="width:93px" onkeyup="isNumber(this)" readonly/>									
									
									<a href="#" onclick="zipsearch(); return false;" title="우편번호검색 새창으로 열림"><img src="/project/images/util/btn_zipcode.gif" alt="우편번호검색" /></a>
									
									<br />
									<input type="text" id = "address1" name="address1" value="" maxlength="70" title="주소 입력" style="width:400px" class="mgt7" readonly />
									<br />
									<input type="text" id = "address2" name="address2" value="" maxlength="70" title="상세주소 입력" style="width:400px" class="mgt7" onblur="addCheck()" />
									<label id = "chkAddress"></label>
								</td>
							</tr>
						
							
							<tr class="last">
								<th scope="row"><label for="cellnum">휴대폰번호</label></th>
								<td class="no_right">
									<select class="term_left" id="cellnum" title="휴대폰번호 앞자리 선택" style="width:100px" name="phone1" onchange="authM();" >
										<option value='010' >010</option>
										<option value='011' >011</option>
										<option value='016' >016</option>
										<option value='017' >017</option>
										<option value='018' >018</option>
										<option value='019' >019</option>

									</select>
									<input type="text" id = "phone2" name="phone2" value="" maxlength="4" onkeyup="isNumber(this)"  title="휴대폰번호 가운데자리 입력" style="width:80px" onkeydown="authM();"/>
									<input type="text" id = "phone3" name="phone3" value="" maxlength="4" onkeyup="isNumber(this)"  title="휴대폰번호 뒷자리 입력" style="width:80px" onkeydown="authM();"/>
									<a href="javascript:mobileCheck();" id="authHP"><img src="/project/images/common/btn_phone_c.gif" alt="휴대폰 인증" /></a>
									<input type="hidden" id = "authMobile" name = "authMobile" value="">
									<label id = "chkMobile"></label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			<div class="btn_area right">
		<input type="image" src="/project/images/util/btn_confirm.gif" alt="확인" />
		<a href="register_agree1.jsp" class="btns_term"><img src="/project/images/util/btn_cancel.gif" alt="취소" /></a>
	</div>
</div>
</form>
</div>
</div>
</div>
</div>


<%@ include file="../footer.jsp"%>