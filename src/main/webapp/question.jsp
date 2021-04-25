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
	<h1>Ask a question</h1>
	<form method="post" action="askquestion.jsp">
		<textarea name="hi" ></textarea>
		<input type="submit" value="submit" />
	</form>
	<br>
	<h1>Search all questions</h1>
	<form method="post" action="searchallq.jsp">
		<input type="submit" value="submit" />
	</form>
	<form method="post" action="searchword.jsp">
		<h1>Search by name:</h1>
		<input type="text" name="qname"> <br>
	<input type="submit" value="submit" />
	</form>
</body>
</html>