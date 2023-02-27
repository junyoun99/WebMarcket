<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원가입</title>
</head>
<script type="text/javascript" src="./js/validation.js"></script>
<body>

	<nav class = "navbar navbar-expand navbar-dark bg-dark">
		<div class = "container">
			<div class = "navbar-header">
				<a class = "navbar-brand" href = "./welcome.jsp">Home</a>
				<a class = "navbar-brand" href = "./login.jsp">로그인</a>
			</div>
		</div>
	</nav>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				회원가입
			</h1>
		</div>
	</div>

<div class="container">
	<form name="newUser" action="SignUpControllerServlet" class="form-horisontal" method="post" enctype="UTF-8">
		<div class="form-group row">
			<label class="col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" name="userId" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="text" name="password" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이름</label>
			<div class="col-sm-3">
				<input type="text" name="userName" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">전화번호</label>
			<div class="col-sm-3">
				<input type="text" name="phoneNumber" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">나이</label>
			<div class="col-sm-3">
				<input type="text" name="userAge" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-3">
				<input type="text" name="userEmail" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">주소</label>
			<div class="col-sm-3">
				<input type="text" name="address" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-sm-2"></div>
			<div class="col-sm-10">
				<input type="submit" value="회원가입" class="btn btn-primary">
			</div>
		</div>
	</form>
</div>
</body>
</html>