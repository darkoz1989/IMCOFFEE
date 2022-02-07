<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=".././resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>

	<center>
	
	<% 
		String center = request.getParameter("center");
		//처음 실행시에는 center값이 넘어오지 않기에
		if(center==null){//null 처리해줌
			center = "managerCenter.jsp";//디폴트 center값을 부여	
		}
	%>		
		<!-- header 부분 -->
		<jsp:include page="managerMenu.jsp" />
		
		<!--Center 부분 -->
			<tr height="470" align="center">
				<td align="center" width="1000"><jsp:include page="<%=center%>"/></td>
			</tr>
		</table>
			
		<!-- footer 부분 -->
		<jsp:include page="managerFooter.jsp" />
	
	</center>


</body>
</html>