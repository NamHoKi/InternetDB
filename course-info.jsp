<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<tr align ="center">

<tr> <th> �����ȣ <th> �����̸� <th> ���� <th> �а� <th> ��米�� </tr>

<%
	String search_cno = request.getParameter("cno");
	Class.forName("oracle.jdbc.OracleDriver"); // Oracle JDBC ����̹��� �ε�

			Connection conn = DriverManager.getConnection( // oracle ������ ����
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201512098", 
			"201512098");
	
	PreparedStatement st = conn.prepareStatement("select * from course where cno='"+search_cno+"'");
	
	ResultSet rs = st.executeQuery();
	
	while (rs.next()) {
		String cno = rs.getString("cno");
		String cname = rs.getString("cname");
		int credit = rs.getInt("credit");
		String dept = rs.getString("dept");
		String professor = rs.getString("professor");

%>

<tr>
	<td><%=cno%>
	<td><%=cname%>
	<td><%=credit%>
	<td><%=dept%>
	<td><%=professor%>
</tr>

<%
	}
	rs.close();
	st.close();
	conn.close();

%>
</table>
	<ul>
		<li><a href="logout.jsp">Log out</a></li>
	</ul>



</body>
</html>