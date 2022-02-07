<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="orders.orderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.ProductDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="pdao" class="products.ProductDAO"/>
<jsp:useBean id="cdao" class="carts.CartDAO" scope="session"/>
<jsp:useBean id="odao" class="orders.orderDAO"/>    
<jsp:useBean id="odto" class="orders.orderDTO"/>
<jsp:setProperty property="*" name="odto"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	//세션에 저장된 장바구니 객체를 리턴
	Hashtable<String, orderDTO> hCart = cdao.getCartList();
	Enumeration<String> hCartKey = hCart.keys();
	String msg = "";
	if(!hCart.isEmpty()){
	while(hCartKey.hasMoreElements()){
		orderDTO order = hCart.get(hCartKey.nextElement());
		//주문처리
		odao.insertOrder(order);
		//재고정리
		//pdao.reduceProduct(order);
		//장바구니에 주문한 상품삭제
		cdao.deleteCart(order);
	}
	msg ="주문완료 하였습니다.";
	}else{
		msg = "장바구니가 비었습니다.";
	}
	
%>
	
<script>
	alert("<%=msg%>");
	location.href = "../welcome.jsp?center=./mypage/mypageMain.jsp";
</script>

	
</body>
</html>