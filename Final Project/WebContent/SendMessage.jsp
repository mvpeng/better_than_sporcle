<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Send A Message</title>
<style type="text/css">
	#main {
		width: 900px;
		margin: auto;
	}
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
	.message_choices li {
		list-style: none;
		margin:5px;
	}
	.message_choices li a {
		text-decoration: none;
		color: #9932CC;
	}
	.message_choices li a:hover {
		color: #9999FF;
	}
</style>
</head>
<body>
<div id="main">
<p>You are logged in as <a href="MyHomePage.jsp"><%=session.getAttribute("username")%></a>.</p>
<center><h1>Send A Message</h1></center>
<ul class="vertical_menu">
	<li><a href="MyHomePage.jsp">Home</a></li>
	<li><a href="MyHomePage.jsp">My History</a></li>
	<li><a href="MyHomePage.jsp">My Achievements</a></li>
	<li><a href="Mailbox.jsp">My Messages</a></li>
	<li><a href="MyHomePage.jsp">My Friends</a></li>
	<li>
		<form action="SearchServlet" method="post">
			<input type="text" name="SearchTerm" size=20px>
			<input type="submit" value="Search">
		</form>
	</li>
</ul>
<p>You are sending a message to <a href=<%= "\"User.jsp?id=" + request.getParameter("id") + "\"" %>><%=request.getParameter("id") %></a>!</p>
<ul class="message_choices">
	<li><a href=<%= "\"HowToSendFriendRequest.jsp?id=" + request.getParameter("id") + "\"" %>>Send a Friend Request</a></li>
	<li><a href="MyHomePage.jsp">Send a Challenge</a></li>
	<li><a href=<%= "\"SendNote.jsp?id=" + request.getParameter("id") + "\"" %>>Send a Note</a></li>
</ul>
</div>
</body>
</html>