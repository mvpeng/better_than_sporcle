package login2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountServlet() {
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
		AccountManager am = (AccountManager) request.getServletContext().getAttribute("accountManager");
		
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		if (!am.accountExists(user)) {
			am.createAccount(user, pass);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<head>");
			out.println("<meta charset=\"UTF-8\" />");
			out.println("<title>Welcome "+user+"</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Welcome "+user+"</h1>");
			out.println("</body>");
			out.println("</html>");
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("CreateAgain.jsp");
			dispatch.forward(request, response);
		}
	}

}
