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
	<!-- ����Ʈ���� �����������̶�� �ǹ̸� ���ϰ� �ִ�.����Ʈ�� �ȿ��� �پ��� ������Ʈ(�ؽ�Ʈ,�̹���,ȸ��ΰ� ��)�� ������ �����ϴ�. -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">��ǰ ���</h1>
		</div>	
	</div>
	
	<div class="container">
		<!-- class="form-horizontal"�� ����ҵ��� ���������� ��ġ�� �ǵ��� ���ش�. -->
		<form name="newProduct" action="./productManager/mproductProc.jsp?flag=insert" class="form-horizontal" 
			  method="post" enctype="multipart/form-data">
			
			<div class="form-group row">
			<!-- ȭ��ũ�Ⱑ 768px�̻��� �� col-sm-? �� �κ��� ������ �ǰ�,div����� blockƯ���� ���ؼ� 100%�ʺ� ������
			�������� ���̰� ������ش�. -->
				<label class="col-sm-2"><b>��ǰ �ڵ�</b></label>
				<div class="col-sm-3">
					<input type="text" name="pCode" class="form-control" placeholder="��ǰ�ڵ带 �Է��ϼ���." value="p">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>��ǰ��</b></label>
				<div class="col-sm-3">
					<input type="text" name="pName" class="form-control" placeholder="��ǰ���� �Է��ϼ���." value="������ī1">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>����</b></label>
				<div class="col-sm-3">
					<input type="text" name="pPrice" class="form-control" placeholder="������ �Է��ϼ���." value="1077">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>�� ����</b></label>
				<div class="col-sm-5">
					<input type="text" name="pDescription" class="form-control" placeholder="��ǰ������ �Է��ϼ���." value="������ī ����">
					<!-- <textarea name="description" cols="50" rows="2" class="form-control">
					</textarea> -->				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>������</b></label>
				<div class="col-sm-3">
					<input type="text" name="pManufacturer" class="form-control" placeholder="�������� �Է��ϼ���." value="������ī">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>�з�</b></label>
				<div class="col-sm-3">
					<input type="text" name="pCategory" class="form-control" placeholder="�з��� �Է��ϼ���." value="af">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>��� ��</b></label>
				<div class="col-sm-3">
					<input type="text" name="pStock" class="form-control" placeholder="�������� �Է��ϼ���." value="100">				
				</div>				
			</div>			
			<!-- ��ǰ �̹��� ���ε� �κ� -->
			<div class="form-group row">
				<label class="col-sm-2"><b>�̹���</b></label>				
				<div class="col-sm-5">
					<input type="file" name="pFilename" class="form-control">									
				</div>				
			</div>
					
			<div class="form-group row">
				<!-- offset������ col�� 2��ŭ ����� -->
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="���">		
				</div>				
			</div>		
		</form>	
	</div>
	<br>
	<hr>
</body>
</html>