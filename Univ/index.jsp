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
<p><th colspan = "3" span> ���� ���� </th></p></tr>
<tr> <th> �����ȣ <th> �����̸� <th> ���� </tr>

<%
	String ID = request.getRemoteUser();
	String course_add_cno = request.getParameter("cno");


	

	Class.forName("oracle.jdbc.OracleDriver"); // Oracle JDBC ����̹��� �ε�

			Connection conn = DriverManager.getConnection( // oracle ������ ����
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201512098", 
			"201512098");
	
	if (course_add_cno != null) { // ���� �߰�

		PreparedStatement insert_sql = conn.prepareStatement("insert into enrol(sno,cno) values ('"+ID+"','"+course_add_cno+"')");

		ResultSet insert_sql_rs = insert_sql.executeQuery();

	}
	
	
	PreparedStatement st = conn.prepareStatement("select course.cno,cname,grade from (enrol natural join student) join course on enrol.CNO = course.CNO where sno='"+ID+"'");
	
	ResultSet rs = st.executeQuery();
	
	while (rs.next()) {
		String cno = rs.getString("cno");
		String cname = rs.getString("cname");
		String grade = rs.getString("grade");
		
		if (grade == null) grade = " "; // ������ null�� �ȶߵ��� ����

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