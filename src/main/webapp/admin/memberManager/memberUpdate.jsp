<%@page import="members.MemberDTO"%>
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
	String userId = request.getParameter("userId"); //memberlist id를 받아줌
	MemberDAO mdao = new MemberDAO();
	MemberDTO mdto = mdao.oneSelectMember(userId);//해당하는 id의 회원 정보를 리턴
%>

	<div class="jumbotron">		
		<div class="container">
			<h1 class="display-3">관리자 회원정보 수정</h1>						
		</div>		
	</div>
	<div class="container">
		<div class="text-center">
		<h2> 회원 정보 수정하기 </h2> <br>
			<center>							
				<table width ="400" border="1">
				<form action="./memberManager/memberUpdateProc.jsp" method="post">
				<tr height="50">
					<td align = "center" width = "150">아이디 </td>
					<td width = "250"><%=mdto.getUserId() %> </td>
				</tr>
				<tr height="50">
				<td align = "center" width = "150">비밀번호  </td>
				<td width = "250"> 
				<input type="text" name="userPw" value="<%=mdto.getUserPw() %>">
				</td>
				</tr>			
				<tr height="50">
				<td align = "center" width = "150">이름 </td>
				<td width = "250"> 
					<input type="text" name="userName" value="<%=mdto.getUserName() %>">
				</td>
				</tr>
				<tr height="50">
				<td align = "center" width = "150">전화번호  </td>
				<td width = "250"> 
				<input type="text" name="userPhon" value="<%=mdto.getUserPhon() %>">
				</td>
				</tr>			
				<tr height="50">
				<td align = "center" width = "150">이메일 </td>
				<td width = "250"> 
					<input type="email" name="userEmail" value="<%=mdto.getUserEmail() %>">
				</td>
				</tr>
				<tr height="50">
				<td align = "center" width = "150">주소 </td>
				<td width = "250"> 
					<input type="text" name="userAddr" value="<%=mdto.getUserAddr() %>">
				</td>
				</tr>				
				
				<tr height="50">
				<td align = "center" colspan="2"> 
					<input type="hidden" name="userId" value="<%=mdto.getUserId()%>">
					<input type="submit" value="회원 수정하기">&nbsp;&nbsp;
				</form>				
					<button onclick="location.href='managerMain.jsp?center=./memberManager/memberInfo.jsp?userId=<%=mdto.getUserId()%>'">뒤로 가기 </button>
				</td>
				
				</tr>
				</table>
			</center>
		</div>
		<hr>	
	</div>
</body>
</html>