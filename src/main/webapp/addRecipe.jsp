<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>레시피 추가</title>
</head>
<body>

	<%
		String name = (String)session.getAttribute("name");
	%>
	<jsp:include page = "menu.jsp" />
	
	<%! String greeting = "레시피 추가";%>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>
		</div>
	</div>

<div class="container">
	<form name="newRecipe" action="processAddRecipe.jsp?name=<%= name %>" class="form-horisontal" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2">요리 아이디</label>
			<div class="col-sm-3">
				<input type="text" name="recipeId" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">요리 이름</label>
			<div class="col-sm-3">
				<input type="text" name="recipeName" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">요리 종류</label>
			<div class="col-sm-5">
				<input type="radio" name="kind" value="KoreanFood">한식
				<input type="radio" name="kind" value="ChineseFood">중식
				<input type="radio" name="kind" value="WesternFood">양식
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">재료</label>
			<div class="col-sm-3">
				<input type="text" name="ingredients" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">레시피 내용</label>
			<div class="col-sm-5">
				<textArea name="recipeContent" rows="10" cols="50" class="form-control"></textArea>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">이미지</label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control">
			</div>
		</div>
		
		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" value="등록" class="btn btn-primary">
			</div>
		</div>
	</form>
</div>




</body>
</html>