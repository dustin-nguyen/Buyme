<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<body>
	<%
	try {
		Date dNow = new Date( );
        SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd");
		String to_date =  ft.format(dNow) ;
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String choice = request.getParameter("price");
		String select = "";
		if (choice.equals("10")) {
			select += "SELECT * FROM item i,feature f WHERE i.itemID=f.itemID AND i.current_price<10";
		} else if (choice.equals("100")) {
			select += "SELECT * FROM item i,feature f WHERE i.itemID=f.itemID AND i.current_price>=10 AND i.current_price <100";
		} else if (choice.equals("1000")) {
			select += "SELECT * FROM item i,feature f WHERE i.itemID=f.itemID AND i.current_price>=100 AND i.current_price <1000";
		} else if (choice.equals("1001")) {
			select += "SELECT * FROM item i,feature f WHERE i.itemID=f.itemID AND i.current_price>=1000";
		} else {
			select += "SELECT * FROM item i,feature f WHERE i.itemID=f.itemID";
		}
		String choice2 = request.getParameter("command");
		if (!choice2.equals("all")) {
		select += " AND i.type = " + '"' + choice2 + '"';
		}
		String choice3 = request.getParameter("namelook");
		if (!choice3.equals("")) {
		select += " AND i.name like " + "\"%" + choice3 + "%\"";
		}
		String choice4 = request.getParameter("command2");
		if (!choice4.equals("all")) {
			select += " AND f.brand = " + '"' + choice4 + '"';
		}
		//out.print(select);
		session.setAttribute("select", select);
		ResultSet result = stmt.executeQuery(select);
		if (result.next()) {
	%>
	<div class="controls">
		<a href="customerHomePage.jsp" class="Button-link" type="submit">Back
				to Home Page</a>
		<a href="sell.jsp" class="Button-link" >Sell Item</a>
					<br>
					<a href="search.jsp" class="Button-link" >Search Again</a>
					<br>
					<a href="wishlistlist.jsp" class="Button-link" >Wishlist</a>
					<br>
					<a href="question.jsp" class="Button-link" >Ask question</a>
					<br>
					<a href="alert.jsp" class="Button-link" >Alert</a>
					<br>
					<a href="logout.jsp" class="Button-link">Log Out</a>
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
	out.print("Brand");
	out.print("</td>");
	out.print("<td>");
	out.print("Screen Size");
	out.print("</td>");
	out.print("<td>");
	out.print("Storage Size");
	out.print("</td>");
	out.print("<td>");
	out.print("Price");
	out.print("</td>");
	out.print("<td>");
	out.print("Close Date");
	out.print("</td>");
	out.print("<td>");
	out.print("Status");
	out.print("</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<td>");
	out.print(result.getString("i.name"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("i.type"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("f.brand"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("f.screen_size"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("f.storage_size"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("i.current_price"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("i.close_date"));
	out.print("</td>");
	out.print("<td>");
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
	out.print(result.getString("i.name"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("i.type"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("f.brand"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("f.screen_size"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("f.storage_size"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("i.current_price"));
	out.print("</td>");
	out.print("<td>");
	//Print out current beer name:
	out.print(result.getString("i.close_date"));
	out.print("</td>");
	out.print("<td>");
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