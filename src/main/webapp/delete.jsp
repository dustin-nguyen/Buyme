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
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		int flag = 0;
		String choice = request.getParameter("del");
		String username = String.valueOf(session.getAttribute("Username"));
		String word = "DELETE from wishList WHERE name="+"\""+choice+"\""+"AND buyer="+"\""+username+"\"";
		stmt.executeUpdate(word);
		response.sendRedirect("wishlistlist.jsp");
		
	} catch (Exception ex) {
	out.print(ex);
	out.print("failed");
	}
	%>
</body>
</html>