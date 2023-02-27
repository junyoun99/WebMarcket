<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String userId = (String)session.getAttribute("id");
	String recipeId = request.getParameter("recipeId");
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into bookmark(userId, recipeId, regdate) values(?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	Date time = new Date();
	
	String time1 = format1.format(time);
	
	
	pstmt.setString(1, userId);
	pstmt.setString(2, recipeId);
	pstmt.setString(3, time1);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
%>

<script>
	alert("즐겨찾기에 추가되었습니다.");
	history.back();
</script>
</body>
</html>