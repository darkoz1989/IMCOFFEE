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
			<h1 class="display-3">��ǰ ����</h1>
		</div>
	</div>
	<%
		//�Ѿ�� ��ǰ ���̵��� ����.
		String pCode = request.getParameter("pCode");		
		//�Ѿ�� ��ǰ ���̵��� �̿��ؼ� ���� �ش��ϴ� Product��ü�� ��� �ִ�.
		ProductDTO pdto = pdao.getProductBypCode(pCode);		
	%>
	<div class="container">
		<div class="row">
			<!-- �̹��� �߰� -->
			<div class="col-md-5">
				<img src="./resources/upload/<%= pdto.getpFilename() %>"
					 style="width: 100%" />				
			</div>
			
			<div class="col-md-6" align="left">
				<h3><%= pdto.getpName() %> </h3>
				<p><%= pdto.getpDescription() %></p>
				<p><b>��ǰ �ڵ� : </b><span class="badge badge-danger"><%= pdto.getpCode()%></span></p>
				<p><b>������ : </b><%= pdto.getpManufacturer()%></p>			
				<p><b>�з� : </b><%= pdto.getpCategory() %></p>
				<p><b>��� �� : </b><%= pdto.getpStock()%></p>
				<h4><%= pdto.getpPrice()%>��</h4>
				<p> 
					<form action="./products/addCartProc.jsp" method="post">
					<p><b>���� ���� : </b>
					<input type="number" placeholder="1" value="1" name="oQuantity">
					<input type="hidden" name="oProductNo" value="<%=pdto.getpCode()%>">			
					<input type="hidden" name="flag" value="insert">
				 	</p>
				 	<br>
					<!-- ��ǰ �ֹ��� Ŭ���ϸ� �ڹٽ�ũ��Ʈ�� �ڵ鷯 �Լ� addToCart() ȣ��ǵ��� �������. -->
					<!-- ��ٱ��� ��ư�� �߰��Ͽ���. Ŭ���ϸ� /cart.jsp�� �̵��ϰ� ����� �־���. -->
					<input class="btn btn-warning" type="submit" value="��ٱ��� ���">				
					<a href="./welcome.jsp" class="btn btn-secondary">��ǰ ��� &raquo;</a>					
					</form>
				</p>
			</div>
		</div>
		<hr>
	</div>

</body>
</html>