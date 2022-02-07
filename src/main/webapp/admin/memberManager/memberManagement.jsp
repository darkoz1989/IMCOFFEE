<%@page import="members.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="members.MemberDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1. 데이터 베이스에서 모든 회원의 정보를 가져옴  2.table 태크를 이용하여 화면에 회원들의 정보를 출력 -->	
	<% 
		MemberDAO mdao = new MemberDAO();
		//mbao.allSelectMember();
		//회원들의 정보가 얼마나 저장 되어있는지 모르기에 가변길이인 Vector를 이용하여 데이터를 저장해줌
		//폴리 모피즘 다형성 트리 구조 하위구조 부모 자식 관계 
	    Vector<MemberDTO> vec = mdao.allSelectMember(); 
	%>
	
	<div class="jumbotron">		 
		<div class="container">
			<h1 class="display-3">회원 관리 페이지</h1>	
			<br>				
		</div>			
	</div>
	<div class="container">
		<div class="text-center">
			<center>
				<h2> 모든 회원 보기 </h2>	<br>						
				<table width ="800" class="table table-hover" >
									
					<tr height="50">
						<td align = "right" colspan="3"> 
							<button onclick="location.href='managerMain.jsp?center=./memberManager/memberAdd.jsp'">회원추가</button>						
						</td>
					</tr>
					<tr height="50">
						<td align = "center" width = "150">아이디 </td>
						<td align = "center" width = "150">이름 </td>
						<td align = "center" width = "200">전화번호 </td>	
					</tr>
					<% 
						for(int i=0; i<vec.size(); i++){
							MemberDTO mdto = vec.get(i);
					%>
					<tr height="50">
						<td align = "center" width = "150">	
							<a href = "managerMain.jsp?center=./memberManager/memberInfo.jsp?userId=<%=mdto.getUserId()%>">
							<%=mdto.getUserId()%></a>
						</td>
						<td align = "center" width = "150"><%=mdto.getUserName() %></td>
						<td align = "center" width = "200"><%=mdto.getUserPhon() %></td>
					</tr>
					<%
						}
					%>
				</table>
			</center>
		</div>
		<hr>	
	</div>

</body>
</html>