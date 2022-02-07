<%@page import="members.MemberDTO"%>
<%@page import="orders.orderDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="products.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="cdao" class="carts.CartDAO"/>
<jsp:useBean id="mdao" class="members.MemberDAO"/>
<jsp:useBean id="pdao" class="products.ProductDAO"/>
<jsp:useBean id="odao" class="orders.orderDAO"/>
<%
	request.setCharacterEncoding("UTF-8"); 
	String userId = (String)session.getAttribute("userId");	
	
	if(session.getAttribute("userId")==null){
		response.sendRedirect("login.jsp");
		return;
	}	
%>
<body>
	<div class="jumbotron">		
		<div class="container">
			<h1 class="display-3">MY PAGE</h1>
		</div>	
	</div>	
		
	<div class="container">
	<div style = "padding: 0px 0px 0px 0px;"  align="left">
			<input type="submit" class="btn btn-danger" value="개인정보 변경">
			<input type="submit" class="btn btn-primary" value="주문현황">
			<input type="submit" class="btn btn-warning" value="QnA 게시판">
		</div>
		<form name="newMember" class="form-horizontal" action="./products/orderProc.jsp" method="post" 
			  onsubmit="return checkForm()">	
		<div style="padding-top: 50px">
			<!-- table-hover는 마우스 포인터가 있는 해의 배경을 바꾸어 눈에 띄도록 만들어진 클래스  -->
			<table class="table table-hover">
				<h3>주 문 내 역</h3> <br><br>
				<tr align="center">
					<th>주문일</th>					
					<th>제품명</th>
					<th>가격</th>
					<th>제품수량</th>
					<th>소 계</th>
					<th>주문상태</th>										
				</tr>				
				<%
					Vector<orderDTO> vlist = odao.getOrderList(userId);
						if(vlist.isEmpty()){
				%>
				<tr>
					<td colspan="5" align="center">
						주문하신 물품이 없습니다.
					</td>
				</tr>
				<%			
					}else{
						for(int i=0;i<vlist.size();i++){
							orderDTO order = vlist.get(i);
							String productNo = order.getoProductNo();			
							ProductDTO pbean = pdao.getProductBypCode(productNo);
							int price = pbean.getpPrice();//상품가격
							int quantity = order.getoQuantity();//주문수량
							int subTotal = price * quantity;//주문가격
							String Date = order.getoDate();							
				%>	
				<tr align="center">
					<td><%=Date %></td>
					<td><%=pbean.getpName()%></td>
					<td>					
						<%=pbean.getpPrice()%>
					</td>
					<td><%=order.getoQuantity() %></td>
					<td><%=subTotal %></td>
					<td>
					<%
						switch(order.getoState()){
							case "1": out.print("접수중"); break;
							case "2": out.print("접수확인"); break;
							case "3": out.print("입금확인"); break;
							case "4": out.print("배송준비"); break;
							case "5": out.print("배송중"); break;
							case "6": out.print("완료"); break;											
						}//---switch
						%>
						</td>						
				</tr>				
				<%
						} // for End
					} // if End
				%>	
			</table>
			<br><br>				
		</div>				
		</form>
		</div>
		<br><br>
		<hr>
</body>
</html>