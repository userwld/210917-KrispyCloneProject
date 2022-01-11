<%@page import="customer.CustomerCheck"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="customer.CustomerDTO"%>
<%@page import="customer.CustomerDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String email = (String)session.getAttribute("email");
	CustomerCheck chk = new CustomerCheck();
	
	if(email == null){
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='/project/member/login.jsp';</script>");
		return;
	}
	
		
	String saveFolder = "C:\\care_upfile\\fileStorage";
	File dirCheck = new File(saveFolder);
	if( dirCheck.exists() == false)
		dirCheck.mkdirs();
	
	String encType="utf-8";
	int maxSize = 5 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String sub = multi.getParameter("board_type");
	String title = multi.getParameter("title");
	String content = multi.getParameter("question");
	String fileName = multi.getFilesystemName("multiUploader");

	if(chk.emptyCheck(sub, title, content) == false){
		out.print("<script>alert('빈항목 존재'); location.href='write.jsp';</script>");
		return;
	}
	
	CustomerDAO dao = new CustomerDAO();
	CustomerDTO dto = new CustomerDTO();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	String date = sdf.format(new Date());
	
	dto.setSub(sub); dto.setTitle(title); dto.setWriter((String)session.getAttribute("name"));
	dto.setRegDate(date); dto.setContent(content); dto.setFileName(fileName);dto.setEmail(email);
	
	dao.insert(dto);

%>

<script>
	alert("글이 등록되었습니다.");
	location.href='list.jsp';
</script>