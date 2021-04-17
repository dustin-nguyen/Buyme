<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en" >
<head>
<link rel="stylesheet" href="css/Sell.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell Page</title>
</head>
<body>
	<div class="sell-box">
		<h1>Sell Item</h1>
		<form method="post" action="selllogic.jsp">
		 <div class="textbox">
		 	<tr>    
				<td>Name</td>
				<td><input type="text" name="name" placeholder="Enter Item's Name" required></td>
			</tr>
		 </div>
		  <div class="textbox">
		 	<tr>    
				<td>Initial Price</td>
				<td><input type="number" name="initalPrice" placeholder="Enter Initial Price" min ="1" required></td>
			</tr>
		 </div>
		 <div class="textbox">
		 	<tr>    
				<td>Secret Price</td>
				<td><input type="number" name="secretPrice" placeholder="Enter Secret Price" min ="1" required></td>
			</tr>
		 </div>
		 <div class="textbox">
		 	<tr>    
				<td>Increment</td>
				<td><input type="number" name="increment" placeholder="Enter Increment" min ="1" required></td>
			</tr>
		 </div>
		 <div class="textbox">
		 	<tr>    
				<td>Close Date</td>
				<td><input type="date" name="closeDate" min="2021-01-01" max="2022-12-31"required></td>
			</tr>
		 </div>
		 <div class="custom-select" style="width:200px;">
		 	<select name="type" size=1>
				<option value="laptop">Laptop</option>
				<option value="phone">Phone</option>
				<option value="tablet">Tablet</option>
			</select>&nbsp;
		 </div>
		  <input type="submit" class ="Sell-button" value="Sell Item" />
		</form>
		
			
		<div class="controls">
			<a href="customerHomePage.jsp" class="Button-link" type="submit">Back to Home Page</a>
		</div>
	</div>
	
  </body>

</html>