<%@page import="java.io.File"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="customer.CustomerDTO"%>
<%@page import="customer.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String number = request.getParameter("num");
	String email = (String)session.getAttribute("email");
	String pw = request.getParameter("pw");
	
	if(email == null){
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='/project/member/login.jsp';</script>");
		return;
	}
	if(number == null){
		out.print("<script>alert('선택된 게시글이 없습니다.'); location.href='list.jsp';</script>");
		return;
	}

	if(pw == "" || pw == null){
		out.print("<script>alert('비밀번호를 입력해주세요.'); history.back();</script>");
		return;
	}
	
	MemberDAO memDao = new MemberDAO();
	MemberDTO memDto = memDao.selectEmail(email);
	
	if(!memDto.getPw().equals(pw)){
		out.print("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
		return;
	}
	
	CustomerDAO dao = new CustomerDAO();
	int num = Integer.parseInt(number);
	CustomerDTO dto = dao.selectNum(num);
	
	if(!dto.getEmail().equals(email)){
		out.print("<script>alert('작성자만 삭제가 가능합니다.');</script>");
	}else{
		dao.delete(num);
		out.print("<script>alert('게시글이 삭제되었습니다.');</script>");
	}
	
	String fileName = dto.getFileName();
	String saveDir = "C:\\care_upfile\\fileStorage";

	File file = new File(saveDir+"/"+fileName);
	if(file.exists())
		file.delete();
%>

<script>
	location.href="list.jsp";
</script>