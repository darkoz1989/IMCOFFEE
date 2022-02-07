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
%>
	<jsp:useBean id = "mbean" class= "members.MemberDTO">
		<jsp:setProperty name="mbean" property="*" /><!--맵핑 시키시오  -->
	</jsp:useBean>
	
	<%
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean);				
	%>
	<script>
		alert("회원 추가완료!");
		location.href = "../managerMain.jsp?center=./memberManager/memberManagement.jsp";
	</script>
</body>
</html>