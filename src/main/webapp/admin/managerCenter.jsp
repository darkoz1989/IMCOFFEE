<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String greeting = "관리자 페이지";
		String tagline = "Welcome to Web Market!";		
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%= greeting %></h1>
		</div>	
	</div>
	<div class="container">
		<div class="text-center">
			<h3><%= tagline %></h3>
			<%
				//웹사이트의 리프레쉬 기능 추가
				response.setIntHeader("Refresh", 5);
				//접속시간을 표식하기 위한 자바 코드
				Calendar calendar = Calendar.getInstance();
				int hour = calendar.get(Calendar.HOUR_OF_DAY);
				int minute = calendar.get(Calendar.MINUTE);
				int second = calendar.get(Calendar.SECOND);
				int am_pm = calendar.get(Calendar.AM_PM);
				String ampm = null;
				
				if(am_pm == 0){
					ampm = "오전";
				}
				else{
					ampm = "오후";
				}
				
				String connectTime = hour + ":" + minute + ":" + second + " " + ampm; 
				out.println("현재 접속 시간 : " + connectTime + "\n");			
				
			%>			
		</div>
		<hr>	
	</div>
</body>
</html>