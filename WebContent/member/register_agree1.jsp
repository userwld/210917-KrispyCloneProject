<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>회원가입 Step1</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />
<script>
// 이름검증, 나이검증(만 14세미만 가입불가), 개인정보동의 검증 --> 검증통과시 agree2로!
function check(){
	name = document.getElementById("p_find").value;
	agree = document.getElementById("agree_ok");

	if(name == "" ){
		alert("이름을 채워주세요.");
		return false;
	}
	
	if(agree.checked == false){
		alert("개인정보 동의가 필요합니다.");
		return false;
	}

	if(nameCheck(name) == false || birthCheck() == false){
		return false;
	}
		
	return true;
}

function nameCheck(name){
	var reg =/^[가-힣a-zA-Z]+$/;
	if(!reg.test(name)){
		 alert('이름은 한글과 영문자만 가능합니다.');
		 return false;
	 }else{
		 return true;
	 }	
}

function birthCheck(){
	var year = document.getElementById("birth_select").value;
	var month = document.getElementById("month").value;
	var day = document.getElementById("day").value;
	
	var maxDaysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
    var maxDay = maxDaysInMonth[month - 1];
	if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {	
        maxDay = 29;
    }
	
  	if (day > maxDay) {
   	   	alert("생년월일을 다시 확인해주세요.");
         return false;
    }
  	
  	birthday = year+month+day;
  	var age = calcAge(birthday);
  	
  	if(age < 14){
  		alert("만 14세 미만은 가입이 불가능합니다.");
  		return false;
  	}else{
  		return true;
  	}
}

function calcAge(birth){
	 var date = new Date();
     var year = date.getFullYear();
     var month = (date.getMonth() + 1);
     var day = date.getDate();
     if (month < 10) month = '0' + month;
     if (day < 10) day = '0' + day;
     
     var monthDay = month + '' + day;

     var birthdayy = birth.substr(0, 4);
     var birthdaymd = birth.substr(4, 4);

     var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;	
     return age;
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
			
	<div class="content_body mgt50">
		<p class="txt_c"><img src="/project/images/util/img_join_process01.png" alt="회원가입 절차 step1 약관동의 회원인증,  step2. 개인정보입력, step3. 가입완료 3단계중에 step1. 약관동의, 회원인증 단계입니다." /></p>

		<form name="frmAuthInfo" method="post" action = "register_agree2.jsp" onsubmit="return check()">
		<h5 class="table_tit">개인정보인증</h5>
		<!-- s:data_table -->
		<div class="data_table">
			<table summary="개인정보인증. 이름, 생년월일을 확인하세요.">
				<caption>개인정보인증</caption>
				<colgroup>
					<col width="24%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="p_find">이름</label></th>
						<td class="no_right"><input type="text" id="p_find" name="name" value="" maxlength="10" title="이름 입력" style="width:196px" /></td>
					</tr>
					<tr>
						<th scope="row"><label for="birth_select">생년월일</label></th>
						<td class="no_right">
							<select id="birth_select" title="연도 선택" style="width:100px" name="birth1">
								<%for(int i = 2021; i >= 1900; i--) {%>							
									<option value=<%=i %>><%=i %></option>						
								<%} %>
							</select> 년
							<select class="term_left" title="월 선택" style="width:100px" name="birth2" id = "month">
								<%for(int j = 1; j <=12; j++){
									if(j < 10){%>
										<option value=<%="0"+j %>><%="0"+j %></option>
									<%}else{ %>
										<option value=<%=j %>><%=j %></option>
									<%}} %>	
							</select> 월
							<select class="term_left" title="날짜 선택" style="width:100px" name="birth3" id = "day" >
								<%for(int k = 1; k <=31; k++){
									if(k < 10){%>
										<option value=<%="0"+k %>><%="0"+k %></option>
									<%}else{ %>
										<option value=<%=k %>><%=k %></option>
									<%}} %>									
							</select> 일
						</td>
					</tr>
					<tr class="last">
						<th scope="row">개인정보인증 동의</th>
						<td class="no_right">
							<div class="agree_box" style="margin:0; padding:0; border:0">
								<div class="txt_box" style="margin:0">
									<strong style="font-family: 'Nanum GothicE';">개인정보 이용 동의</strong><br />
									본 사이트는 만 14세 미만의 아동의 가입이 제한됩니다.<br />
									이에 회원가입의 단계로서 본인 인증 및 만 14세 미만 여부를 확인하기 위하여<br />
									아래와 같은 개인정보를 이용합니다.<br />
									• 필수정보 : 이름, 생년월일<br />
									위 개인정보는 사이트 내 보관되지 않으며 확인 후 즉시 파기됩니다. <br />미동의 시에는 회원가입이 제한됩니다.<br />										
								</div>
								<div style="padding:10px 0; text-align:center">
									<input type="radio" id="agree_ok" name="agree" />
									<label for="ok" style="vertical-align:middle">동의</label>
									<input type="radio" id="agree_no" name="agree" checked="checked" />
									<label for="no" style="vertical-align:middle">미동의</label>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- e:data_table -->

		<!-- s:btn_area -->
		<div class="btn_area right">
			<input type="image" src="/project/images/util/btn_confirm.gif" alt="확인" />
			<a href="/project/main.jsp" class="btns_term"><img src="/project/images/util/btn_cancel.gif" alt="취소" /></a>
		</div>
		<!-- e:btn_area -->
				</form>

			</div>
		</div>
	</div>
</div>
</div>


<%@ include file="../footer.jsp"%>