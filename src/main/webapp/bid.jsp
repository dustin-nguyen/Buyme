<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"href="css/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bid Page</title>
</head>
<body style="background-color:black;
			color:white; 
			margin: 0px;
  			padding: 0px;
  			font-family: 'Righteous', cursive;">
  		<div class="controls">
		<a href="signup.jsp" class="Button-link">Buylist</a> <a
			href="signup.jsp" class="Button-link">auto bid</a> <a
			href="sell.jsp" class="Button-link">Sell Item</a> <a
			href="search.jsp" class="Button-link">Search</a> <a
			href="wishlistlist.jsp" class="Button-link">Wishlist</a> <a
			href="logout.jsp" class="Button-link">Log Out</a>
	</div>
<%
	try {
			String username = String.valueOf(session.getAttribute("Username"));
			int itemID = Integer.parseInt(request.getParameter("itemID"));
			%>
			<div class="login-box">
				<h1>
				User <%=username%> 
				</h1>
					<h2>
					ItemID <%=itemID%> 
					</h2>				
				<div class="controls">
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