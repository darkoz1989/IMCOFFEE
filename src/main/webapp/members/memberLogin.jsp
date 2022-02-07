<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">반갑습니다</br>IM COFFEE 입니다</h1>
		</div>	
	</div>	
	<div class="container" align="center">
		<div class="col-md-5 col-md-offset-4">
			<h4 class="form-signin-heading">ID/PW를 입력해주세요</h4>			
			<form class="form-signin" action="./members/memberLoginProc.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="아이디" name="userId" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="비밀번호" name="userPw" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>			
			</form>			
		</div>
	</div>	
</body>
</html>