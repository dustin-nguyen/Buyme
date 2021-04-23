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
		int id = Integer.parseInt(request.getParameter("wl"));
		String buyer = String.valueOf(session.getAttribute("Username"));
		String t="SELECT itemID from wishlist WHERE buyer="+ '"' +buyer+'"' +" and itemID="+id;
		ResultSet result = stmt.executeQuery(t);
		if(!result.next()){
			String insert = "INSERT INTO wishlist(itemID,buyer)"
					+ "VALUES (?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
			ps.setInt(1,id);
			ps.setString(2,buyer);
			ps.executeUpdate();
		}
		response.sendRedirect("search3.jsp");
		db.closeConnection(con);
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
	%>
</body>
</html>