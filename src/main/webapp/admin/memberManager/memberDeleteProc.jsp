<%@page import="members.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String userId =request.getParameter("userId");
	MemberDAO mdao = new MemberDAO();
	
	mdao.deleteMember(userId);
	
%>
	<script>
		alert("회원 삭제완료!");
		location.href = "../managerMain.jsp?center=./memberManager/memberManagement.jsp";
	</script>
</body>
</html>