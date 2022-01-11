<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = (String)session.getAttribute("email");
	if(email == null){
		out.print("<script>alert('파일 다운로드는 로그인 후 가능합니다.'); location.href='/project/member/login.jsp';</script>");
		return;
	}
		
	// 경로 설정
	String fileName = request.getParameter("fileName");
    String saveDir = "C:\\care_upfile\\fileStorage";	// 실제 경로로 지정해야 톰캣종료시에도 안사라진다.
    
	File file = new File(saveDir+"/"+fileName);
	
	// 파일 유형 설정
	response.setContentType("application/octet-stream");
	

	// 전송 객체에 현재 파일을 붙여서 보내겠다(content-disposition)(attachment(부착)). 
	response.setHeader("Content-Disposition","attachment;filename=\"" + fileName + "\";");
	
	// 요청된 파일을 읽어서 클라이언트쪽으로 저장한다.
	FileInputStream fileInputStream = new FileInputStream(file);
	ServletOutputStream servletOutputStream = response.getOutputStream();

	byte b [] = new byte[1024];
	int data = 0;
	
	while((data = fileInputStream.read(b, 0 ,b.length)) != -1){
	
		servletOutputStream.write(b, 0, data);
	}

	servletOutputStream.close();
	fileInputStream.close();
	response.sendRedirect("view.jsp");

%>

    