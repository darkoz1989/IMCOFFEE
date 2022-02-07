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
	
	<jsp:useBean id="mbean" class="members.MemberDTO">
		<jsp:setProperty name="mbean" property = "*" />
	</jsp:useBean>

<%
	String userId =request.getParameter("userId");
	MemberDAO mdao = new MemberDAO();

	mdao.updateMember(mbean);
	
%>
	<script>
		alert("회원 정보 정정완료!");
		location.href = "../managerMain.jsp?center=./memberManager/memberManagement.jsp";
	</script>
	
<%	
	//response.sendRedirect("../managerMain.jsp?center=./memberManager/memberManagement.jsp");		
%>	
</body>
</html>