<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"href="css/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Home Page</title>
</head>
<body style="background-color:black;
			color:white; 
			margin: 0px;
  			padding: 0px;
  			font-family: 'Righteous', cursive;">
	<div class="sign-up-box">
		<h1>Sign Up</h1>
		<form method="post" action="repSignUpLogic.jsp">
		    <!-- note the welcome.jsp will be invoked when the choice is made -->
		 <div class="textbox">
		 	<tr>    
				<td>Username</td><td><input type="text" name="Username" placeholder="Enter Username" required></td>
			</tr>
		 </div>
		  <div class="textbox">
		 	<tr>    
				<td>Password</td><td><input type="text" name="Password" placeholder="Enter Password" required></td>
			</tr>
		 </div>
		 <div class="textbox">
		 	<tr>    
				<td>Name</td><td><input type="text" name="Name" placeholder="Enter Fullname" required></td>
			</tr>
		 </div>
		  <div class="textbox">
		 	<tr>    
				<td>Email</td><td><input type="text" name="Email" placeholder="Enter Email" required></td>
			</tr>
		 </div>
		  <input type="submit" class ="Sign-up-button" value="Sign up" />
		</form>
		<div class="controls">
			<a href="adimnHomePage.jsp" class="Button-link" type="submit">Enter</a>
		</div>
	</div>
<%
	try {
			String username = String.valueOf(session.getAttribute("Username"));
			String name = String.valueOf(session.getAttribute("name"));
			String type = String.valueOf(session.getAttribute("type"));
			
			%>						
			<div class="controls">
				/*<form action="adminEditFunctions.jsp" method="post">
				<p>Edit this person:</p>
					<input type="text" name="username"> <br>
					<input type="submit" value="submit" />
				</form>*/
				<br>
				<a href="adminHomePage.jsp" class="Button-link">Go Back</a>
				<br>
				<a href="logout.jsp" class="Button-link">Log Out</a>
			</div>
       		 <%

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
%>
</body>
</html>