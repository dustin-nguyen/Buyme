<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.text.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auto Bid Logic</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the bid.jsp
		int itemID = Integer.parseInt(request.getParameter("itemID"));
        int price = Integer.parseInt(request.getParameter("price"));
		int upperlimit = Integer.parseInt(request.getParameter("upperlimit"));
		String buyer = String.valueOf(session.getAttribute("Username"));
        String increments = "SELECT increment FROM item WHERE itemID = " + itemID;
		ResultSet result = stmt.executeQuery(increments);
		int increment=0;
		if (result.next()){
			increment = Integer.parseInt(result.getString("increment"));
		}
		// get current date
		String insert1 = "INSERT INTO automation(itemID,buyer,price,upper_limit,increment)" + "VALUES (?, ?, ?, ?,?)";
		PreparedStatement pl = con.prepareStatement(insert1);
		pl.setInt(1, itemID); 
		pl.setString(2, buyer);
		pl.setInt(3, price);
		pl.setInt(4, upperlimit);
		pl.setInt(5,increment);
		pl.executeUpdate(); 
		
        while(price < upperlimit)
        {
            price+=increment;
           	Date dNow = new Date( );
            SimpleDateFormat ft = 
            new SimpleDateFormat ("yyyy-MM-dd ");
            //String to_date = "TO_DATE(" + ft.format(dNow) + ",'YYYY-MM-DD')";
            String to_date =  ft.format(dNow) ;
            //Make an insert statement for the historyOfBid table:
            String insert = "INSERT INTO historyOfBid(itemID,buyer,price,date)"
            + "VALUES (?, ?, ?, ?)";

            //Create a Prepared SQL statement allowing you to introduce the parameters of the query
            PreparedStatement ps = con.prepareStatement(insert);

            //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
            ps.setInt(1, itemID); 
            ps.setString(2, buyer);
            ps.setInt(3, price);
            ps.setString(4, to_date);
            ps.executeUpdate();	
            String update = "UPDATE item SET current_price = " + '"' + price + '"' + " WHERE itemID =" + '"' + itemID + '"';
    		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
    		PreparedStatement up = con.prepareStatement(update);

    		up.executeUpdate();
    		out.print("insert succeeded");
        }
		
		//Make an update statement for the item table:
		response.sendRedirect("customerHomePage.jsp");
		//response.sendRedirect("homePageLogic.jsp");
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
	<a href="customerHomePage.jsp" type="submit">Back to HomePage</a>
	<%
	}
	%>

</body>
</html>