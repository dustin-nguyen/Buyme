<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet" href="css/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In Logic</title>
</head>
<body>
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from signin.jsp
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
	//	out.print(Username); //debug
		//Make an select statement for the account table:
		String select = "SELECT * FROM account WHERE username = "+'"'+Username+'"'+" AND password ="+'"'+Password+'"' ;
	//	out.print(select); //debug
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(select);
	// username is primary key=> result only has 1 tuple
			String name,type;
	// if cannot find username with the password
			if(!result.next()){
				%>
				<a href="signin.jsp"  type="submit">invaild username or password</a>
				<%
			}else{
				session.setAttribute("Username", Username);
				response.sendRedirect("homePageLogic.jsp");
				// move the pointer to the first row, before asking for data:
				//result.beforeFirst();
				//result.next();
				
				//send username to welcome.jsp
				//request.setAttribute("Username",Username);

				//RequestDispatcher rs = request.getRequestDispatcher("homepage.jsp"); //the page you want to send your value
				//rs.forward(request,response);
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