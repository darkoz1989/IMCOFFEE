<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<jsp:useBean id="mdao" class="members.MemberDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId= request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String msg = "로그인에 실패 하였습니다.";
	
	boolean result = mdao.loginMember(userId, userPw);
	
	if(result){
	    System.out.println(userId + "님 로그인 되었습니다.");
%>	    
	    <script>
		alert("로그인이 완료되었습니다.");		
		</script>
<%
		//세션 유지 시간 설정
		session.setAttribute("userId",userId);
		session.setMaxInactiveInterval(60*300);//3분간 아이디 유지
		response.sendRedirect("../welcome.jsp?userId=userId");
	  }	else{
%>
		<script>
			alert("아이디와 비밀번호를 다시 확인하세요!");
			location.href = "../welcome.jsp?center=./members/memberLogin.jsp";
		</script>
<%
	  }
%>


</body>
</html>