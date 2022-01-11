<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	// modify접근시 비밀번호 인증하고 modify mode변경해서 화면 변경하는곳
	
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	String pw = request.getParameter("pw");
	
	if(email == null){
		out.print("<script>location.href='login.jsp';</script>");
		return;
	}
	if(pw == "" || pw == null){
		out.print("<script>location.href='modify.jsp?mode=pwAuth';</script>");
		return;
	}
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.selectEmail(email);
	
	if(dto == null || !dto.getPw().equals(pw)){
		out.print("<script>alert('비밀번호가 틀렸습니다.');location.href='modify.jsp?mode=pwAuth';</script>");
		return;
	}
	
		
%>
<script>
	
	location.href="modify.jsp?mode=modify";
</script>
