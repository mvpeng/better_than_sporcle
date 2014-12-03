package better_sporcle;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = (Connection) getServletContext().getAttribute("Connection");
		try {
			Statement stmt = con.createStatement();
			stmt.executeQuery("USE " + MyDBInfo.MYSQL_DATABASE_NAME);
			String user = request.getParameter("username");
			String pw = Cracker.generateHash(request.getParameter("pwd"));
			ResultSet rs = stmt.executeQuery("SELECT password FROM users WHERE username = \"" + user + "\"");
			if (!rs.first()) {
				RequestDispatcher rd = request.getRequestDispatcher("Retry.html");
				rd.forward(request, response);
			} else {
				rs.first();
				if (pw.equals(rs.getString("password"))) {
					request.getSession().setAttribute("username", user);
					RequestDispatcher rd = request.getRequestDispatcher("UserHomePage.jsp");
					rd.forward(request,response);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("RetryLogin.html");
					rd.forward(request, response);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
