<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	String pw = request.getParameter("pw");
	
	if(email == null){
		out.print("<script>location.href='login.jsp';</script>");
		return;
	}
	
	if(pw == "" || pw == null){
		out.print("<script>location.href='delete.jsp';</script>");
		return;
	}
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.selectEmail(email);
	
	if(!pw.equals(dto.getPw())){
		out.print("<script>alert('비밀번호가 틀렸습니다.');location.href='delete.jsp';</script>");
		return;
	}
	
	dao.delete(dto);
	session.invalidate();	// 회원탈퇴시 로그인때 생성된 세션 삭제
%>
<script>
	alert("회원 탈퇴 되셨습니다.");
	location.href="/project/main.jsp";
</script>