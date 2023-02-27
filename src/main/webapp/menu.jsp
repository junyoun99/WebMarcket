<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String name = (String)session.getAttribute("name");
	
	if(name == null){
%>


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
                        <a class="nav-link " href="./login.jsp">로그인</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link " href="./signUp.jsp">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
</nav>
	
<%
	}else{
%>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand text-white" href="./welcome.jsp">Recipe Market</a>
            <a class = "navbar-brand text-white" href = "./welcome.jsp">    <%=name %>님, 환영합니다. </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ml-auto">
                   
                    <li class="nav-item ">
                        <a class="nav-link" href="./welcome.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class = "nav-link" href = "./myRecipe.jsp">내가 올린 레시피</a> 
                    </li>
                    <li class="nav-item">
                      	<a class = "nav-link" href = "./bookMark.jsp">즐겨찾기</a>
                    </li>
                    <li class="nav-item">
                        <a class = "nav-link" href = "./logout.jsp">로그아웃</a>
                    </li>
                </ul>
            </div>
        </div>
	</nav>
	
	
	<%
	}
	%>