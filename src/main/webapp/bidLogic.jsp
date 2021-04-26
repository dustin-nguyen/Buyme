<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.text.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid Logic</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the bid.jsp
		int itemID = Integer.parseInt(request.getParameter("itemID"));
		int price = Integer.parseInt(request.getParameter("price"));
		String buyer = String.valueOf(session.getAttribute("Username"));
		// get current date
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd ");
		//String to_date = "TO_DATE(" + ft.format(dNow) + ",'YYYY-MM-DD')";
		String to_date = ft.format(dNow);
		//Make an insert statement for the historyOfBid table:
		String insert = "INSERT INTO historyOfBid(itemID,buyer,price,date)" + "VALUES (?, ?, ?, ?)";

		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setInt(1, itemID);
		ps.setString(2, buyer);
		ps.setInt(3, price);
		ps.setString(4, to_date);
		ps.executeUpdate();

		String username = String.valueOf(session.getAttribute("Username"));
		//Make an update statement for the item table:
		String update = "UPDATE item SET current_price = " + '"' + price + '"' + ",buyer = " + '"' + username + '"'
		+ " WHERE itemID =" + '"' + itemID + '"';
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement up = con.prepareStatement(update);
		up.executeUpdate();

		String doit = "Select distinct buyer from historyofbid where itemID=" + itemID + " AND buyer!= " + "\"" + username + "\"";
		ResultSet result = stmt.executeQuery(doit);
		while (result.next()) {
			String insertFeature2 = "INSERT INTO alert(buyer,message) VALUES (?, ?)";
			PreparedStatement pp = con.prepareStatement(insertFeature2);
			pp.setString(1, result.getString("buyer"));
			pp.setString(2, "Someone outbid you. Bid to get your item!");
			pp.executeUpdate();
		}
		out.print("insert succeeded");
		response.sendRedirect("customerHomePage.jsp");
		//response.sendRedirect("homePageLogic.jsp");
		//send username to homepage.jsp
		//request.setAttribute("Username",Username);
		//RequestDispatcher rs = request.getRequestDispatcher("homepage.jsp"); //the page you want to send your value
		//rs.forward(request,response);

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	%>
	<a href="homePageLogic" type="submit">Back to HomePage</a>
	<%
	}
	%>

</body>
</html>