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
	System.out.println("�ؽ����̺�"+pCode);
%>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">�ֹ� �� ������</h1>			
		</div>	
	</div>
	
	<div class="container">		
		<div style="padding-top: 50px">
			<!-- table-hover�� ���콺 �����Ͱ� �ִ� ���� ����� �ٲپ� ���� �絵�� ������� Ŭ����  -->
			<table class="table table-hover">
				<tr>
					<th>��ǰ</th>
					<th>����</th>
					<th>����</th>
					<th>�Ұ�</th>					
				</tr>				
				<%if(hCart.isEmpty()){%>
				<tr>
					<td colspan="4" align="center">��ٱ��ϴ� ��� �ֽ��ϴ�.</td>
				</tr>	
				<%	
				}else{
					//�ؽ����̺��� ����� ��ü�� Ű���� ������.
					//Enumeration  : ������ ���� ��ü
					Enumeration<String> hCartKey = hCart.keys();
					while(hCartKey.hasMoreElements()){
						//Ű������ �ֹ���ü�� ����
						orderDTO order = hCart.get(hCartKey.nextElement());
						//��ǰ��ȣ�� ��ǰ���� ����
						String productNo = order.getoProductNo();
						ProductDTO pbean = pdao.getProductBypCode(productNo);
						String pName = pbean.getpName();//��ǰ�̸�
						int price = pbean.getpPrice();//��ǰ����
						int quantity = order.getoQuantity();//�ֹ�����
						int subTotal = price * quantity;//�ֹ�����
						//��ü�ֹ�����
						totalPrice+=subTotal;						
				%>				
				<tr>
				<form method="post" action="./products/addCartProc.jsp">
					<input type="hidden" name="oProductNo" value="<%=productNo%>">
					<th><%=pName%></th>
					<th><%=pbean.getpPrice() %></th>
					<th><input name="oQuantity" style = "text-align:right;" 
						value="<%=quantity%>" size="3">��</th>
					<th><%=subTotal %> ��</th>									
					<input type="hidden" name="flag">
					</form>
				</tr>
				<%}//--while%>
				<tr>
					<th></th>
					<th></th>
					<td colspan="4" align="right" >
						<font size="5" color="red">�� �ֹ��ݾ� : <%=totalPrice%>��</font>						
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
					<td>������ ��</td>
					<td>
						<input name="oName" type="text" class="form-control" value="<%=oName%>">
					</td>
				</tr>
				<tr>
					<td>������ �� ����ó</td>
					<td>
						<input name="oPhon" type="text" class="form-control" value="<%=oPhon%>">
					</td>
				</tr>
				<tr>
					<td>������ �� �ּ�</td>
					<td>
						<input name="oAddr" type="text" class="form-control"  value="<%=oAddr%>">
					</td>
				</tr>
			</table>			  
				  <a class="btn btn-danger" href="welcome.jsp?center=./products/cartList.jsp">���</a>
				<input type="submit" class="btn btn-success" value="�� �� �� ��">
			</form>					
		</div>
		<hr>
	</div>
</body>
</html>