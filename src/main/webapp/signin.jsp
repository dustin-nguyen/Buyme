<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en" >
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
				<td>Username</td><td><input type="text" name="Username" placeholder="Enter Username" required></td>
			</tr>
		 </div>
		  <div class="textbox">
		 	<tr>    
				<td>Password</td><td><input type="text" name="Password" placeholder="Enter Password" required></td>
			</tr>
		 </div>
		  <input type="submit" class ="Sign-in-button" value="Sign in" />
		</form>
		<div class="controls">
			<a href="signup.jsp" class="Button-link" type="submit">Sign Up</a>
		</div>
	</div>
	
  </body>

</html>