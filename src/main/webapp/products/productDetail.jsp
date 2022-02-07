<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("UTF-8"); 	
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<jsp:useBean id="pdao" class="products.ProductDAO"/>
<body>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		//넘어온 상품 아이디값을 얻어낸다.
		String pCode = request.getParameter("pCode");		
		//넘어온 상품 아이디값을 이용해서 실제 해당하는 Product객체를 얻고 있다.
		ProductDTO pdto = pdao.getProductBypCode(pCode);		
	%>
	<div class="container">
		<div class="row">
			<!-- 이미지 추가 -->
			<div class="col-md-5">
				<img src="./resources/upload/<%= pdto.getpFilename() %>"
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
				<p> 
					<form action="./products/addCartProc.jsp" method="post">
					<p><b>구매 수량 : </b>
					<input type="number" placeholder="1" value="1" name="oQuantity">
					<input type="hidden" name="oProductNo" value="<%=pdto.getpCode()%>">			
					<input type="hidden" name="flag" value="insert">
				 	</p>
				 	<br>
					<!-- 상품 주문을 클릭하면 자바스크립트의 핸들러 함수 addToCart() 호출되도록 만들었다. -->
					<!-- 장바구니 버튼을 추가하였다. 클릭하면 /cart.jsp로 이동하게 만들어 주었다. -->
					<input class="btn btn-warning" type="submit" value="장바구니 담기">				
					<a href="./welcome.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>					
					</form>
				</p>
			</div>
		</div>
		<hr>
	</div>

</body>
</html>