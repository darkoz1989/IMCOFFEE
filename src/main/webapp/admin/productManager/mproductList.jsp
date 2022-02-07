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
		String greeting = "������ ��ǰ����";		
		String userId = (String)session.getAttribute("userId");
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%= greeting %></h1>			
		</div>	
		
	</div>
		<div class="container" align="right">			
			<input type="button" value="��ǰ�߰�" onclick="location.href='managerMain.jsp?center=./productManager/maddproduct.jsp'">
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
				<!-- ��θ� �����ؼ� �̹����� ����ϰ� �ִ�. -->				
				<img src="../resources/upload/<%= pdto.getpFilename() %>"  
					 style="width: 100%">
				<h3><%=pdto.getpName() %> </h3>
				<p><%=pdto.getpDescription() %></p>
				<p><%=pdto.getpPrice() %>��</p>
				<!-- ��ǰ�� ���̵� ���� �� ���� �������� �����Ű�� ���ؼ� �Ʒ� �ڵ带 �ۼ��Ͽ���. -->
				<p>				
				<a href="managerMain.jsp?center=./productManager/mproductDetail.jsp?pCode=<%=pdto.getpCode()%>"
				class="btn btn-secondary" role="button">�� ���� &raquo;</a></p>			
			</div>
			<%
				}
			%>	
		</div>
		<hr>
	</div>
</body>
</html>