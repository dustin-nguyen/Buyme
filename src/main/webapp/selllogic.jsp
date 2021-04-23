<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Logic</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the signup.jsp
		int secretPrice = Integer.parseInt(request.getParameter("secretPrice"));
		int increment = Integer.parseInt(request.getParameter("increment"));
		int initalPrice = Integer.parseInt(request.getParameter("initalPrice"));
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String seller = String.valueOf(session.getAttribute("Username"));
		String closeDate = request.getParameter("closeDate");

		String to_date= "TO_DATE("+closeDate+",'YYYY-MM-DD')";
		//Make an insert statement for the account table:
		String insert = "INSERT INTO item(name,current_price,increment,inital_price,secret_price,seller,close_date,type)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, name);
		ps.setInt(2, initalPrice); // current = inital price
		ps.setInt(3, increment);
		ps.setInt(4, initalPrice);
		ps.setInt(5, secretPrice);
		ps.setString(6, seller);
		ps.setString(7, closeDate);
		ps.setString(8, type);
		ps.executeUpdate();

		out.print("insert succeeded");
		out.print(type);
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
		<a href="homePageLogic"  type="submit">Back to HomePage</a>
		<%
	}
%>
	
</body>
</html>