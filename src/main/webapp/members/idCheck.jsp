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
<title>ID �ߺ�üũ</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<br><b><%=userId%></b>
<%
		if(result){
			out.println("�� �̹� �����ϴ� ID�Դϴ�.<p>");
		}else{
			out.println("�� ��� ������ ID�Դϴ�.<p>");
		}
%>
<a href="#" onclick="self.close()">�ݱ�</a>
</div>
</body>
</html>
