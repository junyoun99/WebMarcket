package recipeMarket;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SignUpControllerServlet
 */
@WebServlet("/SignUpControllerServlet")
public class SignUpControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpControllerServlet() {
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
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcURL = "jdbc:mysql://localhost:3306/RecipeMarketDB";
			String dbUser = "root";
			String dbPass = "rootpw";
			
			
			conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
			request.setCharacterEncoding("utf-8");
			
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String userName = request.getParameter("userName");
			String phoneNumber = request.getParameter("phoneNumber");
			int userAge = Integer.parseInt(request.getParameter("userAge"));
			String userEmail = request.getParameter("userEmail");
			String address = request.getParameter("address");
			
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			Date time = new Date();
			
			String time1 = format1.format(time);
			
			PreparedStatement pstmt = null;
			
			String sql = "insert into users values(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  userId);
			pstmt.setString(2,  password);
			pstmt.setString(3,  userName);
			pstmt.setString(4,  phoneNumber);
			pstmt.setInt(5,  userAge);
			pstmt.setString(6,  userEmail);
			pstmt.setString(7,  address);
			pstmt.setString(8, time1);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			response.sendRedirect("login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
	}

}
