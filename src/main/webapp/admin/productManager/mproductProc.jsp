<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="pdao" class="products.ProductDAO"/>
	<jsp:useBean id="pdto" class="products.ProductDTO"/>
	<jsp:setProperty property="*" name="pdto"/>
	<% 
		request.setCharacterEncoding("UTF-8");
		String pCode = request.getParameter("pCode");
		//insert, update, delete
		String flag = request.getParameter("flag");
		String msg = "������ �߻��Ͽ����ϴ�.";
		if(flag.equals("insert")){
			if(pdao.insertProduct(request))
				msg = "��ǰ�� ����Ͽ����ϴ�.";
		}else if(flag.equals("update")){
			if(pdao.updateProduct(request))
				msg = "��ǰ�� �����Ͽ����ϴ�.";
		}else if(flag.equals("delete")){
			if(pdao.deleteProduct(pCode))
				msg = "��ǰ�� �����Ͽ����ϴ�.";
		}
%>
<script>
	alert("<%=msg%>");	
	location.href = "../managerMain.jsp?center=./productManager/mproductList.jsp";
</script>
		
	
</body>
</html>