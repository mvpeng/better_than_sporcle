package better_sporcle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteFriendRequestServlet
 */
@WebServlet("/DeleteFriendRequestServlet")
public class DeleteFriendRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFriendRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = (Connection) getServletContext().getAttribute("Connection");
		try {
			Statement stmt = con.createStatement();
			stmt.executeQuery("USE " + MyDBInfo.MYSQL_DATABASE_NAME);
			String me = "\"" + (String) request.getSession().getAttribute("username") + "\"";
			String them = "\"" + request.getParameter("them") + "\"";
			String cond1 = "(username_from=" + me +" OR username_to=" + me + ")";
			String cond2 = "(username_from=" + them +" OR username_to=" + them + ")";
			stmt.executeUpdate("DELETE FROM friends WHERE " + cond1 + " AND " + cond2);
			RequestDispatcher rd = request.getRequestDispatcher("User.jsp?id="+request.getParameter("them"));
			rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = (Connection) getServletContext().getAttribute("Connection");
		try {
			Statement stmt = con.createStatement();
			stmt.executeQuery("USE " + MyDBInfo.MYSQL_DATABASE_NAME);
			String me = "\"" + (String) request.getSession().getAttribute("username") + "\"";
			String them = "\"" + request.getParameter("them") + "\"";
			stmt.executeUpdate("DELETE FROM friends WHERE username_from=" + them + " AND username_to=" + me);
			RequestDispatcher rd = request.getRequestDispatcher("User.jsp?id="+request.getParameter("them"));
			rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
