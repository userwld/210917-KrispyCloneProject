<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");
	String remember = request.getParameter("remember");
		
	if(email == "" || pw == "" || email == null || pw == null){
		out.print("<script>alert('로그인 실패'); location.href='login.jsp'</script>");
	}
	
	if(remember != null){					// 이메일 저장시 쿠키생성(로그인 성공여부와 무관하게 생성)
		Cookie cookie = new Cookie("email",email);
		response.addCookie(cookie);
	}else{
		Cookie cookie = new Cookie("email","");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.selectEmail(email);
	
	if(dto == null){
		out.print("<script>alert('가입되지 않은 계정입니다.'); history.back();</script>");
		return;
	}
	
	if(!dto.getPw().equals(pw)){
		out.print("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
		return;
	}
	
	session.setAttribute("name", dto.getName());
	session.setAttribute("email", dto.getEmail());

%>

<script>
	alert('<%=dto.getName()%> 님 환영합니다.');
	location.href="/project/main.jsp";
</script>
