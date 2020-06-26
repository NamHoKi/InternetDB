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

<tr> <th> 과목번호 <th> 과목이름 <th> 학점 <th> 학과 <th> 담당교수 </tr>

<%
	String student_number = request.getParameter("sno");
	Class.forName("oracle.jdbc.OracleDriver"); // Oracle JDBC 드라이버를 로딩

			Connection conn = DriverManager.getConnection( // oracle 서버에 접속
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201512098", 
			"201512098");
	
	PreparedStatement st = conn.prepareStatement("select * from course where cno not in (select cno from enrol where sno='"+student_number+"')");
	ResultSet rs = st.executeQuery();
	
	while (rs.next()) {
		String cno = rs.getString("cno");
		String cname = rs.getString("cname");
		int credit = rs.getInt("credit");
		String dept = rs.getString("dept");
		String professor = rs.getString("professor");

%>

<tr>
	<td><a href="index.jsp?cno=<%=cno%>">	<%=cno%>
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