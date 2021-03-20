<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en" >
<head>
<link rel="stylesheet" href="css/SignUp.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up page</title>
</head>
<body>
	<div class="sign-up-box">
		<h1>Sign Up</h1>
		<form method="post" action="signuplogic.jsp">
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
		 <div class="textbox">
		 	<tr>    
				<td>Name</td><td><input type="text" name="Name" placeholder="Enter Fullname" required></td>
			</tr>
		 </div>
		  <div class="textbox">
		 	<tr>    
				<td>Email</td><td><input type="text" name="Email" placeholder="Enter Email" required></td>
			</tr>
		 </div>
		  <input type="submit" class ="Sign-up-button" value="Sign up" />
		</form>
		<div class="controls">
			<a href="signin.jsp" class="Button-link" type="submit">Sign In</a>
		</div>
	</div>
	
  </body>

</html>