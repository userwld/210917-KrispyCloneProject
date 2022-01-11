<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.InputCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String emailId = request.getParameter("emailId");
	String emailDomain = request.getParameter("emailDomain");
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");
	String pwQuestion = request.getParameter("pwQuestion");
	String pwAnswer = request.getParameter("pwAnswer");
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	
	InputCheck inputChk = new InputCheck();
	
	if(inputChk.nullCheck(name, emailId, emailDomain, pw, confirmPw, pwQuestion, pwAnswer, zipcode, address1, address2, phone1, phone2, phone3) == false){
		out.print("<script>location.href='register_final.jsp';</script>");
		return;	
	}
	
	if(inputChk.emptyCheck(name,emailId,emailDomain,pw,confirmPw,pwQuestion,pwAnswer,
			zipcode, address1, address2, phone1, phone2, phone3) == false){
		out.print("<script> alert('회원가입 실패'); location.href='register_final.jsp';</script>");	// 실패시 final로 돌림 -> final로 가면 name==null이라서 동의1페이지로 이동됨
		return;
	}
	if(inputChk.emailCheck(emailId, emailDomain) == false){
		out.print("<script> alert('회원가입 실패'); location.href='register_final.jsp;'</script>");
		return;
	}
	if(inputChk.equalPw(pw, confirmPw) == false){
		out.print("<script> alert('회원가입 실패'); location.href='register_final.jsp';</script>");
		return;
	}
	if(inputChk.pwCheck(pw) == false){	
		out.print("<script> alert('회원가입 실패'); location.href='register_final.jsp';</script>");
		return;
	}
	if(inputChk.mobileCheck(phone2, phone3) == false){
		out.print("<script> alert('회원가입 실패'); location.href='register_final.jsp';</script>");
		return;
	}
	
	String email = emailId + "@" + emailDomain;
	String address = zipcode + "&-" + address1 + "&-" + address2;		// 회원수정페이지에 split으로 분리해서 넣기 위해서 구분문자 넣음
	String mobile = phone1 + "-" + phone2 + "-" + phone3;
	MemberDAO dao = new MemberDAO();
	MemberDTO alreadyCheck = dao.selectEmail(email);
	
	if(alreadyCheck != null){
		out.print("<script>alert('중복이메일');</script>");
		out.print("<script>location.href='register_final.jsp';</script>");
		return;
	}
	
	MemberDTO dto = new MemberDTO(name,email,pw,pwQuestion,pwAnswer,address,mobile);
	dao.insert(dto);
	
%>

<script>
	alert("회원가입을 축하합니다!");
	location.href = "login.jsp";
</script>




