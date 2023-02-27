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
<title>즐겨찾기</title>
</head>
<body>
	<jsp:include page = "menu.jsp" />
	<%! String greeting = "즐겨찾기";%>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>
		</div>
	</div>

	<div class = "container">
		<div class = "row" align = "center">
			<%@ include file = "dbconn.jsp" %>
			<%
				String userId = (String)session.getAttribute("id");
			
				Statement stat = null;
				ResultSet rs = null;
				String sql = "select r.id, r.name, r.kind, r.image, r.views from recipe r, bookmark b where b.userId = '" + userId + "' and r.id = b.recipeId" ;
				
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
						<a href="./deleteBookmark.jsp?recipeId=<%=rs.getString("id")%>"
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
	
	
	<jsp:include page = "footer.jsp" />
</body>
</html>