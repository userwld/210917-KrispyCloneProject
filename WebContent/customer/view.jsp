<%@page import="customer.CustomerCheck"%>
<%@page import="customer.CustomerDTO"%>
<%@page import="customer.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>고객의소리</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />
<%

	String number = request.getParameter("num");
	String pageNumber = request.getParameter("pageNumber");
	if(number == null){
		out.print("<script>alert('해당 게시글이 존재하지 않습니다.'); history.back();</script>");
		return;
	}
	
	CustomerDAO dao = new CustomerDAO();
	CustomerCheck chk = new CustomerCheck();
	int num = Integer.parseInt(number);
	
	dao.updateHit(num);
	CustomerDTO dto = dao.selectNum(num);
	
%>

<h2 class="hide_text">본문 영역</h2>
<div id="container">
<div class="container_inner">
	<div class="content_wrap clfix">
		<!-- s:snb include area -->
		<div class="snb">
	<h3 class="snb_tit"><img src="/project/images/common/snb_tit_customer.png" alt="고객의소리" /></h3>
	<ul class="snb_list">
		<li class="snb_1depth on"><a href="/project/customer/list.jsp?pageNumber=<%=pageNumber %>" class="snb_1depth_link"><span class="snb_txt">전체문의</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/write.jsp" class="snb_1depth_link"><span class="snb_txt">1:1 고객문의</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/modify.jsp?num=<%=num %>" class="snb_1depth_link"><span class="snb_txt">문의글 수정</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/delete.jsp?num=<%=num %>" class="snb_1depth_link"><span class="snb_txt">문의글 삭제</span></a></li>
	</ul>
	
</div>
	
		<div id="content">
			<div class="content_top clfix">
				<div class="content_tit bg_custom">
					<h4 class="txt">게시글 확인</h4>
					<span class="tit_copy02">작성한 글을 자세히 볼 수 있습니다.</span>
				</div>
				<!-- s:location include area -->
				<ul class="location_bar clfix" style="background-color: #22741C;">
	<li class="home"><a href="/project/main.jsp" class="bar_item"><img src="/project/images/common/ico_home.gif" alt="홈" /></a></li>
	<li><a href="/project/customer/list.jsp" class="bar_item">고객의소리</a></li>
	<li><a href="#" class="bar_item" title="현재위치">전제문의</a></li>
</ul>
				<!-- e:location include area -->
			</div>
			
		<div class="content_body mgt50">
			<h5 class="txt_tit">게시글 보기</h5>
			<table class="tbl_list" >
						<caption>게시글 보기</caption>
						<colgroup>
							<col width="15%" /><col width="40%" /><col width="15%" /><col width="15%" /><col width="15%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><%=chk.changeSub(dto.getSub()) %></th>
								<th scope="col"><%=dto.getTitle() %></th>
								<th scope="col"><%=dto.getWriter() %></th>
								<th scope="col">조회수 : <%=dto.getHit() %></th>
								<th scope="col"><%=dto.getRegDate() %></th>

							</tr>
						</thead>
						<tbody>

						<tr>
							<td colspan="5" bgcolor="white">
								<div id = content style="height: 300px;" align="left">
								<%=dto.getContent() %>
								</div>
									
							</td>
						</tr>
						<tr>
							<td colspan="5" bgcolor="white">
							<%if(dto.getFileName() == null){ %>
								<div align="left"> 첨부파일 : 첨부파일 없음</div>
							<% }else{%>
								<div align="left"> 첨부파일 : <a href="download.jsp?fileName=<%=dto.getFileName()%>"> <%=dto.getFileName() %></a></div>
							<%}%>
							</td>
						</tr>

						</tbody>
						</table>
					</div>
					<div class="btn_area02">
					<input type="image" src="/project/images/common/btn_modify.gif" alt="수정" onclick="location.href='modify.jsp?num=<%=num%>'"/>
					<a href="delete.jsp?num=<%=num %>"><img src="/project/images/common/delete.png" alt="삭제" style="height: 29px"/></a>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../footer.jsp" %>