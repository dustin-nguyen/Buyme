<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wishlist</title>
</head>
<body>
	<div class="sell-box">
		<h1>Add to Wishlist</h1>
		<form method="post" action="addwishlist.jsp">
			<div class="textbox">
				<tr>
					<td>Name</td>
					<td><input type="text" name="name"
						placeholder="Enter Item's Name" required></td>
				</tr>
			</div>
			<div class="textbox">
				<tr>
					<td>Screen Size</td>
					<td><input type="number" name="screenSize"
						placeholder="Enter Screen Size" min="1" required></td>
				</tr>
			</div>
			<div class="textbox">
				<tr>
					<td>Storage/Memory Size</td>
					<td><input type="number" name="storageSize"
						placeholder="Enter Storage Size" min="1" required></td>
				</tr>
			</div>

			<div class="textbox">
				<tr>
					<td>Item's Type</td>
					<div class="custom-select" style="width: 200px;">
						<select name="type" size=1>
							<option value="laptop">Laptop</option>
							<option value="phone">Phone</option>
							<option value="tablet">Tablet</option>
						</select>&nbsp;
					</div>
				</tr>
			</div>
			<div class="textbox">
				<tr>
					<td>Brand Name</td>
					<div class="custom-select" style="width: 200px;">
						<select name="brand" size=1>
							<option value="Apple">Apple</option>
							<option value="Samsung">Samsung</option>
							<option value="Google">Google</option>
							<option value="Dell">Dell</option>
							<option value="Acer">Acer</option>
						</select>&nbsp;
					</div>
				</tr>
			</div>
			<input type="submit" class="Sell-button" value="Sell Item" />
		</form>


		<div class="controls">
			<a href="customerHomePage.jsp" class="Button-link" type="submit">Back
				to Home Page</a>
		</div>
	</div>

</body>

</html>