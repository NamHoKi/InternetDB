<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1> ������û �α��� </h1>

<%
		Integer fail_count = (Integer)session.getAttribute("fail_count");	

		if(fail_count == null)
			fail_count = 0;
%>

<p><%=fail_count %>�� �����߽��ϴ�.</p>
		 
<form action="j_security_check" method="post">

	 <p>�й�:<input type="text" name="j_username"/></p>
	 <p>��ȣ:<input type="password" name="j_password"/></p>
	 <input type="submit" name ="login" value="�α���">

</form>

</body>
</html>