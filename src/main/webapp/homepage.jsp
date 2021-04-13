<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"href="css/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
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
			type=result.getString("type");

			%>
			<div class="welcome">
				<h1>
				Welcome <%=name%> (<%=type%>)
				</h1>
									
				<div class="controls">
					<a href="signup.jsp" class="Button-link" >auto bid</a>
					<br>
					<a href="signup.jsp" class="Button-link" >sell</a>
					<br>
					<a href="signup.jsp" class="Button-link" >Search</a>
					<br>
					<a href="signup.jsp" class="Button-link" >Buy</a>
					<br>
					<a href="logout.jsp" class="Button-link">Sign Out</a>
				</div>
			</div>

       		 <%

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
%>
</body>
</html>