<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"href="css/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home Page</title>
</head>
<body style="background-color:black;
			color:white; 
			margin: 0px;
  			padding: 0px;
  			font-family: 'Righteous', cursive;">
<%
	try {
			String username = String.valueOf(session.getAttribute("Username"));
			String name = String.valueOf(session.getAttribute("name"));
			String type = String.valueOf(session.getAttribute("type"));
			
			%>
			<div class="welcome">
				<h1>
				Edit End User
				</h1>
									
				<div class="controls">
					<form action="adminEditFunctions.jsp" method="post">
				<p>Edit this person:</p>
					<input type="text" name="username"> <br>
					<form method="post" action="editEndUser2.jsp">
					<input type="submit" value="submit" />
				</form>
					<a href="repHomePage.jsp" class="Button-link">Go Back</a>
					<a href="logout.jsp" class="Button-link">Log Out</a>
				</div>
			</div>

       		 <%

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
%>
</body>
</html>