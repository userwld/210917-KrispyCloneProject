<%@page import="customer.CustomerDTO"%>
<%@page import="customer.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>고객의소리</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />
<%
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	String number = request.getParameter("num");
	if(email == null){
		out.print("<script>alert('로그인 후 이용가능합니다.'); location.href='/project/member/login.jsp';</script>");
		return;
	}
	if(number == null){
		out.print("<script>alert('게시글을 선택해주세요.'); location.href='list.jsp';</script>");
		return;
	}
	CustomerDAO dao = new CustomerDAO();
	int num = Integer.parseInt(number);
	CustomerDTO dto = dao.selectNum(num);
	
	if(!dto.getEmail().equals(email)){
		out.print("<script>alert('본인이 작성한 글만 수정 가능합니다.'); location.href='list.jsp';</script>");
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
		<li class="snb_1depth"><a href="/project/customer/write.jsp" class="snb_1depth_link"><span class="snb_txt">1:1 고객문의</span></a></li>
		<li class="snb_1depth on"><a href="#" class="snb_1depth_link"><span class="snb_txt">문의글 수정</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/delete.jsp" class="snb_1depth_link"><span class="snb_txt">문의글 삭제</span></a></li>
	</ul>
	
</div>
	<div id="content">
			<div class="content_top clfix">
				<div class="content_tit bg_custom">
					<h4 class="txt">문의글 수정</h4>
					<span class="tit_copy02">문의글을 수정할 수 있습니다.</span>
				</div>
				<!-- s:location include area -->
				<ul class="location_bar clfix" style="background-color: #22741C;">
	<li class="home"><a href="/project/main.jsp" class="bar_item"><img src="/project/images/common/ico_home.gif" alt="홈" /></a></li>
	<li><a href="/project/customer/list.jsp" class="bar_item">고객의소리</a></li>
	<li><a href="#" class="bar_item" title="현재위치">문의글 수정</a></li>
</ul>
</div>
	<form name="frmMain" id="frmMain" method="post" enctype="multipart/form-data" action="modifyService.jsp?num=<%=num%>&&oldFile=<%= dto.getFileName()%>">
			<div class="content_body mgt50">
			<h5 class="txt_tit">문의글 수정</h5>
				<div class="tbl_wrap02">
					<table class="tbl_write">
					<caption>고객상담 내용 입력</caption>
					<colgroup>
						<col width="20%" /><col width="70%" />
					</colgroup>
					<tbody>
						<tr>
							<th class="c_th02" scope="row" >상담구분</th>
							<td>
								<input id="board_type01" type="radio" name="board_type" value="01" <%= dto.getSub().equals("01") ? "checked" : ""  %>/><label for="board_type01">품질</label>				
								<input id="board_type02" type="radio" name="board_type" value="02" <%= dto.getSub().equals("02") ? "checked" : ""  %>/><label for="board_type02">서비스</label>
								<input id="board_type03" type="radio" name="board_type" value="03" <%= dto.getSub().equals("03") ? "checked" : ""  %>/><label for="board_type03">매장환경</label>
								<input id="board_type04" type="radio" name="board_type" value="04" <%= dto.getSub().equals("04") ? "checked" : ""  %>/><label for="board_type04">기타</label>
								<input id="board_type05" type="radio" name="board_type" value="05" <%= dto.getSub().equals("05") ? "checked" : ""  %>/><label for="board_type05">칭찬</label>
								<input id="board_type06" type="radio" name="board_type" value="06" <%= dto.getSub().equals("06") ? "checked" : ""  %>/><label for="board_type06">불만</label>
								<input id="board_type07" type="radio" name="board_type" value="07" <%= dto.getSub().equals("07") ? "checked" : ""  %>/><label for="board_type07">제안</label>
								<input id="board_type08" type="radio" name="board_type" value="08" <%= dto.getSub().equals("08") ? "checked" : ""  %>/><label for="board_type08">문의</label>
							</td>
						</tr>
						
						<tr>
							<th class="c_th02" scope="row"><label for="title">제목</label></th>
							<td><input type="text" name="title" id="title" maxlength="30" value="<%=dto.getTitle() %>" title="제목 입력" style="width:548px" /></td>
						</tr>
						<tr>
							<th class="c_th02" scope="row"><label for="question">내용</label></th>
						
							<td>
								<div class="txt_textarea_block">
									<span class="add_txt h145">※ 글자수 3,500자 (한글2자, 기타 1자)까지 입력 가능합니다.</span> 
									<textarea name="question" id="question" cols="10" rows="10" style="width:548px;height:128px" title="고객상담 내용입력" ><%=dto.getContent() %></textarea>
								</div>
							</td>
					
						</tr>

						<tr class="last multiFileUploader">
							<th class="c_th02 file_wrapper" scope="row"><label for="multiUploader">첨부파일 </label></th>
							<td><label>현재 첨부 파일 : <%=dto.getFileName()==null ? "없음" : dto.getFileName() %> </label><input type="file" id="multiUploader" name="multiUploader"/></td>
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