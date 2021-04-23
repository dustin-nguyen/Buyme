<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="search1.jsp">
	<p>Search by name:</p>
	<input  type="text" name="namelook">
	<br>
	<p>Filters:</p>
	<p>Sort by initial price:</p>
			<select name="price" size=1>
				<option value="0">All</option>
				<option value="10">$0-$10</option>
				<option value="100">$10-$100</option>
				<option value="1000">$100-$1000</option>
				<option value="1001">$1000+</option>
			</select>&nbsp;
	<p>Sort by item type:</p>
		  <input type="radio" name="command" value="laptop"/>Laptops
		  <br>
		  <input type="radio" name="command" value="phone"/>Phone
		  <br>
		   <input type="radio" name="command" value="tablet"/>Tablets
		   <br>
		   <input type="radio" name="command" value="all" checked/>All
		   <br>
		  <input type="submit" value="submit" />
		</form>
	<br>
</body>
</html>