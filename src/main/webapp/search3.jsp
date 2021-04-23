<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In Logic</title>
</head>
<body>
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

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String l=String.valueOf(session.getAttribute("select"));
		ResultSet result = stmt.executeQuery(l);
		out.print("Added to wishlist!!!!");
		if (result.next()) {
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>");
			out.print("Name");
			out.print("</td>");
			out.print("<td>");
			out.print("Price");
			out.print("</td>");
			out.print("<td>");
			out.print("Close Date");
			out.print("</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("current_price"));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getString("close_date"));
			out.print("</td>");
			out.print("<td>");
			%><form method="get" action="wishlist.jsp">
			<button type="submit" name="wl" value=<%=result.getString("itemID")%>>Add to Wishlist</button></form><%
			out.print("</td>");
			out.print("<td>");
			%><form action="bid.jsp" method="post">
    				<input type = "hidden" name = "itemID" value = <%=result.getString("itemID")%>  />
    				<input type="submit" value="Bid" />
				</form><%
			out.print("</td>");
			out.print("</tr>");
		}
		else{
			%>
			<a href="search.jsp"  type="submit">Search again!!</a>
			<%
		}
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("current_price"));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getString("close_date"));
			out.print("</td>");
			out.print("<td>");
			%><form method="get" action="wishlist.jsp">
			<button type="submit" name="wl" value=<%=result.getString("itemID")%>>Add to Wishlist</button></form><%
			out.print("</td>");
			out.print("<td>");
			%><form action="bid.jsp" method="post">
    				<input type = "hidden" name = "itemID" value = <%=result.getString("itemID")%>  />
    				<input type="submit" value="Bid" />
				</form><%
			out.print("</td>");
			out.print("</tr>");
		}
		//close the connection.
		out.print("</table>");
		db.closeConnection(con);
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
	%>
</body>
</html>