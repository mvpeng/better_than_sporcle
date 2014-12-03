<%@ page import="java.sql.*" %>
<%@ page import="better_sporcle.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Results</title>
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
	.search_results {
		float: left;
		width: 300px;
		margin: 5px;
	  	padding: 5px;
	}
	.search_results h1 {
		text-decoration: underline;
		text-align: center;
		font-size: 14pt;
	}
	.search_results p {
		text-align: center;
	}
</style>
</head>
<body>
<div id="main">
<p>You are logged in as <a href="UserHomePage.jsp"><%=session.getAttribute("username")%></a>.</p>
<center><h1>Search Results</h1></center>
<center><p>Your search query is: "<%= session.getAttribute("RecentSearchTerm") %>"</p></center>
<ul class="vertical_menu">
	<li><a href="UserHomePage.jsp">Home</a></li>
	<li><a href="UserHomePage.jsp">My History</a></li>
	<li><a href="UserHomePage.jsp">My Achievements</a></li>
	<li><a href="UserHomePage.jsp">My Messages</a></li>
	<li><a href="UserHomePage.jsp">My Friends</a></li>
	<li>
		<form action="SearchServlet" method="post">
			<input type="text" name="SearchTerm" size=20px>
			<input type="submit" value="Search">
		</form>
	</li>
</ul>
<div class="search_results">
	<h1>User Matches</h1>
	<%
		Connection con = (Connection) this.getServletContext().getAttribute("Connection");
		Statement stmt = con.createStatement();
		stmt.executeQuery("USE " + MyDBInfo.MYSQL_DATABASE_NAME);
		ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE username like \"%" + request.getSession().getAttribute("RecentSearchTerm") + "%\"");
		if (!rs.isBeforeFirst()) {
			out.println("<p>No users matched your search terms :(</p>");
		} else {
			rs.beforeFirst();
			out.println("<ul>");
			while (rs.next()) {
				out.println("<li>" + rs.getString("username") + "</li>");
			}
			out.println("</ul>");
		}
	%>
</div>
<div class="search_results">
	<h1>Quiz Matches</h1>
	<p>Coming Soon!</p>
</div>
</div>
</body>
</html>