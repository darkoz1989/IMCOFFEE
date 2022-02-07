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
		return;//이후에 코드는 무력화를 위한 목적
	}
 	
	odto.setoId(userId);//주문자 id 저장
	//장바구니 담기, 삭제, 수정 모두 처리하는 페이지(insert, delete, update)
	String flag = request.getParameter("flag");
	String msg = "";
	if(flag.equals("insert")){
		msg = "장바구니에 저장하였습니다.";
		cdao.addCart(odto);
	}else if(flag.equals("delete")){
		msg = "장바구니를 삭제하였습니다.";
		cdao.deleteCart(odto);
	}else if(flag.equals("update")){
		msg = "장바구니를 수정하였습니다.";
		cdao.updateCart(odto);
	} 
%> 
	<script>
	alert("<%=msg%>");
	location.href = "../welcome.jsp?center=./products/cartList.jsp";
</script>
	
	
	
</body>
</html>