package recipeMarket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RankHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcURL = "jdbc:mysql://localhost:3306/RecipeMarketDB";
			String dbUser = "root";
			String dbPass = "rootpw";
			
			
			conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
			
			
			Statement st = conn.createStatement();
			String sql = "select * from recipe ORDER BY views desc";
			
			ResultSet rs = st.executeQuery(sql);
			
			String html = "";
			
			while(rs.next()) {
				html += "<div class = \"col-md-4\">";
				html += "<img src=\"./images/" + rs.getString("image") + "\" style=\"width:100%\">";
				
				html += "<h3>" + rs.getString("name") + "</h3>";
				html += "<p>" + rs.getString("kind");
				html += "<p>" + rs.getString("views");
				html += "<p> <a href=\"./recipe.jsp?recipeId=" + rs.getString("id") + "\" class=\"btn btn-info\" role=\"button\">상세 정보 &raquo;</a>";
				html += "</div>";
			}
			
			request.setAttribute("html", html);
			request.setAttribute("kind", "랭킹");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "kindOfFood.jsp";
	}
}
