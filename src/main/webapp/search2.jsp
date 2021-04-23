
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

		//Make a SELECT query from the sells table 
		String str = "SELECT * FROM item ";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		//Make an HTML table to show the results in:
	%>
	<div class="controls">
		<a href="signup.jsp" class="Button-link">Buylist</a> <a
			href="signup.jsp" class="Button-link">auto bid</a> <a href="sell.jsp"
			class="Button-link">Sell Item</a> <a href="search.jsp"
			class="Button-link">Search</a> <a href="wishlistlist.jsp"
			class="Button-link">Wishlist</a> <a href="logout.jsp"
			class="Button-link">Log Out</a>
	</div>
	<%
	out.print("<table>");
	//make a row
	out.print("<tr>");
	//make a column
	out.print("<td>");
	//print out column header
	out.print("itemID");
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("name");
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("type");
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("increment");
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("price");
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("option");
	out.print("</td>");
	out.print("</tr>");
	//parse out the results
	while (result.next()) {
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//Print out current itemID:
		int temp = result.getInt("itemID");
		out.print(temp);
		out.print("</td>");
		out.print("<td>");
		//Print out current item's name:
		out.print(result.getString("name"));
		out.print("</td>");
		out.print("<td>");
		//Print out current type
		out.print(result.getString("type"));
		out.print("</td>");
		out.print("<td>");
		//Print out current increment
		out.print(result.getString("increment"));
		out.print("</td>");
		out.print("<td>");
		//Print out current price
		out.print(result.getString("current_price"));
		out.print("</td>");
		out.print("<td>");
		//Print out option
	%>
	<form action="bid.jsp" method="post">
		<input type="hidden" name="itemID" value=<%=temp%> /> <input
			type="submit" value="Bid" />
	</form>
	<form action="bid.jsp" method="post">
		<input type="hidden" name="itemID" value=<%=temp%> /> <input
			type="submit" value="Auto Bid" />
	</form>
	<%
	out.print("</td>");
	out.print("</tr>");
	}
	out.print("</table>");
	//close the connection.
	con.close();
	} catch (Exception e) {
	}
	%>
</body>
</html>