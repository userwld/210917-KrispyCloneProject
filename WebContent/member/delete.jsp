<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>탈퇴</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />
<%
	String email = (String)session.getAttribute("email");
	
	if(email == null){
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='login.jsp';</script>");
		return;
	}
	
%>
<script>

function checkValues(frm) {	
	pw = document.getElementById("pwd").value;
	if(pw == ""){
		alert('비밀번호를 입력해주세요');
		return false;
	}
	
	if (confirm('탈퇴 하시겠습니까?')) {
		return true;
	}
	else
		return false;
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
		<li class="snb_1depth"><a href="/project/member/modify.jsp?mode=pwAuth" class="snb_1depth_link"><span class="snb_txt">개인정보수정</span></a></li>
		<li class="snb_1depth on"><a href="/project/member/delete.jsp" class="snb_1depth_link"><span class="snb_txt">회원탈퇴</span></a></li>
	</ul>
</div>
		<!-- e:snb include area -->

	
	<div id="content">
		<div class="content_top clfix">
			<div class="content_tit bg_mypage">
				<h4 class="txt">회원탈퇴</h4>
				<p class="tit_copy02">온라인 회원 탈퇴를 하시면 고객님의 모든 기록이 삭제되므로 신중히 선택해 주세요.</p>
			</div>
			<!-- s:location include area -->
			<ul class="location_bar clfix" style="background-color: #22741C;">
	<li class="home"><a href="/project/main.jsp" class="bar_item"><img src="/project/images/common/ico_home.gif" alt="홈" /></a></li>
<li><a href="/project/member/modify.jsp?mode=pwAuth" class="bar_item">마이페이지</a></li>
<li><a href="#" class="bar_item" title="현재위치">회원탈퇴</a></li>
</ul>
				<!-- e:location include area -->
			</div>
			
			
			<div class="content_body mgt50">
				<ul class="list_type01 mgt50">
					<li>회원 탈퇴를 하시면 참여 내역 등의 정보가 삭제되고 회원전용 메뉴를 이용하실 수 없습니다.</li>
					<li>탈퇴하시면 탈퇴 후 즉시 개인정보가 파기 처리 됩니다.</li>
				</ul>
				<form name="frmMain" id="frmMain" method="post" action="deleteService.jsp" onsubmit="return checkValues(this);">
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
							<td><input type="password" id="pwd" name="pw" value="" maxlength="20" title="비밀번호 입력" style="width:198px" /></td>
						</tr>						
					</tbody>
					</table>
				</div>

				<div class="btn_area right">
					<input type="image" src="/project/images/util/btn_confirm.gif" alt="확인" />
					<a href="javascript:history.back();" class="btns_term"><img src="/project/images/util/btn_cancel.gif" alt="취소" /></a>
				</div>

				</form>
			</div>


		</div>
	</div>
</div>
</div>

			

<%@ include file="../footer.jsp"%>