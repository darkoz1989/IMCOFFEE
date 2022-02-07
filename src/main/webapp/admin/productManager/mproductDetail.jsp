<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="pdao" class="products.ProductDAO"/>
<body>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">관리자 상품정보</h1>
		</div>	
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		//넘어온 상품 아이디값을 얻어낸다.
		String pCode = request.getParameter("pCode");		
		//넘어온 상품 아이디값을 이용해서 실제 해당하는 Product객체를 얻고 있다.
		ProductDTO pdto = pdao.getProductBypCode(pCode);		
	%>
	<div class="container">
		<div class="row">
			<!-- 이미지 추가 -->
			<div class="col-md-5">
				<img src="../resources/upload/<%= pdto.getpFilename() %>"
					 style="width: 100%" />				
			</div>
			
			<div class="col-md-6" align="left">
				<h3><%= pdto.getpName() %> </h3>
				<p><%= pdto.getpDescription() %></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger"><%= pdto.getpCode()%></span></p>
				<p><b>원산지 : </b><%= pdto.getpManufacturer()%></p>			
				<p><b>분류 : </b><%= pdto.getpCategory() %></p>
				<p><b>재고 수 : </b><%= pdto.getpStock()%></p>
				<h4><%= pdto.getpPrice()%>원</h4>
				
				<br><br><br>	
				<p> 
					<form name="addForm" action="./products/addCartProc.jsp?pCode=<%=pdto.getpCode()%>" method="post">			 	
				 												
				 	<a href="managerMain.jsp?center=./productManager/mproductUpdate.jsp?pCode=<%=pdto.getpCode()%>" class="btn btn-primary">상품 수정 &raquo;</a>
				 	<a href="./productManager/mproductProc.jsp?flag=delete&&pCode=<%=pdto.getpCode()%>" class="btn btn-danger">상품 삭제 &raquo;</a>
					<a href="managerMain.jsp?center=./productManager/mproductList.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>					
					</form>	
				</p>		
			</div>		
		</div>
		<hr>
	</div>
</body>
</html>