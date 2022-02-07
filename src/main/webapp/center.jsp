<%@page import="products.ProductDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.ProductDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function loginCheck() {
		alert('로그인 후 이용가능합니다.');		
	}
</script>
</head>
<jsp:useBean id="pbean" class="products.ProductDAO"/>
<body>	
	<%
		String greeting = "&sstarf; IM COFFEE &sstarf;";		
		String userId = (String)session.getAttribute("userId");
	%>
	<!--  	<div class="jumbotron">	</div> -->
		<div class="container p-4">
			<h1 class="display-3" style="color: #015132"><%= greeting %></h1>
		</div>	
	
		<!-- navbar -->
	<nav class="navbar navbar-expand navbar-light bg-light">
	<div class="container">
	  <a class="navbar-brand">IM COFFEE</a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	    
	<li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          SOUTH AMERICA
	</a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Brazil 브라질</a>
	    <a class="dropdown-item" href="#">Colombia 콜롬비아</a>
	</div>
	      </li>
	
	<li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          CENTRAL AMERICA
	  </a>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	    <a class="dropdown-item" href="#">Costa Rica 코스타리카</a>
	    <a class="dropdown-item" href="#">Guatemala 과테말라</a>
	    <a class="dropdown-item" href="#">Panama 파나마</a>
	    <a class="dropdown-item" href="#">Honduras 온두라스</a>
	    <a class="dropdown-item" href="#">Nicaragua 니카라과</a>
	    <a class="dropdown-item" href="#">Mexico 멕시코</a>
	  </div>
	</li>
	
	<li class="nav-item dropdown">
	   <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          AFRICA
	  </a>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	    <a class="dropdown-item" href="#">Ethiopia 에티오피아</a>
	    <a class="dropdown-item" href="#">Kenya 케냐
	    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	    <a class="dropdown-item" href="#">AA</a>
	    <a class="dropdown-item" href="#">AB</a>
	    <a class="dropdown-item" href="#">PB</a>
	    </div></a>
	    <a class="dropdown-item" href="#">Tanzania 탄자니아</a>
	  </div>
	</li>
	
	<li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          ASIA & OTHERS
	  </a>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	    <a class="dropdown-item" href="#">Indonesia 인도네시아</a>
	    <a class="dropdown-item" href="#">P.N.G. 파푸아뉴기니</a>
	    <a class="dropdown-item" href="#">India 인도</a>
	    <a class="dropdown-item" href="#">Vietnam 베트남</a>
	  </div>
	  </li>
	<button type="button" class="btn btn-outline-success">디카페인</button>
	</div>
	</div>
	</nav>
	
	<!-- carousel  -->	
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators">
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  </ol>
	  <div class="carousel-inner">
	    <div class="carousel-item active">    	
	      <img src="./images/carousel001.jpg" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	        <h1>&#x000A9; KIM GYUNAM</h1>
	        </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./images/carousel000.webp" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	        <h1>&copy; LEE GIHWAN</h1>
	        </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./images/carousel003.jpg" class="d-block w-100" alt="...">
	       <div class="carousel-caption d-none d-md-block">
	        <h1>&#x000A9; HEO YUNYEONG</h1>
	        </div>
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
		
		
	<%	
		Vector<ProductDTO> pvdto =  pbean.getProductList();
	%>
	<div class="container mt-5">
		<div class="row" align="center">
			<%
				for(int i=0; i<pvdto.size(); i++) {
					ProductDTO pdto = pvdto.get(i);
			%>
			<div class="col-md-4">
				<!-- 경로를 지정해서 이미지를 출력하고 있다. -->	
							<!-- C:/IT/JSP/WORKSPACE/ACADEMY/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/IMCOFFEE/resources/upload/ -->
				<img src="./resources/upload/<%= pdto.getpFilename() %>"  
					 style="width: 100%">
				<h3><%=pdto.getpName() %> </h3>
				<p><%=pdto.getpDescription() %></p>
				<p><%=pdto.getpPrice() %>원</p>
				<!-- 상품의 아이디에 대한 상세 정보 페이지를 연결시키기 위해서 아래 코드를 작성하였다. -->
				<p>
				<%if(userId!=null) {%>
				<a href="welcome.jsp?center=./products/productDetail.jsp?pCode=<%=pdto.getpCode()%>"
				class="btn btn-info" role="button">상세 정보 &raquo;</a></p>				
				<%} else{%>
					<a onclick="loginCheck()" class="btn btn-outline-info" role="button">상세 정보 &raquo;</a></p>
				<%} %> 				 				
			</div>
			<%
				}
			%>		
		</div>
		<hr>
	</div>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  	
</body>
</html>