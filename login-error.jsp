<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<% 
	Integer fail_count = null;
		
		synchronized (session){
			
			fail_count = (Integer) session.getAttribute("fail_count");
			
			if(fail_count == null)fail_count = 0;
			
			fail_count++;
			session.setAttribute("fail_count",fail_count);
			response.sendRedirect("login.jsp");
		}
%>

<body>
<h1>Login Error !</h1>
</body>
</html>