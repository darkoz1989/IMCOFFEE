<%@page import="members.MemberDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="orders.orderDTO"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="pdao" class="products.ProductDAO"/>
<jsp:useBean id="mdao" class="members.MemberDAO"/>
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
			<h1 class="display-3">주문 상세 페이지</h1>			
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
					<input type="hidden" name="flag">
					</form>
				</tr>
				<%}//--while%>
				<tr>
					<th></th>
					<th></th>
					<td colspan="4" align="right" >
						<font size="5" color="red">총 주문금액 : <%=totalPrice%>원</font>						
					</td>						
				</tr>
				<%}//--fi-else%>
			</table>
			<form name="newMember" class="form-horizontal" action="./products/orderProc.jsp" method="post" >
				<br><br>	
			<%
				MemberDTO mdto = mdao.oneSelectMember(userId);
				String oName = mdto.getUserName();
				int oPhon = mdto.getUserPhon();
				String oAddr = mdto.getUserAddr();
			%>
			<table class="table table-hover">				
				<tr>
					<td>받으실 분</td>
					<td>
						<input name="oName" type="text" class="form-control" value="<%=oName%>">
					</td>
				</tr>
				<tr>
					<td>받으실 분 연락처</td>
					<td>
						<input name="oPhon" type="text" class="form-control" value="<%=oPhon%>">
					</td>
				</tr>
				<tr>
					<td>받으실 분 주소</td>
					<td>
						<input name="oAddr" type="text" class="form-control"  value="<%=oAddr%>">
					</td>
				</tr>
			</table>			  
				  <a class="btn btn-danger" href="welcome.jsp?center=./products/cartList.jsp">취소</a>
				<input type="submit" class="btn btn-success" value="주 문 하 기">
			</form>					
		</div>
		<hr>
	</div>
</body>
</html>