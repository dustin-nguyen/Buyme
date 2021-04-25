<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="controls">
		<a
			href="sell.jsp" class="Button-link">Sell Item</a> <a
			href="alert.jsp" class="Button-link">Alert</a> <a
			href="logout.jsp" class="Button-link">Log Out</a>
	</div>
	<h1>Search all</h1>
	<form method="post" action="search2.jsp">
		<input type="submit" value="submit" />
	</form>
	<h1>Search user history(buyer/seller)</h1>
	<form method="post" action="sellersbuyerslist.jsp">
		<input type="text" name="bsell" value="hi"> <br>
		<input type="submit" value="submit" />
	</form>
	<h1>Search by attributes</h1>
	<form method="post" action="search1.jsp">
		<p>Search by model name:</p>
		<input type="text" name="namelook"> <br>
		<p>Search by current price:</p>
		<select name="price" size=1>
			<option value="0">All</option>
			<option value="10">$0-$10</option>
			<option value="100">$10-$100</option>
			<option value="1000">$100-$1000</option>
			<option value="1001">$1000+</option>
		</select>&nbsp;
		<p>Search by item type:</p>
		<input type="radio" name="command" value="all" checked />All <br>
		<input type="radio" name="command" value="laptop" />Laptops <br>
		<input type="radio" name="command" value="phone" />Phones <br> <input
			type="radio" name="command" value="tablet" />Tablets <br>
		<p>Search by brand:</p>
		<input type="radio" name="command2" value="all" checked />All <br>
		<input type="radio" name="command2" value="Apple" />Apple <br>
		<input type="radio" name="command2" value="Samsung" />Samsung <br> <input
			type="radio" name="command2" value="Google" />Google <br>
			<input type="radio" name="command2" value="Dell" />Dell <br>
			<input type="radio" name="command2" value="Acer" />Acer <br><input
			type="submit" value="submit" />
	</form>
	<br>
</body>
</html>