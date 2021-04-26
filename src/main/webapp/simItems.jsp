<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Similar Items in the Past Month</title>
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
		String itemID = request.getParameter("sim");
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH, -1);
		Date date = calendar.getTime();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String month = format.format(date);
		Date dNow = new Date( );
        SimpleDateFormat ft = 
        new SimpleDateFormat ("yyyy-MM-dd ");
		String to_date =  ft.format(dNow) ;
		//Make a SELECT query from the sells table 
		String temp2 = "SELECT * from item t where t.itemID!=" + itemID + " AND t.close_date <=" +"\""+ to_date +"\"" + " AND t.close_date >=" +"\""+ month +"\""+ " AND t.type IN (Select i.type from item i WHERE i.itemID=" + itemID + ")";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(temp2);
		//Make an HTML table to show the results in:
	%>
	<div class="controls">
	<a href="customerHomePage.jsp" class="Button-link" type="submit">Back
				to Home Page</a>
		<a href="sell.jsp" class="Button-link" >Sell Item</a>
					<br>
					<a href="search.jsp" class="Button-link" >Search</a>
					<br>
					<a href="wishlistlist.jsp" class="Button-link" >Wishlist</a>
					<br>
					<a href="question.jsp" class="Button-link" >Ask question</a>
					<br>
					<a href="alert.jsp" class="Button-link" >Alert</a>
					<br>
					<a href="logout.jsp" class="Button-link">Log Out</a>
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
	out.print("Type");
	out.print("</td>");
	out.print("<td>");
	out.print("Close Date");
	out.print("</td>");
	out.print("</tr>");
	while (result.next()) {
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getString("name"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("current_price"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("close_date"));
		out.print("</td>");
		out.print("</tr>");
	}
	out.print("</table>");
	con.close();
	} catch (Exception e) {
		
	}
	%>
</body>
</html>