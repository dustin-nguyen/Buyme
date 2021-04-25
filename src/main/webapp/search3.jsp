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
		<a
			href="sell.jsp" class="Button-link">Sell Item</a> <a
			href="search.jsp" class="Button-link">Search Again</a> <a
			href="alert.jsp" class="Button-link">Alert</a> <a
			href="logout.jsp" class="Button-link">Log Out</a>
	</div>
	<form action="search3.jsp" method="post">
	<select name="sort">
		<option value="0">Price Lowest to Highest</option>
		<option value="1">Price Highest to Lowest</option>
		<option value="2">Name A-Z</option>
		<option value="3">Name Z-A</option>
		<option value="4">Type</option>
	</select>&nbsp;
	<input type="submit" value="submit"/>
	</form>
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String l=String.valueOf(session.getAttribute("select"));
		int h = Integer.parseInt(request.getParameter("sort"));
		if (h==4){
			l+=" ORDER BY TYPE";
		}
		else if(h==0){
			l+=" ORDER BY current_price";
		}
		else if(h==1){
			l+=" ORDER BY current_price desc";
		}
		else if(h==3){
			l+=" ORDER BY NAME desc";
		}
		else if(h==2){
			l+=" ORDER BY NAME";
		}
		ResultSet result = stmt.executeQuery(l);
		if (result.next()) {
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>");
			out.print("Name");
			out.print("</td>");
			out.print("<td>");
			out.print("Type");
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
			out.print(result.getString("type"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("current_price"));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getString("close_date"));
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
			out.print(result.getString("type"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("current_price"));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getString("close_date"));
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