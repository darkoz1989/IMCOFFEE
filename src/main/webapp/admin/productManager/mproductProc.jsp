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
		String msg = "오류가 발생하였습니다.";
		if(flag.equals("insert")){
			if(pdao.insertProduct(request))
				msg = "상품을 등록하였습니다.";
		}else if(flag.equals("update")){
			if(pdao.updateProduct(request))
				msg = "상품을 수정하였습니다.";
		}else if(flag.equals("delete")){
			if(pdao.deleteProduct(pCode))
				msg = "상품을 삭제하였습니다.";
		}
%>
<script>
	alert("<%=msg%>");	
	location.href = "../managerMain.jsp?center=./productManager/mproductList.jsp";
</script>
		
	
</body>
</html>