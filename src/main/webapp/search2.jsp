
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.util.Date"%>
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
		Date dNow = new Date( );
        SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd");
		String to_date =  ft.format(dNow) ;
		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Make a SELECT query from the sells table 
		String str = "SELECT * FROM item i, feature f where i.itemID=f.itemID";
		session.setAttribute("select", str);
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		//Make an HTML table to show the results in:
	%>
	<div class="controls">
		 <a href="sell.jsp"
			class="Button-link">Sell Item</a> <a href="search.jsp"
			class="Button-link">Search Again</a> <a href="alert.jsp"
			class="Button-link">Alert</a> <a href="logout.jsp"
			class="Button-link">Log Out</a>
	</div>
	<form action="search3.jsp" method="post">
	<select name="sort">
		<option value="0">Price Lowest to Highest</option>
		<option value="1">Price Highest to Lowest</option>
		<option value="2">Name A-Z</option>
		<option value="3">Name Z-A</option>
		<option value="4">Type</option>
	</select>&nbsp;
	<input type="submit" value="submit"/>
	</form>
	<%
	out.print("<table>");
	//make a row
	out.print("<tr>");
	//make a column
	//make a column
	out.print("<td>");
	out.print("Name");
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("Type");
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("Price");
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("Close Date");
	out.print("</td>");
	//make a column
	out.print("</tr>");
	//parse out the results
	while (result.next()) {
		//make a row
		out.print("<tr>");
		//make a column
		int temp = result.getInt("i.itemID");
		out.print("<td>");
		//Print out current item's name:
		out.print(result.getString("i.name"));
		out.print("</td>");
		out.print("<td>");
		//Print out current type
		out.print(result.getString("i.type"));
		out.print("</td>");
		out.print("<td>");
		//Print out current increment
		out.print(result.getString("i.current_price"));
		out.print("</td>");
		out.print("<td>");
		//Print out current price
		out.print(result.getString("i.close_date"));
		out.print("</td>");
		out.print("<td>");
		//Print out option
		Date a=ft.parse(result.getString("i.close_date"));
		if (ft.format(a).compareTo(to_date)<0){
			out.print("Expired");
		}
		else{
		%><form action="bid.jsp" method="post">
			<input type="hidden" name="itemID"
				value=<%=result.getString("itemID")%> /> <input type="submit"
				value="Bid" />
		</form>
		<%
		out.print("</td>");
		}
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