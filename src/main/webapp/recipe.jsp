<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<title>레시피 보기</title>
<style>


</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">레시피 보기</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String id = request.getParameter("recipeId");
		
		PreparedStatement pstat = null;
		
		ResultSet rs = null;
		
		String sql = "select * from recipe where id = ?";
		String sql2 = "update recipe set views = views + 1 where id = '" + id + "'";
		
		pstat = conn.prepareStatement(sql2);
		pstat.executeUpdate();
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, id);
		
		rs = pstat.executeQuery();
		
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img alt="" src="./images/<%= rs.getString("image")%>" width="100%">
			</div>
			<div class="col-md-7">
				<h3><%=rs.getString("name")%></h3>
				<p> <b>레시피 아이디 : </b><span class="badge badge-danger">
					<%=rs.getString("id") %></span>
				<p> <b>요리 종류</b> : <%=rs.getString("kind") %>
				<p> <b>재료</b> : <%=rs.getString("ingredients") %>
				<p><%=rs.getString("content") %>
				<p> <b>레시피 등록일</b> : <%=rs.getString("regdate") %>
				<p> <b>조회수</b> : <%=rs.getInt("views") %></p>
				<a class="btn text-white btn-danger" href="addBookmark.jsp?recipeId=<%=id %>"> <i class="fa fa-heart"></i>LIKE</a>
				<a href="javascript:window.history.back();" class="btn btn-success"> 확인 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
	<%
		}
		rs.close();
		pstat.close();
		conn.close();
	%>
</body>
</html>