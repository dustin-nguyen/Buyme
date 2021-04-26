<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Questions</title>
</head>
<body>
	<div class="controls">
		<a href="questions2.jsp" class="Button-link" type="submit">Answer Question</a>
		<a href="repHomePage.jsp" class="Button-link" >Back to Home</a>
	</div>
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String l="SELECT * from question q left join answer a ON q.questID=a.questID";
		ResultSet result = stmt.executeQuery(l);
		while (result.next()) {
			out.print("<h1>");
			out.print(result.getString("q.question"));
			out.print("</h1>");
			out.print("<p>");
			if (result.getString("a.answer")==null){
				out.print("Not answered");
			}
			else{
				out.print(result.getString("a.answer"));
				out.print("</p>");
			}
		}
        

		//close the connection.
		out.print("</table>");
		db.closeConnection(con);
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
	%>
</body>
</html>