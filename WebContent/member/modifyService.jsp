<%@page import="member.InputCheck"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String name = (String)session.getAttribute("name");
String email = (String)session.getAttribute("email");
String pw = request.getParameter("newPw");
String confirmPw = request.getParameter("newPwConfirm");
String pwQuestion = request.getParameter("pwQuestion");
String pwAnswer = request.getParameter("pwAnswer");
String zipcode = request.getParameter("zipcode");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");

if(email == null){
	out.print("<script>location.href='login.jsp'</script>");
	return;
}

String address = zipcode + "&-" + address1 + "&-" + address2;
String mobile = phone1 + "-" + phone2 + "-" + phone3;

MemberDTO dto = new MemberDTO(name,email,pw,pwQuestion,pwAnswer,address,mobile);
InputCheck inputChk = new InputCheck();

if(inputChk.nullCheck(dto) == false){
	out.print("<script>location.href='modify.jsp?mode=modify';</script>");
	return;	
}

if(inputChk.emptyCheck(dto) == false){
	out.print("<script>location.href='modify.jsp?mode=modify';</script>");
	return;
}

if(inputChk.equalPw(pw, confirmPw) == false){
	out.print("<script>location.href='modify.jsp?mode=modify';</script>");
	return;
}

if(inputChk.pwCheck(pw) == false){	
	out.print("<script>location.href='modify.jsp?mode=modify';</script>");
	return;
}

if(inputChk.mobileCheck(phone2, phone3) == false){
	out.print("<script>location.href='modify.jsp?mode=modify';</script>");
	return;
}

MemberDAO dao = new MemberDAO();
dao.update(dto);


%>

<script>
alert("정보가 수정되었습니다.변경사항 적용을 위해 로그인을 다시해주세요!");
location.href = "logout.jsp";
</script>
