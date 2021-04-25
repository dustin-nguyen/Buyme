<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"href="css/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page Logic</title>
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
	//	out.print(Username); //debug
		//Make an select statement for the account table:
		String select = "SELECT * FROM account WHERE username = "+'"'+Username+'"' ;
	//	out.print(select); //debug
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(select);
	// username is primary key=> result only has 1 tuple
			String name,type;
	// move the pointer to the first row, before asking for data:
			result.beforeFirst();
			result.next();
			
			
			name=result.getString("name");
			session.setAttribute("name", name);
			
			type=result.getString("type");
			session.setAttribute("type", type);
			if(type.equals("customers")){
				response.sendRedirect("customerHomePage.jsp");
			}else if(type.equals("representative")){
				response.sendRedirect("adminHomePage.jsp");
			}
			else{
				//response.sendRedirect("customerHomePage.jsp");
				response.sendRedirect("adminHomePage.jsp");
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