<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>회원가입 Step1</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />

<%	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String year = request.getParameter("birth1");
	String month = request.getParameter("birth2");
	String day = request.getParameter("birth3");
	
	if(name == null || year == null || month == null || day == null){	//agree1안거치고 오면 다시 돌려보냄
		out.print("<script>location.href='register_agree1.jsp'</script>");
	}
%>

<script>
function checkData(frm) {
	if ($("input[name='agree1']:checked").val() != "Y") {
		alert("개인정보 수집 동의서에 동의해주세요.");
		frm.agree1[0].focus();
		return false;
	}
	
	if ($("input[name='agree4']:checked").val() != "Y") {
		alert("온라인 회원가입 약관에 동의해주세요.");
		frm.agree4[0].focus();
		return false;
	}
	
	return true;
	
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
								<th scope="row">이름</th>
								<td class="no_right"><%=name%></td>
							</tr>
							<tr class="last">
								<th scope="row">생년월일</th>
								<td class="no_right">
									<%=year %>년
									<%=month %>월
									<%=day %>일
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- e:data_table -->

				<form name="frmAgree" method="post" action="register_final.jsp"  onsubmit="return checkData(this);" >
					<input type="hidden" name="name" value=<%=name %>>
					<input type="hidden" name="year" value=<%=year %> >
					<input type="hidden" name="month" value=<%=month %> >
					<input type="hidden" name="day" value=<%=day %> >
				<h5 class="table_tit">개인정보 보호를 위한 동의서</h5>
				<!-- s:privacy_area -->
				<div class="privacy_area">
					<div class="notification" tabindex="0">
1. 개인정보의 수집 및 이용 목적<br />
1) 수집방법<br />
-회사는 아래와 같은 방법을 통해 개인정보를 수집합니다.<br />
· 회원가입 : 홈페이지의 회원가입 페이지에서 회원가입 시 수집<br />
2) 이용목적<br />
· 본인 확인<br />
· 안내 고지, 불만처리 등 원활한 의사소통 경로확보<br />
	<!-- 3) 행사,이벤트 안내 및 서비스 제공	<br /> --><br />
2. 수집하는 개인정보의 항목	<br />
 · 필수정보 : 성명, 전화번호, 핸드폰번호, 주소, 이메일주소, 비밀번호, 비밀번호 힌트<br /><br />
3. 개인정보의 보유 및 이용기간	<br />
“롯데지알에스㈜ KKD부분”은 원칙적으로 회원 탈퇴 시 즉시 파기합니다.	<br />
 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령이 정한 일정한 기간 동안 회원정보를 보관합니다.	<br />
- <span class="font120 underline">소비자의 불만 또는 분쟁처리에 관한 기록 : 3년	</span><br />
- <span class="font120 underline">보유기간을 이용자에게 미리 고지하거나 개별적으로 이용자의 동의를 받은 경우: 고지하거나 개별 동의한 기간	</span><br />
※ 보다 자세한 내용은 “개인정보취급방침”을 확인하여 주시기 바랍니다.	<br /><br />
4. 수집한 개인정보의 위탁	<br />
서비스 향상 및 효율적인 개인정보 관리를 위하여 외부에 위탁하여 처리하고 있으며, 관계법령에 따라 위탁 계약 시 개인정보가 안전하게 관리될 수 있도록 규정하고 있습니다.	<br />
개인정보취급 수탁자와 그 업무의 내용은 다음과 같습니다.	<br /><br />
[수탁자 : 수탁범위]	<br />
 - 롯데정보통신㈜ : 전산시스템의 구축 및 유지보수/SMS	<br /><br />
