<%@page import="products.ProductDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<jsp:useBean id="pbean" class="products.ProductDAO"/>
<body>	
	<%
		String greeting = "관리자 상품관리";		
		String userId = (String)session.getAttribute("userId");
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%= greeting %></h1>			
		</div>	
		
	</div>
		<div class="container" align="right">			
			<input type="button" value="상품추가" onclick="location.href='managerMain.jsp?center=./productManager/maddproduct.jsp'">
			<br><br><br>
		</div>
	<%	
		Vector<ProductDTO> pvdto =  pbean.getProductList();
	%>
	<div class="container">
		<div class="row" align="center">			
			<%
				for(int i=0; i<pvdto.size(); i++) {
					ProductDTO pdto = pvdto.get(i);
			%>
			<div class="col-md-4">
				<!-- 경로를 지정해서 이미지를 출력하고 있다. -->				
				<img src="../resources/upload/<%= pdto.getpFilename() %>"  
					 style="width: 100%">
				<h3><%=pdto.getpName() %> </h3>
				<p><%=pdto.getpDescription() %></p>
				<p><%=pdto.getpPrice() %>원</p>
				<!-- 상품의 아이디에 대한 상세 정보 페이지를 연결시키기 위해서 아래 코드를 작성하였다. -->
				<p>				
				<a href="managerMain.jsp?center=./productManager/mproductDetail.jsp?pCode=<%=pdto.getpCode()%>"
				class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>			
			</div>
			<%
				}
			%>	
		</div>
		<hr>
	</div>
</body>
</html>