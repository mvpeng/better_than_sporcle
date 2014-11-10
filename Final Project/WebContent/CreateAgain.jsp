<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
</head>
<body>

<h1>The Name <%= request.getParameter("user") %> is Already In Use</h1>
<form action="AccountServlet" method="post">
<div>Please enter another name and password.</div>
<div>User Name:<input type="text" name="user" /></div>
<div>Password:<input type="text" name="pass" />
<input type="submit" value="Login"/></div>
</form>

</body>
</html>