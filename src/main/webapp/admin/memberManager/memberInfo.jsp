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
	MemberDTO mdto = mdao.oneSelectMember(userId);
%>

	<div class="jumbotron">		
		<div class="container">
			<h1 class="display-3">관리자 회원정보 상세</h1>			
		</div>		
	</div>
	<div class="container">
		<div class="text-center">
			<center>
				<h2> 회원 정보 보기 </h2>			
				<table width ="400" border="1">
				<tr height="50">
					<td align = "center" width = "150">아이디 </td>
					<td width = "250"><%=mdto.getUserId() %> </td>
				</tr>
				<tr height="50">
					<td align = "center" width = "150">비밀번호  </td>
					<td width = "250"><%=mdto.getUserPw() %> </td>
				</tr>
				<tr height="50">
					<td align = "center" width = "150">이름 </td>
					<td width = "250"><%=mdto.getUserName() %> </td>
				</tr>
				<tr height="50">
					<td align = "center" width = "150">전화번호 </td>
					<td width = "250"><%=mdto.getUserPhon() %> </td>
				</tr>
				<tr height="50">
					<td align = "center" width = "150">이메일</td>
					<td width = "250"><%=mdto.getUserEmail() %> </td>
				</tr>
				<tr height="50">
					<td align = "center" width = "150">주소 </td>
					<td width = "250"><%=mdto.getUserAddr() %> </td>
				</tr>
				
				<tr height="50">
					<td align = "center" width = "150">가입일 </td>
					<td width = "250"><%=mdto.getuRegDate() %> </td>
				</tr> 
		
				<tr height="50">
				<td align = "center" colspan="2"> 
					<button onclick="location.href='managerMain.jsp?center=./memberManager/memberUpdate.jsp?userId=<%=mdto.getUserId()%>'">회원 수정</button>
					<button onclick="location.href='./memberManager/memberDeleteProc.jsp?userId=<%=mdto.getUserId()%>'">회원 삭제</button>
					<button onclick="location.href='managerMain.jsp?center=./memberManager/memberManagement.jsp'">목록 보기</button>					
				</td>
				</tr>
		</table>
		</center>
		</div>
		<hr>	
	</div>
</body>
</html>