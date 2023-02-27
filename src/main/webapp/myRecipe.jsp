<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>내가 올린 레시피</title>
</head>
<body>
	<%
		String name = (String)session.getAttribute("name");
		String id = (String)session.getAttribute("id");
	%>
	<jsp:include page = "menu.jsp" />
	
	<%! String greeting = "내가 올린 레시피";%>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>
			<br>
			<br>
			<button type="button" class="btn btn-primary btn-lg" onclick="location='addRecipe.jsp'">레시피 추가</button>
		</div>
	</div>
	
	
	<div class = "container">
		<div class = "row" align = "center">
			<%@ include file = "dbconn.jsp" %>
			<%
				Statement stat = null;
				ResultSet rs = null;
				String sql = "select id, name, kind, views, image from recipe where user_id ='" + id + "'";
				
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				while(rs.next()){
					
			%>
					<div class = "col-md-4">
						<img src="./images/<%= rs.getString("image")%>" style="width:100%">
						<h3><%= rs.getString("name") %></h3>
						<p><%=rs.getString("kind") %>
						<p><%=rs.getString("views") %>
						<p> <a href="./recipe.jsp?recipeId=<%=rs.getString("id")%>"
						class="btn btn-info" role="button">상세 정보 &raquo;</a>
						<a href="./deleteRecipe.jsp?recipeId=<%=rs.getString("id")%>"
						class="btn btn-danger" role="button">삭제 &raquo;</a> <!-- a태그는 get방식으로 값을 넘길 수 있음. ?뒤에 key value로 값을 넘김. -->
					</div>
			<%
			}
				rs.close();
				stat.close();
				conn.close();
			%>
		</div>
		<hr>
	</div>
	
</body>
</html>