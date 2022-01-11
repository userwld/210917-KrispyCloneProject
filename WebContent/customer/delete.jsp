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
		out.print("<script>alert('본인이 작성한 글만 삭제 가능합니다.'); location.href='list.jsp';</script>");
		return;
	}

%>

<script>
	function deleteCheck(){
		pw = document.getElementById("pw").value;
		if(pw == ""){
			alert('비밀번호를 입력해주세요.');
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
	<h3 class="snb_tit"><img src="/project/images/common/snb_tit_customer.png" alt="고객의소리" /></h3>
	<ul class="snb_list">
		<li class="snb_1depth"><a href="/project/customer/list.jsp" class="snb_1depth_link"><span class="snb_txt">전체문의</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/write.jsp" class="snb_1depth_link"><span class="snb_txt">1:1 고객문의</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/modify.jsp" class="snb_1depth_link"><span class="snb_txt">문의글 수정</span></a></li>
		<li class="snb_1depth on"><a href="#" class="snb_1depth_link"><span class="snb_txt">문의글 삭제</span></a></li>
	</ul>
	
</div>
	
		<div id="content">
			<div class="content_top clfix">
				<div class="content_tit bg_custom">
					<h4 class="txt">문의글 삭제</h4>
					<span class="tit_copy02">문의글을 삭제할 수 있습니다.</span>
				</div>
				<!-- s:location include area -->
				<ul class="location_bar clfix" style="background-color: #22741C;">
	<li class="home"><a href="/project/main.jsp" class="bar_item"><img src="/project/images/common/ico_home.gif" alt="홈" /></a></li>
	<li><a href="/project/customer/list.jsp" class="bar_item">고객의소리</a></li>
	<li><a href="#" class="bar_item" title="현재위치">문의글 삭제</a></li>
</ul>
				<!-- e:location include area -->
			</div>
			
	<div class="content_body mgt50">
	<h5 class="txt_tit">문의글 삭제</h5>
	<form name="frmMain" method="post" id="delete" onsubmit="return deleteCheck();" action="deleteService.jsp?num=<%=num%>">
	<div class="tbl_wrap02">
					<div class="info_pw_box">
						<p class="txt_info">게시글을 삭제하기 위해 비밀번호를 다시 한번 확인 합니다. <br /> 항상 비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</p>
					</div>
					<p class="txt_tit">비밀번호 입력</p>
					<table class="tbl_view" summary="문의글 삭제를 위해 비밀번호를 입력해주세요.">
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