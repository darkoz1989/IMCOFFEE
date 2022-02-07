<!-- idCheck.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mdao" class="members.MemberDAO"/>
<% 
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		boolean result = mdao.idCheck(userId);
		//out.print(result);
%>
<!DOCTYPE html>
<html>
<head>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<br><b><%=userId%></b>
<%
		if(result){
			out.println("는 이미 존재하는 ID입니다.<p>");
		}else{
			out.println("는 사용 가능한 ID입니다.<p>");
		}
%>
<a href="#" onclick="self.close()">닫기</a>
</div>
</body>
</html>
