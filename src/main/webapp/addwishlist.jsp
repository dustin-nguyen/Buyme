<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wishlist</title>
</head>
<body>
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String one = request.getParameter("name");
		String username = String.valueOf(session.getAttribute("Username"));
		float choice2;
		if (request.getParameter("screenSize").equals("")){
			choice2=0;
		}
		else{
			choice2=Float.parseFloat(request.getParameter("screenSize"));
		}
		int choice6;
		if (request.getParameter("storageSize").equals("")){
			choice6=0;
		}
		else{
			choice6=Integer.parseInt(request.getParameter("storageSize"));
		}
		String choice3 = request.getParameter("type");
		String choice4 = request.getParameter("brand");
		
		String insert = "INSERT INTO wishList(buyer,brand,screen_size,storage_size,name,type)"
				+ "VALUES (?,?, ?,?,?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//ps.setString(1, choice4);
		//ps.setString(2, choice5);
		ps.setString(1, username);
		ps.setString(2, choice4);
		ps.setFloat(3, choice2);
		ps.setInt(4,choice6);
		ps.setString(5, one);
		ps.setString(6, choice3);
		ps.executeUpdate();
		response.sendRedirect("wishlistlist.jsp");

	//close the connection.
	db.closeConnection(con);
	} catch (Exception ex) {
	out.print(ex);
	out.print("Already exists");
	}
	%>
</body>
</html>