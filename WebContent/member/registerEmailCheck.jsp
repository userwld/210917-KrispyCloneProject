<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 자바스크립트에서 아이디 중복확인을 위한 페이지(중복확인 통과시에만 이메일 인증값 "Y"로 넘겨줌)
	
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.selectEmail(email);
	
	if(dto == null){
		out.print("사용 가능한 이메일 입니다.<br><br>");
		out.print("<script>opener.frmMain.duChk.value = 'Y';</script>");
	}else{
		out.print("중복된 이메일 입니다.<br><br>");
		out.print("<script>opener.frmMain.duChk.value = 'N';</script>");
	}
	
	
%>

<input type="button" value="닫기" onclick="window.close();">
