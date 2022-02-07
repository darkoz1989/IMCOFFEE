<%@page import="java.util.Enumeration"%>
<%@page import="orders.orderDTO"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="pdao" class="products.ProductDAO"/>
<jsp:useBean id="cdao" class="carts.CartDAO" scope="session"/>
<jsp:useBean id="odto" class="orders.orderDTO"/>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function cartUpdate(form){
	form.flag.value="update"
	form.submit();
}

function cartDelete(form) {
	form.flag.value="delete";
	form.submit();
}
</script>
</head>

<%
	request.setCharacterEncoding("UTF-8"); 
	String userId = (String)session.getAttribute("userId");	
	String pCode = request.getParameter("pCode");
	
	Hashtable<String, orderDTO> hCart = cdao.getCartList();
	int totalPrice = 0;
	System.out.println("해쉬테이블"+pCode);
%>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장 바 구 니</h1>			
		</div>	
	</div>
	
	<div class="container">		
		<div style="padding-top: 50px">
			<!-- table-hover는 마우스 포인터가 있는 해의 배경을 바꾸어 눈에 띄도록 만들어진 클래스  -->
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>				
				<%if(hCart.isEmpty()){%>
				<tr>
					<td colspan="4" align="center">장바구니는 비어 있습니다.</td>
				</tr>	
				<%	
				}else{
					//해쉬테이블에서 저장된 객체의 키값을 가져옴.
					//Enumeration  : 줄줄이 사탕 객체
					Enumeration<String> hCartKey = hCart.keys();
					while(hCartKey.hasMoreElements()){
						//키값으로 주문객체를 리턴
						orderDTO order = hCart.get(hCartKey.nextElement());
						//상품번호로 상품정보 리턴
						String productNo = order.getoProductNo();
						ProductDTO pbean = pdao.getProductBypCode(productNo);
						String pName = pbean.getpName();//상품이름
						int price = pbean.getpPrice();//상품가격
						int quantity = order.getoQuantity();//주문수량
						int subTotal = price * quantity;//주문가격
						//전체주문가격
						totalPrice+=subTotal;						
				%>				
				<tr>
				<form method="post" action="./products/addCartProc.jsp">
					<input type="hidden" name="oProductNo" value="<%=productNo%>">
					<th><%=pName%></th>
					<th><%=pbean.getpPrice() %></th>
					<th><input name="oQuantity" style = "text-align:right;" 
						value="<%=quantity%>" size="3">개</th>
					<th><%=subTotal %> 원</th>
					<td>
						<input type="button" value="수량 수정" size="3" onclick="cartUpdate(this.form)"> /
						<input type="button" value="삭제" size="3" onclick="cartDelete(this.form)">
					</td>					
					<input type="hidden" name="flag">
					</form>
				</tr>
				<%}//--while%>
				<tr>
					<th></th>					
					<td colspan="4" align="right" >
						<font size="5" color="red">총 주문금액 : <%=totalPrice%>원</font>						
					</td>					
				</tr>
				<%}//--fi-else%>
			</table>
			<a href="./welcome.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
			<a class="btn btn-success" href="welcome.jsp?center=./products/orderList.jsp">주문하기</a>
		</div>
		<hr>
	</div>
</body>
</html>