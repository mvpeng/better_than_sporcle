<%@ page import="java.sql.*" %>
<%@ page import="better_sporcle.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reading Note</title>
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
</style>
</head>
<body>
<div id="main">
<p>You are logged in as <a href="MyHomePage.jsp"><%=session.getAttribute("username")%></a>.</p>
<center><h1>Read Note</h1></center>
<center><a href="Mailbox.jsp">Return to Messages</a></center>
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
<p>Reading note from <a href=<%= "\"User.jsp?id=" + request.getParameter("from") + "\"" %>><%=request.getParameter("from") %></a>: </p>
<p></p>
<p>
<%
		Connection con = (Connection) this.getServletContext().getAttribute("Connection");
		Statement stmt = con.createStatement();
		stmt.executeQuery("USE " + MyDBInfo.MYSQL_DATABASE_NAME);
		ResultSet rs = stmt.executeQuery("SELECT * FROM messages WHERE username_to=\"" +  session.getAttribute("username") + "\" AND username_from=\"" + request.getParameter("from") + "\" AND time_sent=\"" + request.getParameter("dt") + "\"");
		rs.first();
		out.print(rs.getString("message_text"));
	%>
</p>
</div>
</body>
</html>