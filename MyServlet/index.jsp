<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table border=1>
<tr align ="center">
<p><th colspan = "3" span> 수강 과목 </th></p></tr>
<tr> <th> 과목번호 <th> 과목이름 <th> 성적 </tr>

<%

Class.forName("oracle.jdbc.OracleDriver"); // Oracle JDBC 드라이버를 로딩

Connection conn = DriverManager.getConnection( // oracle 서버에 접속
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
		"db201512098", 
		"201512098");


PreparedStatement st = conn.prepareStatement("select cno,cname,grade from (enrol natural join student) natural join course");

ResultSet rs = st.executeQuery();

while (rs.next()) {
	String cno = rs.getString("cno");
	String cname = rs.getString("cname");
	String grade = rs.getString("grade");

	//System.out.format("COURSE(%s, %s, %d, %s)\n", cno, cname, grade);

	%>
	<tr> <td> <%=cno%> <td> <%=cname %> <td> <%=grade%></tr> 
	<%
}

rs.close();
st.close();
conn.close();


%>

</body>
</html>
