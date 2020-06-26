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

<h1> 수강신청 로그인 </h1>

<%
		Integer fail_count = (Integer)session.getAttribute("fail_count");	

		if(fail_count == null)
			fail_count = 0;
%>

<p><%=fail_count %>번 실패했습니다.</p>
		 
<form action="j_security_check" method="post">

	 <p>학번:<input type="text" name="j_username"/></p>
	 <p>암호:<input type="password" name="j_password"/></p>
	 <input type="submit" name ="login" value="로그인">

</form>

</body>
</html>