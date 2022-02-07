<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand  navbar-dark bg-dark"> <!-- 네비게이션 바를 만든다. -->
	<div class="container"> <!-- container라는 클래스 부터는 무엇인가 내용을 표식 -->
		<div class="navbar-header"> <!-- 네비게이션 헤더 -->
			<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/managerMain.jsp?center=./memberManager/memberManagement.jsp">회원관리</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/managerMain.jsp?center=./productManager/mproductList.jsp">상품관리</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/managerMain.jsp?center=./orderManager/mOrderList.jsp">주문관리</a>
			<!-- <a class="navbar-brand" href="managerMain.jsp?center=./boardManager/mqna_boardList.jsp">Q & A 관리</a> -->			
			<a class="navbar-brand" href="${pageContext.request.contextPath}/mBoardListAction.do?pageNum=1">게시판 관리</a>
		</div>
		<div class="navbar-header"> 			
		     <a href="${pageContext.request.contextPath}/welcome.jsp"><input type="button" value="나가기"></a>
		</div>
	</div>
</nav>
</body>
</html>