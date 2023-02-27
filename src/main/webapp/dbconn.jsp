<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연결</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcURL = "jdbc:mysql://localhost:3306/RecipeMarketDB";
	String dbUser = "root";
	String dbPass = "rootpw";
	
	Connection conn = null;
	conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

%>
</body>
</html>