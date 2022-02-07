<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
  <%
   request.setCharacterEncoding("UTF-8");
  
	//로그아웃 클릭시 파라미터를 통해서 로그아웃인지여부 파악
	String logout = request.getParameter("logout");

	if(logout != null){
		//id에  null 값을 부여 
		session.setAttribute("userId",null);
		
		//세션 유지 시간을 죽이시오
		session.setMaxInactiveInterval(0);
	}

	//세션을 통하여 id를 읽어드림
	String userId = (String)session.getAttribute("userId");		
	
	//로그인이 되어 있지 않다면 session값이 null 처리 해줌 
		if(userId == null){
			userId = "guest";
		}
%>    

<nav class="navbar navbar-expand  navbar-dark" style="background:#015132"> <!-- 네비게이션 바를 만든다. -->
	<div class="container"> <!-- container라는 클래스 부터는 무엇인가 내용을 표식 -->
		<div class="navbar-header"> <!-- 네비게이션 헤더 -->
			<a class="navbar-brand" href="welcome.jsp">HOME</a>
<%
			if(userId.equals("guest")){
%>	
				<a class="navbar-brand" href="welcome.jsp?center=./members/memberLogin.jsp">LOGIN</a>
				<a class="navbar-brand" href="welcome.jsp?center=./members/memberJoin.jsp">JOIN</a>
								
<%
			}else{
%>				
				<a class="navbar-brand" ><%=userId%> 님</a>
				<a class="navbar-brand" href="welcome.jsp?logout=1">LOGOUT</a>
				<!-- <a class="navbar-brand" href="welcome.jsp?center=./mypage/productMypage.jsp">MYPAGE</a> -->
				<a class="navbar-brand" href="welcome.jsp?center=./products/cartList.jsp">장바구니</a>									
				<a class="navbar-brand" href="welcome.jsp?center=./mypage/mypageMain.jsp">마이페이지</a>				
<%				
			}
%>					
			<a class="navbar-brand" href="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1">공지사항</a>
		</div>		
<%
			if(userId.equals("admin")){
%>
		<div class="navbar-header"> 
			<a class="navbar-brand" href="./admin/managerMain.jsp">관리자</a>
		</div>
<%				
			}
%>	
	</div>		
</nav>
