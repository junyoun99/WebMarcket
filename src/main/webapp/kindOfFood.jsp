<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>요리 종류별 페이지</title>
</head>
<body>
	<jsp:include page = "menu.jsp" />
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				${kind }
			</h1>
		</div>
	</div>
	
	
	<div class = "container">
		<div class = "row" align = "center">
			
			${html }
			
		</div>
		<hr>
	</div>
	
	
	<jsp:include page = "footer.jsp" />
</body>
</html>