<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>print 1 to 10</title>
</head>

<body>

<ul>
<%
	for (int i = 0; i<10; i++){
		%> <li> <%= i+1 %>  <%
	}
%>
</ul>

</body>

</html>
