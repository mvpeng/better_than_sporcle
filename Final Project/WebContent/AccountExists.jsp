<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Quizzes Account</title>
</head>
<body>
	<h1><%="The username \"" + request.getParameter("username") + "\" is already in use!" %></h1>
	<p>Please enter a different username and password.</p>
	<form action="CreateServlet" method="post">
		User Name: <input type="text" name="username"><br>
		Password: <input type="password" name="pwd">
		<input type="submit" value="Submit">
	</form>
	<a href="LoginHomePage.html">Return to Login</a>
</body>
</html>