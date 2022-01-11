<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = (String)session.getAttribute("email");
	if(email != null){
		session.invalidate();%>
		<script>
			alert("로그아웃 되셨습니다.");
			location.href="/project/main.jsp";	 
		</script>

	<% }else{%>
		<script>
			alert("로그인 되어있지 않습니다.!");
			location.href="login.jsp";	 
		</script>
<%}%>
	

