<%@page import="customer.CustomerCheck"%>
<%@page import="customer.CustomerList"%>
<%@page import="customer.CustomerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="customer.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<title>고객의소리</title>
<link href="/project/css/util.css?2021" type="text/css" rel="stylesheet" />

<%--
java.sql.SQLException: Listener refused the connection with the following error:
ORA-12519, TNS:no appropriate service handler found 
--> 리스트쪽 계속 글올렸다 삭제하거나 검색 계속하면 데이터베이스 과부하로 페이지 안열리는 현상 발생..(회원수정페이지까지 안열림!!)
--> 다른 영역에서 null을 발생시킴!

 톰캣 재실행 하면 페이지 접근 가능
 
 해결 시도  1 : DAO쪽 ps와 rs 사용 후 닫기 --> 여전히 발생
 해결 시도  2 : 프로세스를 늘린다 ?? alter system set processes=300 scope=spfile; --> 많이 나아졌지만 완전해결은 못함!
 
 --%>

<%
	request.setCharacterEncoding("utf-8");
	String mode = request.getParameter("mode");
	String condition = request.getParameter("condition");
	String data = request.getParameter("data");
	
	CustomerDAO dao = new CustomerDAO();
	CustomerCheck chk = new CustomerCheck();
	ArrayList<CustomerDTO> list = null;
	
	if(mode!=null && mode.equals("search")){
		if(data == null || data == ""){
			out.print("<script>alert('검색어를 입력해주세요');</script>");
			return;
		}else{
			list = dao.search(condition,data);
		}
	}else{
		list = dao.selectAll();
	}
	
	CustomerList cl = new CustomerList();
	String pn = request.getParameter("pageNumber");
	cl.setPageNumber(pn);
	
	if(list != null){
		cl.setRecord(list.size());
	}

%>
<script>
	function formSubmit(){
		inputData = document.getElementById("inputData").value;
		if(inputData == ""){
			alert('검색어를 입력해주세요');
			return;
		}

		frmSearch.submit();
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
		<li class="snb_1depth on"><a href="/project/customer/list.jsp?pageNumber=<%=cl.getPageNumber() %>" class="snb_1depth_link"><span class="snb_txt">전체문의</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/write.jsp" class="snb_1depth_link"><span class="snb_txt">1:1 고객문의</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/modify.jsp" class="snb_1depth_link"><span class="snb_txt">문의글 수정</span></a></li>
		<li class="snb_1depth"><a href="/project/customer/delete.jsp" class="snb_1depth_link"><span class="snb_txt">문의글 삭제</span></a></li>
	</ul>
	
</div>
	
		<div id="content">
			<div class="content_top clfix">
				<div class="content_tit bg_custom">
					<h4 class="txt">전체문의</h4>
					<span class="tit_copy02">모든 문의글을 볼 수 있습니다.</span>
				</div>
				<!-- s:location include area -->
				<ul class="location_bar clfix" style="background-color: #22741C;">
	<li class="home"><a href="/project/main.jsp" class="bar_item"><img src="/project/images/common/ico_home.gif" alt="홈" /></a></li>
	<li><a href="/project/customer/list.jsp" class="bar_item">고객의소리</a></li>
	<li><a href="#" class="bar_item" title="현재위치">전제문의</a></li>
</ul>
				<!-- e:location include area -->
		</div>
		
	
		<div class="content_body">
				<div class="tbl_search_wrap">
				<div class="tbl_wrap">
					
					<form name="frmSearch" id="frmSearch" method="post"  action="list.jsp?mode=search">
					<div class="search_box" align="right">
						<select title="검색 분류 선택" style="width:78px" name="condition" id="schType">
							<option value="title" >제목</option>
							<option value="writer" >작성자</option>							
							<option value="content" >내용</option>

						</select>
						<input type="text" id = "inputData" name="data" value="" title="검색어 입력" style="width:198px;" /> <img src="/project/images/common/btn_search.gif" style = "cursor: pointer;" alt="검색" onclick="formSubmit()"/>
					</div>
					</form>
				
						<div class="total_board_num">Total <em><%=cl.getPageNumber() %></em> / <%=cl.getTotalPage() < 1 ? 1 : cl.getTotalPage() %></div>
						<table class="tbl_list" style="width: 850px;" >
						<caption>전체문의</caption>
						<colgroup>
							<col width="8%" /><col width="10%" /><col width="40%" /><col width="10%" /><col width="10%" /><col width="12%" /><col width="10%" />
						</colgroup>
						<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">상담구분</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">조회수</th>
									<th scope="col">등록일</th>
	
								</tr>
						</thead>
						<tbody>
							<% 
								if(list.size() != 0 && list != null){
									for(int i= cl.getStart(); i < (cl.getScroll()+cl.getStart()) && i < cl.getRecord(); i++){
										CustomerDTO dto = list.get(i);
										int num = dto.getNum(); %>
									<tr>
										<td><%=num%></td>
										<td><%=chk.changeSub(dto.getSub())%></td>
										<td style="cursor: pointer;"><a href="view.jsp?num=<%=num%>&pageNumber=<%=cl.getPageNumber()%>"><%=dto.getTitle() %></a></td>
										<td><%=dto.getWriter() %></td>
										<td><%=dto.getHit() %></td>
										<td><%=dto.getRegDate() %></td>
		
									</tr>

							<%}}else{%>
								<tr>
									<td colspan="6" class="last">등록된 내용이 없습니다.</td>
								</tr>
							<%} %>
						</tbody>
						</table>
					</div>
				

					<div class="pagenation"> <!-- 다음페이지 부분 삼항연산자 두번써서 컨트롤, 전체페이지가0일 경우에(게시글없음) 다음으로 누르면 1페이지로 이동 -->
						<a class='btn' href="list.jsp?pageNumber=1"><img src="/project/images/common/btn_all_prev.png" alt="맨 처음으로" width="33" /></a><a class='btn' href="list.jsp?pageNumber=<%=cl.getPageNumber() >= 2 ? cl.getPageNumber()-1 : 1%>"><img src="/project/images/common/btn_prev.png" alt="이전으로" width="37" /></a><a class='on'><%=cl.getPageNumber() %></a>
						<a class='btn' href="list.jsp?pageNumber=<%= cl.getPageNumber() < cl.getTotalPage() ? cl.getPageNumber() +1 : cl.getTotalPage() < 1 ? 1 : cl.getTotalPage()%>"><img src="/project/images/common/btn_next.png" alt="다음으로" width="37" /></a><a class='btn' href="list.jsp?pageNumber=<%=cl.getTotalPage() < 1 ? 1 : cl.getTotalPage()%>"><img src="/project/images/common/btn_all_next.png" alt="맨 끝으로" width="33" /></a>
					</div>
					
				</div>
					<div class="btn_area02">
						<a href="write.jsp"><img src="/project/images/customer/btn_c_question.gif" alt="1:1 고객문의" /></a>
					</div>
			</div>
		</div>
	</div>
</div>
</div>
<%@ include file="../footer.jsp"%>