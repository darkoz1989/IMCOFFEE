<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 점보트론은 대형전광판이라는 의미를 지니고 있다.점보트론 안에는 다양한 컴포넌트(텍스트,이미지,회사로고 등)가 포함이 가능하다. -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>	
	</div>
	
	<div class="container">
		<!-- class="form-horizontal"은 폼요소들이 수평적으로 배치가 되도록 해준다. -->
		<form name="newProduct" action="./productManager/mproductProc.jsp?flag=insert" class="form-horizontal" 
			  method="post" enctype="multipart/form-data">
			
			<div class="form-group row">
			<!-- 화면크기가 768px이상일 때 col-sm-? 이 부분이 적용이 되고,div요소의 block특성에 의해서 100%너비를 가지면
			수직으로 쌓이게 만들어준다. -->
				<label class="col-sm-2"><b>상품 코드</b></label>
				<div class="col-sm-3">
					<input type="text" name="pCode" class="form-control" placeholder="상품코드를 입력하세요." value="p">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>상품명</b></label>
				<div class="col-sm-3">
					<input type="text" name="pName" class="form-control" placeholder="상품명을 입력하세요." value="아프리카1">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>가격</b></label>
				<div class="col-sm-3">
					<input type="text" name="pPrice" class="form-control" placeholder="가격을 입력하세요." value="1077">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>상세 정보</b></label>
				<div class="col-sm-5">
					<input type="text" name="pDescription" class="form-control" placeholder="상품정보를 입력하세요." value="아프리카 설명">
					<!-- <textarea name="description" cols="50" rows="2" class="form-control">
					</textarea> -->				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>제조사</b></label>
				<div class="col-sm-3">
					<input type="text" name="pManufacturer" class="form-control" placeholder="제조사을 입력하세요." value="아프리카">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>분류</b></label>
				<div class="col-sm-3">
					<input type="text" name="pCategory" class="form-control" placeholder="분류를 입력하세요." value="af">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>재고 수</b></label>
				<div class="col-sm-3">
					<input type="text" name="pStock" class="form-control" placeholder="재고수량을 입력하세요." value="100">				
				</div>				
			</div>			
			<!-- 상품 이미지 업로드 부분 -->
			<div class="form-group row">
				<label class="col-sm-2"><b>이미지</b></label>				
				<div class="col-sm-5">
					<input type="file" name="pFilename" class="form-control">									
				</div>				
			</div>
					
			<div class="form-group row">
				<!-- offset지정은 col의 2만큼 띄워라 -->
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">		
				</div>				
			</div>		
		</form>	
	</div>
	<br>
	<hr>
</body>
</html>