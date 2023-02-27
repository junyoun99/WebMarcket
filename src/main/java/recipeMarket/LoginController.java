package recipeMarket;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			process(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	private void process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String loginId = request.getParameter("userId");
		String loginPassword = request.getParameter("password");
		String id = null;
		String name = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcURL = "jdbc:mysql://localhost:3306/RecipeMarketDB";
			String dbUser = "root";
			String dbPass = "rootpw";
			
			
			conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
			
			
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from users where id = '" + loginId + "' AND password ='" + loginPassword + "'");
			Boolean check = false;
			while(rs.next()) {
				check = true;
				id = rs.getString("id");
				name = rs.getString("name");
				
			}
			if(check) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect("login.jsp");
			}
			
			rs.close();
			st.close();
			conn.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
