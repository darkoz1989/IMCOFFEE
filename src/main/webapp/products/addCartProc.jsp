<%@page import="carts.CartDAO"%>
<%@page import="products.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cdao" class="carts.CartDAO" scope="session"/>
<jsp:useBean id="odto" class="orders.orderDTO"/>
<jsp:setProperty property="*" name="odto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = (String)session.getAttribute("userId");
	
	if(userId==null){
		response.sendRedirect("./members/memberLogin.jsp");
		return;//���Ŀ� �ڵ�� ����ȭ�� ���� ����
	}
 	
	odto.setoId(userId);//�ֹ��� id ����
	//��ٱ��� ���, ����, ���� ��� ó���ϴ� ������(insert, delete, update)
	String flag = request.getParameter("flag");
	String msg = "";
	if(flag.equals("insert")){
		msg = "��ٱ��Ͽ� �����Ͽ����ϴ�.";
		cdao.addCart(odto);
	}else if(flag.equals("delete")){
		msg = "��ٱ��ϸ� �����Ͽ����ϴ�.";
		cdao.deleteCart(odto);
	}else if(flag.equals("update")){
		msg = "��ٱ��ϸ� �����Ͽ����ϴ�.";
		cdao.updateCart(odto);
	} 
%> 
	<script>
	alert("<%=msg%>");
	location.href = "../welcome.jsp?center=./products/cartList.jsp";
</script>
	
	
	
</body>
</html>