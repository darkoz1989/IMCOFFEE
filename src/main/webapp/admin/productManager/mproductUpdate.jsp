<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="pdao" class="products.ProductDAO"/>
<body>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">관리자 상품 수정</h1>
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
			<form name="addForm" action="./productManager/mproductProc.jsp?flag=update" method="post"enctype="multipart/form-data">
				<p><b>상품 코드<b> : <%= pdto.getpCode() %> </b>
				<p><b>상품명<b> : <input type="text" name="pName" value="<%= pdto.getpName() %>"></p>
				<p><b>상품 설명<b> : <input type="text" name="pDescription" value="<%= pdto.getpDescription() %>"></p>				
				<p><b>원산지<b> : <input type="text" name="pManufacturer" value="<%= pdto.getpManufacturer()%>"></p>
				<p><b>상품 분류<b> : <input type="text" name="pCategory" value="<%= pdto.getpCategory() %>"></p>
				<p><b>재고수량<b> : <input type="text" name="pStock" value="<%= pdto.getpStock() %>"></p>
				<p><b>상품 가격<b> : <input type="text" name="pPrice" value="<%= pdto.getpPrice() %>"></p>
				<p><b>상품 이미지<b> : <input name="pFilename" type="file" value="<%= pdto.getpPrice() %>"></p>
				<input type="hidden" value="<%= pdto.getpCode() %>" name="pCode">
				<br><br><br>	
				<p> 									 												
				 	<input type="submit" value="수정하기"> &nbsp;&nbsp;&nbsp;				 	
					<a href="managerMain.jsp?center=./productManager/mproductList.jsp" >상품 목록 &raquo;</a>	 						
				</p>
			</form>				
										
			</div>
					
		</div>
		<hr>
	</div>
</body>
</html>