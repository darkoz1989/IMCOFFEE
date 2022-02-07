<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">관리자 회원 추가</h1>
		</div>	
	</div>
	
	<div class="container">
		<form name="newMember" class="form-horizontal" action="./memberManager/memberAddProc.jsp" method="post" 
			  onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input name="userId" type="text" class="form-control" placeholder="아이디" value="abc">	
				</div>
			</div>	
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="userPw" type="password" class="form-control" placeholder="비밀번호" value="0000">	
				</div>
			</div> 
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input name="userPw_ckeck" type="password" class="form-control" placeholder="비밀번호 확인" value="0000">	
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input name="userName" type="text" class="form-control" placeholder="이름" value="홍길동">	
				</div>
			</div>		
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="userPhon" type="text" class="form-control" placeholder="전화번호(-생략)" value="01012345678">	
				</div>
			</div> 	
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input name="userEmail" type="text" class="form-control" placeholder="abc@naver.com" value="hong@naver.com">	
				</div>
			</div> 		
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="userAddr" type="text" class="form-control" placeholder="주소" value="부산시 진구">	
				</div>
			</div> 	
			<div class="form-group row">
				<div class="col-sm-offse-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="가입">	
					<input type="reset" class="btn btn-primary" value="취소">
				</div>
			</div>			  
		</form>
	</div>
</body>
</html>