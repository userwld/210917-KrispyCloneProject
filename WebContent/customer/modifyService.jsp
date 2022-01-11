<%@page import="customer.CustomerCheck"%>
<%@page import="customer.CustomerDTO"%>
<%@page import="customer.CustomerDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String email = (String)session.getAttribute("email");
	String number = request.getParameter("num");
	String oldFile = request.getParameter("oldFile");
		
	CustomerCheck chk = new CustomerCheck();
	
	if(email == null){
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='/project/member/login.jsp';</script>");
		return;
	}
	if(number == null){
		out.print("<script>alert('선택된 게시글이 없습니다.'); location.href='list.jsp';</script>");
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
		out.print("<script>alert('빈항목 존재'); history.back();</script>");
		return;
	}
	
	CustomerDAO dao = new CustomerDAO();
	int num = Integer.parseInt(number);
	CustomerDTO dto = dao.selectNum(num);
	dto.setSub(sub); dto.setTitle(title); dto.setContent(content); 
	
	if(fileName != null){				// 수정시 파일 새로 올렸으면 파일 바꿈, 파일 새로 안올렸으면 업로드 파일 그대로 유지되게!, 기존 업로드 파일이 있다면 삭제.
		dao.modifyUpFile(fileName, num);
		if(oldFile != null){
			File file = new File(saveFolder+"/"+oldFile);
			if(file.exists())
				file.delete();
		}
	}
	
	dao.modify(dto);

%>

<script>
	alert("글이 수정되었습니다.");
	location.href='list.jsp';
</script>