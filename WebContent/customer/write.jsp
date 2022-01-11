<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>고객의소리</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />
<%
	String email = (String)session.getAttribute("email");
	if(email == null){
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='/project/member/login.jsp';</script>");
		return;
	}
%>

<script>

function checkData() {
	var frm = document.frmMain;

	num_temp = document.all.board_type.length;
	for(i=0; i<num_temp; i++){
		if(document.all.board_type[i].checked==true){
		break;
		}
	}
	if(i==num_temp){
		alert("상담구분을 선택해주세요.");
		frm.board_type01.focus();
		return;
	}
	
	if(frm.title.value == ""){
		alert("제목을 입력해주세요");
	    frm.title.focus();
        return;
	}
	
	if(frm.question.value == ""){
		alert("내용을 입력해주세요");
	    frm.question.focus();
        return;
	}
	
	if (frm.question.value.length > 3500 ) {
        alert ("내용은 3,500자 이상 입력불가능합니다.");
        frm.question.focus();
        return;
    }

	frm.submit();
}
</script>

<h2 class="hide_text">본문 영역</h2>
<div id="container">
<div class="container_inner">
	<div class="content_wrap clfix">
		<!-- s:snb include area -->
		<div class="snb">
	<h3 class="snb_tit"><img src="/project/images/common/snb_tit_customer.png" alt="고객의소리" /></h3>
	<ul class="snb_list">
		<li class="snb_1depth"><a href="/project/customer/list.jsp" class="snb_1depth_link"><span class="snb_txt">전체문의</span></a></li>
		<li class="snb_1depth on"><a href="/project/customer/write.jsp" class="snb_1depth_link"><span class="snb_txt">1:1 고객문의</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/modify.jsp" class="snb_1depth_link"><span class="snb_txt">문의글 수정</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/delete.jsp" class="snb_1depth_link"><span class="snb_txt">문의글 삭제</span></a></li>
	</ul>
	
</div>
	<div id="content">
			<div class="content_top clfix">
				<div class="content_tit bg_custom">
					<h4 class="txt">1:1 고객문의</h4>
					<span class="tit_copy02">고객님께서 궁금하신 사항을 문의해주세요.</span>
				</div>
				<!-- s:location include area -->
				<ul class="location_bar clfix" style="background-color: #22741C;">
	<li class="home"><a href="/project/main.jsp" class="bar_item"><img src="/project/images/common/ico_home.gif" alt="홈" /></a></li>
	<li><a href="/project/customer/list.jsp" class="bar_item">고객의소리</a></li>
	<li><a href="#" class="bar_item" title="현재위치">1:1문의</a></li>
</ul>
</div>
	<form name="frmMain" id="frmMain" method="post" enctype="multipart/form-data" action="writeService.jsp">
			<div class="content_body mgt50">
			<h5 class="txt_tit">고객상담</h5>
				<div style="margin-bottom:10px">
					* 고객의소리 등록 시 개인정보문제로 인하여 제목/내용에 개인정보(이름, 연락처, 이메일 등) 입력을 지양해 주시면 감사하겠습니다.<br />
					* 기재오류 및 계정문제가 발생한 경우에는 답변이 불가능 할 수 있음으로 연락처 및 메일 주소를 정확하게 기입해 주시길 바랍니다.<br />
					* 관계 법령에 저촉되거나 사회통념 등에 어긋나는 내용(예: 개인정보보안, 불충분한 증거/귀책 사유에 대한 개인 음해성/음란성 비방, <br />&nbsp;&nbsp;&nbsp;의도적인 업무 방해 등)  또는 광고성 게시물은 별도의 사전 통보 없이 답변이 되지 않을 수 있으며, 등록된 의견은 처리가 시작되면<br />&nbsp;&nbsp;&nbsp;수정이 불가하오니이 점 양지하여 주시기 바랍니다.<br />
					* 공정거래위원회에서 고시한 소비자분쟁해결기준에 의거 소비자 피해에 대한 교환/환불 처리 해드립니다. <br />
					<span style="font-family:'Nanum GothicE'">
						* 모바일쿠폰 오류 또는 문의사항은 고객의소리를 통한 안내가 어렵습니다.<br />&nbsp;&nbsp;&nbsp;아래 각 쿠폰 별 “고객센터”를 통해 유선문의 부탁드립니다. <br />
						<span style="color:#d31145">
							&nbsp;&nbsp;&nbsp;- 일반쿠폰 문의 : 1644-4276 (기프티엘 고객센터) <br />
							&nbsp;&nbsp;&nbsp;- 구독쿠폰 문의 : 1522-2552 (롯데e-쿠폰 고객센터)
						</span>
					</span>
				</div>
				<div class="tbl_wrap02">
					<table class="tbl_write" >
					<caption>고객상담 내용 입력</caption>
					<colgroup>
						<col width="20%" /><col width="70%" />
					</colgroup>
					<tbody>
						<tr>
							<th class="c_th02" scope="row" >상담구분</th>
							<td>
								<input id="board_type01" type="radio" name="board_type" value="01" /><label for="board_type01">품질</label>
								<input id="board_type02" type="radio" name="board_type" value="02" /><label for="board_type02">서비스</label>
								<input id="board_type03" type="radio" name="board_type" value="03" /><label for="board_type03">매장환경</label>
								<input id="board_type04" type="radio" name="board_type" value="04" /><label for="board_type04">기타</label>
								<input id="board_type05" type="radio" name="board_type" value="05" /><label for="board_type05">칭찬</label>
								<input id="board_type06" type="radio" name="board_type" value="06" /><label for="board_type06">불만</label>
								<input id="board_type07" type="radio" name="board_type" value="07" /><label for="board_type07">제안</label>
								<input id="board_type08" type="radio" name="board_type" value="08" /><label for="board_type08">문의</label>
							</td>
						</tr>
						
						<tr>
							<th class="c_th02" scope="row"><label for="title">제목</label></th>
							<td><input type="text" name="title" id="title" maxlength="30" value="" title="제목 입력" style="width:548px" /></td>
						</tr>
						<tr>
							<th class="c_th02" scope="row"><label for="question">내용</label></th>
							<!-- 20130910 -->
							<td>
								<div class="txt_textarea_block">
									<span class="add_txt h145">※ 글자수 3,500자 (한글2자, 기타 1자)까지 입력 가능합니다.</span> 
									<textarea name="question" id="question" cols="10" rows="10" style="width:548px;height:128px" title="고객상담 내용입력"></textarea>
								</div>
							</td>
						</tr>

						<tr class="last multiFileUploader">
							<th class="c_th02 file_wrapper" scope="row"><label for="multiUploader">첨부파일</label></th>
							<td><input type="file" id="multiUploader" name="multiUploader" /></td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="btn_area02">
					<a href="javascript:checkData();"><img src="/project/images/common/btn_check.gif" alt="확인" /></a>
					<a href="javascript:history.back();"><img src="/project//images/common/btn_cancel.gif" alt="취소" /></a>
				</div>
			
			</div>
			</form>
			
</div></div></div></div>

<%@ include file="../footer.jsp"%>