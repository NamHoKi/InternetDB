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
<p><th colspan = "3" span> 수강 과목 </th></p></tr>
<tr> <th> 과목번호 <th> 과목이름 <th> 성적 </tr>

<%
	String ID = request.getRemoteUser();
	String course_add_cno = request.getParameter("cno");


	

	Class.forName("oracle.jdbc.OracleDriver"); // Oracle JDBC 드라이버를 로딩

			Connection conn = DriverManager.getConnection( // oracle 서버에 접속
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201512098", 
			"201512098");
	
	if (course_add_cno != null) { // 과목 추가

		PreparedStatement insert_sql = conn.prepareStatement("insert into enrol(sno,cno) values ('"+ID+"','"+course_add_cno+"')");

		ResultSet insert_sql_rs = insert_sql.executeQuery();

	}
	
	
	PreparedStatement st = conn.prepareStatement("select course.cno,cname,grade from (enrol natural join student) join course on enrol.CNO = course.CNO where sno='"+ID+"'");
	
	ResultSet rs = st.executeQuery();
	
	while (rs.next()) {
		String cno = rs.getString("cno");
		String cname = rs.getString("cname");
		String grade = rs.getString("grade");
		
		if (grade == null) grade = " "; // 성적이 null이 안뜨도록 공백

%>

<tr>
	<td>
	<a href="course-info.jsp?cno=<%=cno%>">	<%=cno%>
	<td><%=cname%>
	<td><%=grade%>
</tr>

<%
	}
	rs.close();
	st.close();
	conn.close();

%>
</table>
	<ul>
		<li><a href="course-add.jsp?sno=<%=ID%>">Add course</a></li>
		<li><a href="logout.jsp">Log out</a></li>
	</ul>



</body>
</html>