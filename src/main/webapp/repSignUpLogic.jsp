<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up Logic</title>
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
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
		String Name = request.getParameter("Name");
		String Email = request.getParameter("Email");

		//Make an insert statement for the account table:
		String insert = "INSERT INTO account(username,password,name,email)"
				+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, Username);
		ps.setString(2, Password);
		ps.setString(3, Name);
		ps.setString(4, Email);
        ps.setString(5, "representative");
		ps.executeUpdate();

		out.print("insert succeeded");
		session.setAttribute("Username", Username);
		response.sendRedirect("homePageLogic.jsp");
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
		<a href="signup.jsp"  type="submit">Sign Up again</a>
		<%
	}
%>
	
</body>
</html>