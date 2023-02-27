<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 추가</title>
</head>
<body>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String filename = "";
	String realFolder = "./images/";
	int maxSize = 5*1024*1024;
	String encType = "utf-8";
	String filePath = application.getRealPath(realFolder);
	
	MultipartRequest multi = new MultipartRequest(request,
			filePath, maxSize, encType, new DefaultFileRenamePolicy());
	

	String recipeId 	= multi.getParameter("recipeId");
	String recipeName 		= multi.getParameter("recipeName");
	String kind 		= multi.getParameter("kind");
	String ingredients 	= multi.getParameter("ingredients");
	String recipeContent = multi.getParameter("recipeContent");
	
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	Date time = new Date();
	
	String time1 = format1.format(time);
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	filename = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	
	String name = (String)request.getAttribute("name");
	if (name == null){
		name = request.getParameter("name");
	}
	
	String sql = "insert into recipe values(?,?,?,?,?,?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	
	String user_id = (String)session.getAttribute("id");
	
	pstmt.setString(1, recipeId);
	pstmt.setString(2, user_id);
	pstmt.setString(3, recipeName);
	pstmt.setString(4, kind);
	pstmt.setString(5, ingredients);
	pstmt.setString(6, recipeContent);
	pstmt.setString(7, filename);
	pstmt.setString(8, time1);
	pstmt.setInt(9, 0);
	
	
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	
	response.sendRedirect("myRecipe.jsp");
	
%>


</body>
</html>