
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
</head>
<body>
	<%
	List<String> list = new ArrayList<String>();
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		String itemID = request.getParameter("h");
		//Make a SELECT query from the sells table 
		String temp2 = "Select * from historyofbid WHERE itemID=" + itemID + " ORDER BY price DESC";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(temp2);
		//Make an HTML table to show the results in:
	%>
	<div class="controls">
		 <a href="sell.jsp"
			class="Button-link">Sell Item</a> <a href="search.jsp"
			class="Button-link">Search</a> <a href="alert.jsp"
			class="Button-link">Alert</a> <a href="logout.jsp"
			class="Button-link">Log Out</a>
	</div>
	<h1>Item <%=itemID%></h1>
	<%
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>");
	out.print("Name");
	out.print("</td>");
	out.print("<td>");
	out.print("Price");
	out.print("</td>");
	out.print("<td>");
	out.print("Date");
	out.print("</td>");
	out.print("</tr>");
	while (result.next()) {
		out.print("<tr>");
		out.print("<td>");
		%>
		<a href="sellersbuyerslist.jsp?bsell=<%= result.getString("buyer")%>"><%= result.getString("buyer") %></a>
		<%
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("price"));
		out.print("</td>");
		out.print("<td>");
		//Print out current beer name:
		out.print(result.getString("date"));
		out.print("</td>");
		out.print("</tr>");
	}
	out.print("</table>");
	//String temp = "Select * from item WHERE type=" + result.getString("type");
	//ResultSet result2 = stmt.executeQuery(temp);
	//while (result2.next()) {
		//out.print("Hi");
	//}
	//close the connection.
	con.close();
	} catch (Exception e) {
		
	}
	%>
</body>
</html>