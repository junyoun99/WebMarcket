<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 삭제</title>
</head>
<body>
<%@include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String recipeId = request.getParameter("recipeId");	//recipe id


	String userId = (String)session.getAttribute("id");	//user id
	
	Statement stmt = null;
	
	try{
		String sql = "delete from recipe where id = '" + recipeId + "' and user_id = '" + userId + "'";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	stmt.close();
	conn.close();
	response.sendRedirect("myRecipe.jsp");
%>
</body>
</html>