5. 귀하는 위와 같은 개인정보 수집이용에 동의하지 않을 수 있습니다.	<br />
  단, 필수정보 동의 거부시에는 해당 서비스 참여가 제한됩니다.	<br /><br />
					</div>
										
					
					<div class="btn_area_center bd_bottom padb15">					
						<input type="radio" name="agree1" value="Y" id="sel1" title="개인정보 보호를 위한 동의서에 동의함" />
						<label for="sel1" style="padding-right:25px">동의함</label> 
						
						<input type="radio" name="agree1" value="N" id="sel2" title="개인정보 보호를 위한 동의서에 동의안함" />
						<label for="sel2">동의안함</label>
					</div>
					
					
				</div>

				<h5 class="table_tit">온라인 회원가입 약관</h5>
				<!-- s:privacy_area -->
				<div class="privacy_area">
					<div class="notification" tabindex="0">
						<div class="join1_txttit_b">제 1 장 총칙</div>
						<div class="join1_txttit_1">제 1 조 목적</div>
						<p>이 약관은 롯데지알에스㈜ KKD사업본부(이하 "Krispy Kreme"이라 합니다)가 제공하는 서비스(이하 "서비스"라 한다)의 이용 조건 및 절차에 관한 기본적인 사항에 관한 정의를 목적으로 합니다.</p>

						<div class="join1_txttit_1">제 2 조 (약관의 효력 및 변경)</div>
						<ul  class="join1_txttit_1_1">
							<li>① 이 약관은 서비스를 통하여 이를 공지하거나 전자우편, 기타의 방법으로 회원에게 통지함으로써 효력을 발생합니다.</li>
							<li>② Krispy Kreme은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.</li>
						</ul>

						<div class="join1_txttit_1">제 3 조 (약관 이외의 준칙)</div>
						<p>이 약관은 롯데지알에스㈜ KKD사업본부(이하 "Krispy Kreme"이라 합니다)가 제공하는 서비스(이하 "서비스"라 한다)의 이용 조건 및 절차에 관한 기본적인 사항에 관한 정의를 목적으로 합니다.</p>

						<div class="join1_txttit_1">제 4 조 (용어의 정의)</div>
						<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
						<ul  class="join1_txttit_1_1">
							<li>① 회원 : 서비스를 제공 받기 위하여 Krispy Kreme과 이용계약을 체결하거나 로그인 기능을 부여 받은 자를 말합니다.</li>
							<li>② 비밀번호 : 회원이 로그인 시 사용하는 이메일과 일치된 회원임을 확인하고 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.</li>
							<li>③ 해지 : Krispy Kreme 또는 회원이 서비스를 개통 후 이용계약을 해약 하는 것을 말합니다.</li>
						</ul>
						<h5>제 2 장 서비스 이용계약</h5>
						<div class="join1_txttit_1">제 5 조 (이용계약의 성립)</div>
						<ul  class="join1_txttit_1_1">
							<li>① "개인정보 보호를 위한 동의서, 온라인 회원가입 약관에 각각 동의함을 선택하고 "확인" 버튼을 클릭하면 이 약관에 동의하는 것으로 간주됩니다.</li>
							<li>② 이용계약은 서비스 이용희망자의 이용약관 동의 후 신청에 대하여 Krispy Kreme이 승낙함으로써 성립합니다.</li>
						</ul>
						<div class="join1_txttit_1">제 6 조 (이용신청)</div>
						<ul  class="join1_txttit_1_1">
							<li>① 본 서비스를 이용하기 위해서는 Krispy Kreme 소정의 가입신청 양식에서 요구하는 모든 이용자 정보를 기록하여 신청합니다.</li>
							<li>② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 설명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며 서비스의 제한을 받을 수 있습니다.</li>
						</ul>
						<div class="join1_txttit_1">제 7 조 (이용신청의 승낙)</div>
						<ul  class="join1_txttit_1_1">
							<li>① Krispy Kreme은 제6조에 다른 이용 신청 고객에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.</li>
							<li>② Krispy Kreme은 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
								<ol>
									<li>가. 서비스 관련 설비에 여유가 없는 경우</li>
									<li>나. 기술상 지장이 있는 경우</li>
									<li>다. 기타 Krispy Kreme이 필요하다고 인정되는 경우</li>
								</ol>
							</li>
							<li>
								③ Krispy Kreme은 다음에 해당하는 경우에는 이를 승낙하지 아니 할 수 있습니다.
								<ol>
									<li>가. 다른 사람의 명의를 사용하여 신청한 경우</li>
									<li>나. 이용신청 시 이용자정보를 허위로 기재하여 신청한 경우</li>
									<li>다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우</li>
									<li>라. 기타 Krispy Kreme 소정의 이용신청요건을 충족하지 못하는 경우</li>
								</ol>
							</li>
						</ul>

						<div class="join1_txttit_1">제 8 조 (이용자정보의 변경)</div>
						<p>회원은 이용신청 시 기재한 이용자정보가 변경되었을 경우에는, 온라인으로 수정을 하여야 하며 미변경으로 인하여 발생되는 문제의 책임은 이용자에게 있습니다.</p>

						<h5>제 3 장 계약 당사자의 의무</h5>
						<div class="join1_txttit_1">제 9 조 (Krispy Kreme의 의무)</div>
						<ul  class="join1_txttit_1_1">
							<li>① Krispy Kreme은 서비스 제공과 관련하여 취득한 회원의 개인정보를 본인의 사전 승낙 없이 타인에게 공개 또는 배포할 수 없습니다.
								단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
								<ol>
									<li>가. 정보통신망법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우</li>
									<li>나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우</li>
									<li>다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우</li>
								</ol>
							</li>
							<li>② 1항의 범위 내에서, Krispy Kreme은 업무와 관련하여 회원 전체 또는 일부의 개인 정보에 관한 통계 자료를 작성하여 이를 사용할 수 있고, 서비스를 통하여 회원의 컴퓨터 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저의 설정을 변경할 수 있습니다.</li>
						</ul>
						<div class="join1_txttit_1">제 10 조 (회원의 의무)</div>
						<ul  class="join1_txttit_1_1">
							<li>① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
								<ol>
									<li>가. 다른 회원의 정보를 부정하게 사용하는 행위</li>
									<li>나. 서비스에서 얻은 정보를 Krispy Kreme의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위</li>
									<li>다. Krispy Kreme의 저작권, 타인의 저작권 등 기타 귄리를 침해하는 행위</li>
									<li>라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위</li>
									<li>마. 범죄와 결부된다고 객관적으로 판단하는 행위</li>
									<li>바. 기타 관계법령에 위배되는 행위</li>
								</ol>
							</li>
							<li>② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수 하여야 합니다.</li>
							<li>③ 회원은 내용별로 Krispy Kreme이 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.</li>
							<li>④ 회원은 Krispy Kreme의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.</li>
						</ul>
						<h5>제 4 장 서비스 제공 및 이용</h5>
						<div class="join1_txttit_1">제 11 조 (회원 정보와 비밀번호 관리에 대한 회원의 의무)</div>
						<p>
							회원정보에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
							자신의 정보가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 Krispy Kreme에 그 사실을 통보해야 합니다.
						</p>

						<div class="join1_txttit_1">제 12 조 (정보의 제공)</div>
						<p>Krispy Kreme은 회원의 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서 전자메일이나 서신우편, SMS 문자메세지 등의 방법으로 회원에게 제공할 수 있으며, 회원은 서비스를 원하지 않을 경우 서면, 이메일, 전화, 개인정보수정 페이지를 통해 정보수신거부를 할 수 있습니다.</p>

						<div class="join1_txttit_1">제 13 조 (서비스 이용시간)</div>
						<ul  class="join1_txttit_1_1">
							<li>① 서비스는 Krispy Kreme의 업무상 또는 기술상의 장애, 기타 특별한 사유가 없는 한 연중무휴, 1일 24시간 이용할 수 있습니다. 다만 설비의 점검 등 Krispy Kreme이 필요한 경우 또는 설비의 장애, 서비스 이용의 폭주 등 불가항력으로 인하여 서비스 이용에 지장이 있는 경우 예외적으로 서비스 이용의 전부 또는 일부에 대하여 제한할 수 있습니다.</li>
							<li>② Krispy Kreme은 제공하는 서비스 중 일부에 대한 서비스이용시간을 별도로 정할 수 있으며, 이 경우 그 이용시간을 사전에 회원에게 공지 또는 통지 합니다.</li>
						</ul>
						<div class="join1_txttit_1">제 14 조 (서비스 이용 책임)</div>
						<p>
							회원은 서비스를 이용하여 불법 상품을 판매하는 영업 활동을 할 수 없으며 특히 해킹, 돈벌기 광고, 음란사이트를 통한 상업행위, 상용 S/W 불법배포 등을 할 수 없습니다.
							이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 Krispy Kreme이 책임을 지지 않습니다.
						</p>

						<h5>제 5 장 기타</h5>
						<div class="join1_txttit_1">제 15 조 (계약해지 및 이용제한)</div>
						<ul  class="join1_txttit_1_1">
							<li>① 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 Krispy Kreme에 해지신청을 하여야 합니다.</li>
							<li>
							② Krispy Kreme은 회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.
								<ol>
									<li>가. 타인의 정보나 및 비밀번호를 도용한 경우</li>
									<li>나. 서비스 운영을 고의로 방해한 경우</li>
									<li>다. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우</li>
									<li>라. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스이용을 계획 또는 실행하는 경우</li>
									<li>마. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우</li>
									<li>바. 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송한 경우</li>
									<li>사. 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스프로그램 등을 유포하는 경우</li>
									<li>아. Krispy Kreme, 다른 회원 또는 타인의 지적재산권을 침해하는 경우</li>
									<li>자. 정보통신윤리위원회 등 외부기관의 시정요구가 있거나 불법선거 운동과 관련하여 선거관리위원회의 유권해석을 받은 경우</li>
									<li>차. 타인의 개인정보, 이용자ID 및 비밀번호를 부정하게 사용하는 경우</li>
									<li>카. Krispy Kreme의 서비스 정보를 이용하여 얻은 정보를 Krispy Kreme의 사전 승낙없이 복제 또는 유통시키거나 상업적으로 이용하는 경우</li>
									<li>타. 본 약관을 포함하여 기타 Krispy Kreme이 정한 이용조건 및 관계법령에 위반한 경우</li>
								</ol>
								</li>
						</ul>
						<div class="join1_txttit_1">제16 조 (면책조항)</div>
						<ul  class="join1_txttit_1_1">
							<li>① Krispy Kreme은 천재지변 도는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.</li>
							<li>② Krispy Kreme은 회원의 귀책사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임이 면제됩니다.</li>
							<li>③ Krispy Kreme은 회원이 Krispy Kreme의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.</li>
							<li>④ Krispy Kreme은 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 그 내용에 관하여는 책임이 면제됩니다.</li>
						</ul>
						<div class="join1_txttit_1">제 17 조 (관할법원)</div>
						<p>본 약관 상의 분쟁에 대해 소송이 제기될 경우 Krispy Kreme의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.</p>

						<h5>[부칙]</h5>
						<p>(시행일) 이 약관은 2018년 9월 18일부터 시행합니다.</p>
					</div>
										
					<!-- 20130910 -->
					<div class="btn_area_center bd_bottom padb15">					
						<input type="radio" name="agree4" value="Y" id="sel7" title="온라인 회원가입 약관에 동의함" />
						<label for="sel7" style="padding-right:25px">동의함</label>
						
						<input type="radio" name="agree4" value="N" id="sel8" title="온라인 회원가입 약관에 동의안함" />
						<label for="sel8">동의안함</label>
					</div>
					<!-- 20130910 -->
					
				</div>
				<!-- e:privacy_area -->
				<!-- s:btn_area -->
				<div class="btn_area right">
					<input type="image" src="/project/images/util/btn_confirm.gif" alt="확인"  />
					<a href="register_agree1.jsp" class="btns_term"><img src="/project/images/util/btn_cancel.gif" alt="취소" /></a>
				</div>
				<!-- e:btn_area -->
				</form>

			</div>
		</div>
	</div>
</div>
</div>



<%@ include file="../footer.jsp"%>