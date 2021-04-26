<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question</title>
</head>
<body>
    <div class="controls">
		<a href="repHomePage.jsp" class="Button-link" >Back to Home</a>
	</div>
	<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the signup.jsp
		String questions = request.getParameter("hi");
		String usernames = String.valueOf(session.getAttribute("Username"));
		//Make an insert statement for the account table:
		String insert = "INSERT INTO answer(answer)"
				+ "VALUES (?)";
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	} catch (Exception ex) {
		out.print(ex);
	}
%>
	
</body>
</html>