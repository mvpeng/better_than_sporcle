package better_sporcle;

import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class LoginListener
 *
 */
@WebListener
public class LoginListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public LoginListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
    	String server = MyDBInfo.MYSQL_DATABASE_SERVER;
    	String account = MyDBInfo.MYSQL_USERNAME;
    	String password = MyDBInfo.MYSQL_PASSWORD;
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + server, account ,password);
			ServletContext sc = arg0.getServletContext();
	        sc.setAttribute("Connection", con);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         ServletContext sc = arg0.getServletContext();
         Connection con = (Connection) sc.getAttribute("Connection");
         try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
	
}
