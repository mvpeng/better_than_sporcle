<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quizzes Home Page</title>
<style type="text/css">
	.vertical_menu {
		float: left;
		width: 200px;
	  	border: 1px dotted #4F2F4F;
	  	background-color: #EED2EE;
	  	margin: 5px;
	  	padding: 5px;
	}
	.vertical_menu li {
		list-style: none;
		margin: 5px;
	}
	.vertical_menu li a {
	  	text-decoration: none;
	  	color: black;
	}
	.vertical_menu li a:hover {
	  	text-decoration: underline;
	}
</style>
</head>
<body>
<p>You are logged in as <a href="UserHomePage.jsp"><%=session.getAttribute("username")%></a>.</p>
<center><h1>Quizzes Home</h1></center>
<ul class="vertical_menu">
	<li><a href="UserHomePage.jsp">Home</a></li>
	<li><a href="UserHomePage.jsp">My History</a></li>
	<li><a href="UserHomePage.jsp">My Achievements</a></li>
	<li><a href="UserHomePage.jsp">My Messages</a></li>
	<li><a href="UserHomePage.jsp">My Friends</a></li>
	<li>
		<form action="SearchServlet" method="post">
			<input type="text" name="username" size=20px>
			<input type="submit" value="Search">
		</form>
	</li>
</ul>
</body>
</html>