<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WishList Items</title>
</head>
<body>
	<div class="controls">
	<a href="customerHomePage.jsp" class="Button-link" type="submit">Back
				to Home Page</a>
		<a href="sell.jsp" class="Button-link" >Sell Item</a>
					<br>
					<a href="search.jsp" class="Button-link" >Search</a>
					<br>
					<a href="question.jsp" class="Button-link" >Ask question</a>
					<br>
					<a href="alert.jsp" class="Button-link" >Alert</a>
					<br>
					<a href="logout.jsp" class="Button-link">Log Out</a>
	</div>
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String username = String.valueOf(session.getAttribute("Username"));
		String t="SELECT * from wishList w where buyer="+"\""+username+"\"";
		ResultSet result = stmt.executeQuery(t);
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("Name");
		out.print("</td>");
		out.print("<td>");
		out.print("Types");
		out.print("</td>");
		out.print("<td>");
		out.print("Brand");
		out.print("</td>");
		out.print("<td>");
		out.print("Screen size");
		out.print("</td>");
		out.print("<td>");
		out.print("Memory Size");
		out.print("</td>");
		out.print("</tr>");
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("type"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("brand"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("screen_size"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("storage_size"));
			out.print("</td>");
			out.print("<td>");
			%><form action="delete.jsp" method="post">
					<input type = "hidden" name = "del" value = <%=result.getString("name")%>  />
					<input type="submit" value="Delete" />
				</form><%
			out.print("</td>");
			out.print("</tr>");
		}
		//close the connection.
		out.print("</table>");
		%>
		<form action="wishlist.jsp" method="post">
				<input type="submit" value="Add item to wishlist" />
			</form>
		<%
		db.closeConnection(con);
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
	%>
</body>
</html>