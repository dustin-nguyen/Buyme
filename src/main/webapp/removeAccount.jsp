<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"href="css/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Account</title>
</head>
<body style="background-color:black;
			color:white; 
			margin: 0px;
  			padding: 0px;
  			font-family: 'Righteous', cursive;">
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from signuplogic.jsp
		String Username = String.valueOf(session.getAttribute("Username"));
		String type = String.valueOf(session.getAttribute("type"));
	//	out.print(Username); //debug
		//Make an select statement for the account table:
		String delete = "DELETE FROM account WHERE username = "+'"'+Username+'"' ;
	//	out.print(select); //debug
		//Run the query against the database.
		int result = stmt.executeUpdate(delete);
	
			if(type.equals("admin")){
				out.print("Cannot delete Admin Account\n");
			}else {
				out.print("Account Deleted Successfully!\n");
				response.sendRedirect("signin.jsp");
			}


		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
%>
</body>
</html>