<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Questions</title>
</head>
<body>
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
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String l="SELECT * from question q left join answer a ON q.questID=a.questID";
		ResultSet result = stmt.executeQuery(l);
		while (result.next()) {
			out.print("<h1>");
			out.print(result.getString("q.question"));
			out.print("</h1>");
			out.print("<p>");
			if (result.getString("a.answer")==null){
				out.print("Not answered");
			}
			else{
				out.print(result.getString("a.answer"));
				out.print("</p>");
			}
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