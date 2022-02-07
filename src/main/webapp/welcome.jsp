<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>웹쇼핑몰</title>
</head>
<body>
	<center>	
	<% 
		String center = request.getParameter("center");
		//처음 실행시에는 center값이 넘어오지 않기에
		if(center==null){//null 처리해줌
			center = "center.jsp";//디폴트 center값을 부여	
		}
	%>		
		<!-- header 부분 -->
		<jsp:include page="menu.jsp" />
		
		<!--Center 부분 -->
			<tr height="470" align="center">
				<td align="center" width="1000"><jsp:include page="<%=center%>"/></td>
			</tr>	
			
		<!-- footer 부분 -->
		<jsp:include page="footer.jsp" />
	</center>
</body>
</html>