<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="css/Bid.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bid Page</title>
</head>
<body
	style="background-color: black; color: white; margin: 0px; padding: 0px; font-family: 'Righteous', cursive;">
	<div class="controls">
	<a href="customerHomePage.jsp" class="Button-link" type="submit">Back
				to Home Page</a>
		<a href="sell.jsp" class="Button-link" >Sell Item</a>
					<br>
					<a href="search.jsp" class="Button-link" >Search</a>
					<br>
					<a href="wishlistlist.jsp" class="Button-link" >Wishlist</a>
					<br>
					<a href="question.jsp" class="Button-link" >Ask question</a>
					<br>
					<a href="alert.jsp" class="Button-link" >Alert</a>
					<br>
					<a href="logout.jsp" class="Button-link">Log Out</a>
	</div>
	<br>
	<%
	try {
		Date dNow = new Date( );
        SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd");
		String to_date =  ft.format(dNow) ;
		String username = String.valueOf(session.getAttribute("Username"));
		int itemID = Integer.parseInt(request.getParameter("itemID"));
		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Make an select statement for the account table:
		String select = "SELECT * FROM item WHERE itemID = " + '"' + itemID + '"';
		//	out.print(select); //debug
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(select);
		// username is primary key=> result only has 1 tuple
		String name, type;
		// if cannot find username with the password
		if (!result.next()) {
	%>
	<a href="customerHomePage.jsp" type="submit">Cannot find item in
		item table </a>
	<%
	} else {
		int increment = Integer.parseInt(result.getString("increment"));
		int current_price = Integer.parseInt(result.getString("current_price"));
	%>
	<div class="bid-box">
		<h1>
			User
			<%=username%>
		</h1>
		<div class="textbox">
			<tr>
				<td>ItemID: <%=result.getString("itemID")%></td>
			</tr>
		</div>
		<div class="textbox">
			<tr>
				<td>Item's name: <%=result.getString("name")%></td>
			</tr>
		</div>
		<div class="textbox">
			<tr>
				<td>Item's type: <%=result.getString("type")%></td>
			</tr>
		</div>
		<div class="textbox">
			<tr>
				<td>Current price: <%=current_price%></td>
			</tr>
		</div>
		<div class="textbox">
			<tr>
				<td>Increment: <%=increment%></td>
			</tr>
		</div>
		<div class="textbox">
			<tr>
				<td>Close date: <%=result.getString("close_date")%></td>
			</tr>
		</div>
		
		<%
		Date a=ft.parse(result.getString("close_date"));
		if (ft.format(a).compareTo(to_date)<0){
			out.print("Expired");
		}
		else if(result.getString("seller").equals(username)){
			out.print("This is your own auction");
		}
		else{
		%>
		<form method="post" action="bidLogic.jsp">
			<div class="textbox">
				<tr>
					<td>Bid</td>
					<td><input type="number" name="price"
						placeholder="Enter the amount " min=<%=increment + current_price%>
						required></td>
				</tr>
			</div>
			<input type="hidden" name="itemID" value=<%=itemID%> /> <input
				type="submit" class="Sell-button" value="Place Bid" />
		</form>
		<form method="post" action="autobidLogic.jsp">
			<div class="textbox">
				<tr>
					<td>Auto Bid</td>
					<td><input type="hidden" name="price"
				value=<%=current_price%> /></td>
					<td><input type="number" name="upperlimit"
						placeholder="Enter the amount " min=<%=increment + current_price%>
						required></td>
				</tr>
			</div>
			<input type="hidden" name="itemID" value=<%=itemID%> /> <input
				type="submit" class="Sell-button" value="AutoBid" />
		</form>
		<form method="post" action="historybid.jsp">
			<button class="Sell-button" type="submit" name="h" value=<%=result.getString("itemID")%>>Previous Bids</button>
		</form>
		<form method="post" action="simItems.jsp">
			<button class="Sell-button" type="submit" name="sim" value=<%=result.getString("itemID")%>>Similar Items</button>
		</form>
		<div class="controls">
			<a href="customerHomePage.jsp" class="Button-link">Home Page</a> <br>
			<a href="logout.jsp" class="Button-link">Log Out</a>
		</div>
	</div>
	<%
		}
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