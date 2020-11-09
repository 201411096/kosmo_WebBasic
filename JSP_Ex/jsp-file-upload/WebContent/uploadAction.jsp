<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 업로드한 파일들의 이름이 같다면 오류가 발생하지 않도록 파일의 이름을 변경 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<%
		/* String directory = application.getRealPath("/upload/"); //전체 프로젝트에 대한 자원을 관리하는 객체(서버의 실제 프로젝트 경로에서 자원을 찾을 떄 많이 사용) \.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\File Upload에 생성해둔 upload 폴더(업로드 처리 페이지) */
		String directory = "C:/JSP_test/upload/";
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		while(fileNames.hasMoreElements()){
			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);
			
			if(fileName == null) continue;
			if(!fileName.endsWith(".doc") && !fileName.endsWith(".hwp") && !fileName.endsWith(".pdf") && !fileName.endsWith(".xls")){ 
				File file = new File(directory + fileRealName);
				file.delete();
				out.write("업로드할 수 없는 확장자입니다. <br>");
			}else{
				new FileDAO().upload(fileName, fileRealName);
				out.write("파일명 : " + fileName + "<br>");
				out.write("실제 파일명 : " + fileRealName + "<br>");
			}
			
		}
		
		
		
		
	%>

</body>
</html>