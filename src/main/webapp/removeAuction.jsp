<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe</title>
    <link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body> 
    	<div class="content">
    		<form action="removeAuction2.jsp" method="POST">
           		<label>Seller</label>
           		<input type="text" name="seller" placeholder="Username" required><br>
            	
            	<label>Enter Your Password</label>
            	<input type="password" name="your_password" placeholder="Enter Password" required> <br>
            	
            	<label>Confirm Your Password</label>
            	<input type="password" name="confirm_your_password" placeholder="Confirm Password" required> <br>
    			
    			<input type="submit" value="Cancel The Auction">
    		</form>
    		
    	</div>
</body>
</html>