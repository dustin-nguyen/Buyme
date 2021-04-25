<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In Logic</title>
</head>
<body>
	<div class="controls"> <a
			href="sell.jsp" class="Button-link">Sell Item</a> <a
			href="search.jsp" class="Button-link">Search</a><a
			href="logout.jsp" class="Button-link">Log Out</a>
	</div>
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String username = String.valueOf(session.getAttribute("Username"));
		String t="SELECT * from alert WHERE buyer=" + '"' + username + '"';
		ResultSet result = stmt.executeQuery(t);
		int count=0;
		while (result.next()) {
			out.print(count);
			out.print("<p>");
			out.print(result.getString("message"));
			out.print("</p>");
			out.print("<br>");
		}
		db.closeConnection(con);
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
	%>
</body>
</html>