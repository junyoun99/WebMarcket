<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Recipe Market</title>

<style>
#home_quicklinks {
    padding: 20px 0;
    text-align: center;
}
a.quicklink {
    display: inline-block;
    width: 150px;
    height: 50px;
    position: relative;
    margin: 30px;
    font-size: 36px;
    font-weight: 500;
    text-decoration:none;
}
a.quicklink .ql_caption {
    display: block;
    height: 100%;
    width: 100%;
    position: relative;
}
.outer {
    display: table;
    position: relative;
    vertical-align: middle;
    text-align: center;
    height: 100%;
    width: 100%;
    border-spacing: 0px;
    padding: 0px;
}
.inner {
    display: table-cell;
    position: relative;
    vertical-align: middle;
    text-align: center;
    height: 100%;
    width: 100%;
    border-spacing: 0px;
    padding: 0px;
}
a.quicklink .ql_caption h2 {
    margin: 0px;
    padding: 0px;
    text-transform: uppercase;
    line-height: 1.46em;
    color: #fff;
}
a.quicklink.link0{
    border-bottom-color: #bcbdc0;
    border-top-color: #bcbdc0;
    background: #bdbd00;
}
a.quicklink.link1{
	background: #fc6719;
    border-bottom-color: #fc6719;
    border-top-color: #fc6719;
}
a.quicklink.link2{
    background: #fc3847;
    border-bottom-color: #fcf4e7;
    border-top-color: #fcf4e7;
}
a.quicklink.link3{
    border-bottom-color: #bcbdc0;
    border-top-color: #bcbdc0;
    background: #bcbdc0;
}
</style>

</head>
<body>
	<jsp:include page = "menu.jsp" />
	<%! String greeting = "레시피 마켓";%>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>
		</div>
	</div>

	<div id="home_quicklinks">
		<a class="quicklink link0" style="cursor:hand" onclick="location.href='rank.go'"> <span class="ql_caption">
				<span class="outer"> <span class="inner">
						<h2>랭킹</h2>
				</span>
			</span>
		</span>
		</a>
		<a class="quicklink link1" style="cursor:hand" onclick="location.href='korean.go'"> <span class="ql_caption">
				<span class="outer"> <span class="inner">
						<h2>한식</h2>
				</span>
			</span>
		</span>
		</a> <a class="quicklink link2" style="cursor:hand" onclick="location.href='chinese.go'"> <span class="ql_caption">
				<span class="outer"> <span class="inner">
						<h2>중식</h2>
				</span>
			</span>
		</span>
		</a> <a class="quicklink link3" style="cursor:hand" onclick="location.href='western.go'"> <span class="ql_caption">
				<span class="outer"> <span class="inner">
						<h2>양식</h2>
				</span>
			</span>
		</span>
		</a>

	</div>
	
	
	<div class = "container">
		<div class = "row" align = "center">
			<%@ include file = "dbconn.jsp" %>
			<%
				Statement stat = null;
				ResultSet rs = null;
				String sql = "select * from recipe";
				
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
						class="btn btn-info" role="button">상세 정보 &raquo;</a> <!-- a태그는 get방식으로 값을 넘길 수 있음. ?뒤에 key value로 값을 넘김. -->
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