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
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		int flag = 0;
		String choice = request.getParameter("price");
		String select = "";
		if (choice.equals("10")) {
			select += "SELECT itemID,name,current_price,close_date,type FROM item WHERE current_price<10";
		} else if (choice.equals("100")) {
			select += "SELECT itemID,name,current_price,close_date,type FROM item WHERE current_price>=10 AND current_price <100";
		} else if (choice.equals("1000")) {
			select += "SELECT itemID,name,current_price,close_date,type FROM item WHERE current_price>=100 AND current_price <1000";
		} else if (choice.equals("1001")) {
			select += "SELECT itemID,name,current_price,close_date,type FROM item WHERE current_price>=1000";
		} else {
			select += "SELECT itemID,name,current_price,close_date,type FROM item";
			flag = 1;
		}
		String choice2 = request.getParameter("command");
		if (!choice2.equals("all")) {
			if (flag == 1) {
		select += " WHERE type = " + '"' + choice2 + '"';
			} else {
		select += " AND type = " + '"' + choice2 + '"';
			}
			flag = 0;
		}
		String choice3 = request.getParameter("namelook");
		if (!choice3.equals("")) {
			if (flag == 1) {
		select += " WHERE name like = " + "\"%" + choice3 + "%\"";
			} else {
		select += " AND name like " + "\"%" + choice3 + "%\"";
			}
			flag = 0;
		}
		//out.print(select);
		session.setAttribute("select", select);
		ResultSet result = stmt.executeQuery(select);
		if (result.next()) {
	%>
	<div class="controls">
		<a
			href="sell.jsp" class="Button-link">Sell Item</a> <a
			href="search.jsp" class="Button-link">Search Again</a> <a
			href="alert.jsp" class="Button-link">Alert</a> <a
			href="logout.jsp" class="Button-link">Log Out</a>
	</div>
	<p>Sort by:</p>
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
	out.print("<tr>");
	out.print("<td>");
	out.print("Name");
	out.print("</td>");
	out.print("<td>");
	out.print("Type");
	out.print("</td>");
	out.print("<td>");
	out.print("Price");
	out.print("</td>");
	out.print("<td>");
	out.print("Close Date");
	out.print("</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<td>");
	out.print(result.getString("name"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("type"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("current_price"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("close_date"));
	out.print("</td>");
	out.print("<td>");
	out.print("</td>");
	out.print("<td>");
	%><form action="bid.jsp" method="post">
		<input type="hidden" name="itemID"
			value=<%=result.getString("itemID")%> /> <input type="submit"
			value="Bid" />
	</form>
	<%
	out.print("</td>");
	out.print("</tr>");
	} else {
	%>
	<div class="controls">
		<a
			href="sell.jsp" class="Button-link">Sell Item</a> <a
			href="search.jsp" class="Button-link">Search</a> <a
			href="wishlistlist.jsp" class="Button-link">Wishlist</a> <a
			href="logout.jsp" class="Button-link">Log Out</a>
	</div>
	<h1>No results. Try again.</h1>
	<%
	}
	while (result.next()) {
	out.print("<tr>");
	out.print("<td>");
	out.print(result.getString("name"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("type"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("current_price"));
	out.print("</td>");
	out.print("<td>");
	//Print out current beer name:
	out.print(result.getString("close_date"));
	out.print("</td>");
	out.print("<td>");
	out.print("</td>");
	out.print("<td>");
	%><form action="bid.jsp" method="post">
		<input type="hidden" name="itemID"
			value=<%=result.getString("itemID")%> /> <input type="submit"
			value="Bid" />
	</form>
	<%
	out.print("</td>");
	out.print("</tr>");
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