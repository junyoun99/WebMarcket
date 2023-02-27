<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>로그인</title>
</head>
<body>

 <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand text-white" href="./welcome.jsp">Recipe Market</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ml-auto">
                   
                    <li class="nav-item ">
                        <a class="nav-link " href="./welcome.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="./signUp.jsp">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
</nav>

	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				로그인
			</h1>
		</div>
	</div>
   
   <div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
        <form action="LoginController" name="userLogin" method="post" enctype="utf-8">
	        <div class="card text-center card  bg-default mb-3">
	          <div class="card-header">
	            LOGIN
	          </div>
	          <div class="card-body">
	               <input type="text" id="userId" name="userId" class="form-control input-sm chat-input" placeholder="아이디" />
	            <br>
	            <input type="password" id="password" name="password" class="form-control input-sm chat-input" placeholder="비밀번호" />
	          </div>
	          <div class="card-footer text-muted">
	            <button type="submit" class="btn btn-secondary">LOGIN</button>
	          </div>
	        </div>
        </form>
    </div>
    </div>
</div>
</body>
</html>