<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Buyme.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
<link rel="stylesheet" href="css/SignIn.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
</head>
<body>
	<div class="login-box">
		<h1>Sign In</h1>
		<form method="post" action="signinlogic.jsp">
			<!-- note the welcome.jsp will be invoked when the choice is made -->
			<div class="textbox">
				<tr>
					<td>Username</td>
					<td><input type="text" name="Username"
						placeholder="Enter Username" required></td>
				</tr>
			</div>
			<div class="textbox">
				<tr>
					<td>Password</td>
					<td><input type="text" name="Password"
						placeholder="Enter Password" required></td>
				</tr>
			</div>
			<input type="submit" class="Sign-in-button" value="Sign in" />
		</form>
		<div class="controls">
			<a href="signup.jsp" class="Button-link" type="submit">Sign Up</a>
		</div>
	</div>
	<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();
        //Create a SQL statement
        Statement stmt = con.createStatement();
        Date dNow = new Date( );
        SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd");
        String to_date =  ft.format(dNow) ;
        String wishlist="SELECT * from item where close_date<"+"\""+ to_date +"\""+ "AND i.itemID in (select max(h.price) from historyofbid h group by i.itemID)";
        String message="You have won";
        ResultSet result = stmt.executeQuery(wishlist);
        while (result.next()){
            if (Integer.parseInt(result.getString("checkwin"))==0 && Integer.parseInt(result.getString("current_price"))<=Integer.parseInt(result.getString("secret_price"))){
                String insertFeature2 = "INSERT INTO alert(buyer,message) VALUES (?, ?)";
                PreparedStatement pp = con.prepareStatement(insertFeature2);
                pp.setString(1, result.getString("buyer")); 
                pp.setString(2, message);
                pp.executeUpdate();
                String insertFeature3 = "UPDATE item SET checkwin=1 WHERE itemID="+"\""+ result.getString("itemID")+ "\"";
                stmt.executeUpdate(insertFeature3);
            }
        }
	//close the connection.
	con.close();
	} catch (Exception e) {
	}
	%>
</body>

</html>