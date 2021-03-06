<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auctions Participated In</title>
</head>
<body>
	<%
	try {
		Date dNow = new Date( );
        SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd");
		String to_date =  ft.format(dNow) ;
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String choice = request.getParameter("bsell");
		String selectm = "SELECT i.itemID, i.current_price, i.type, i.close_date from historyofbid h, item i where i.itemID=h.itemID AND h.buyer="+'"' + choice + '"'+" UNION select itemID, current_price, type,close_date from item where seller="+'"' + choice + '"';
		ResultSet result = stmt.executeQuery(selectm);
	%>
	<div class="controls">
		 
				<a href="customerHomePage.jsp" class="Button-link" type="submit">Back
				to Home Page</a>
		<a href="sell.jsp" class="Button-link" >Sell Item</a>
					<br>
					<a href="search.jsp" class="Button-link" >Search Again</a>
					<br>
					<a href="wishlistlist.jsp" class="Button-link" >Wishlist</a>
					<br>
					<a href="question.jsp" class="Button-link" >Ask question</a>
					<br>
					<a href="alert.jsp" class="Button-link" >Alert</a>
					<br>
					<a href="logout.jsp" class="Button-link">Log Out</a>
	</div>
	<%
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>");
	out.print("ID");
	out.print("</td>");
	out.print("<td>");
	out.print("Price");
	out.print("</td>");
	out.print("<td>");
	out.print("Type");
	out.print("</td>");
	out.print("</tr>");
	out.print(choice);
	while (result.next()){
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getString("itemID"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("current_price"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		//Print out option
		Date a=ft.parse(result.getString("close_date"));
		if (ft.format(a).compareTo(to_date)<0){
			out.print("Expired");
		}
		else{
		%><form action="bid.jsp" method="post">
			<input type="hidden" name="itemID"
				value=<%=result.getString("itemID")%> /> <input type="submit"
				value="Bid" />
		</form>
		<%
		}
		out.print("</td>");
		out.print("</tr>");
	}
	out.print("</table>");
	db.closeConnection(con);
	} catch (Exception ex) {
	out.print(ex);
	out.print("failed");
	}
	%>
</body>
</html>