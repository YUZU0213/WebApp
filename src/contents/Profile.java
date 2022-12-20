package contents;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ProfileBean;

/**
 * Servlet implementation class Profile
 */
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection  conn = null;
			try {
				final String url = "jdbc:mysql://localhost/webapp?Reconnect=true&useSSL=true";
				final String user = "root";
				final String password = "1500";
				conn = DriverManager.getConnection(url, user, password);
				final String sql = "select comment, profileImg, tec, common, e_mail from webapp.profile";
				Statement stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery(sql);
				ProfileBean profileObj = null;
				while(rs.next()){
					if (profileObj==null) {
						profileObj = new ProfileBean();
						session.setAttribute("profileObj", profileObj);
					}
					profileObj.setComment(rs.getString("comment"));
					profileObj.setProfileImg(rs.getString("profileImg"));
					profileObj.setTec(rs.getString("tec"));
					profileObj.setCommon(rs.getString("common"));
					profileObj.setE_mail(rs.getString("e_mail"));
				}
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			} finally {
				try {
					if (conn!=null) {
						conn.close();
					}
				} catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
			}
		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!"POST".equals(request.getMethod())) {
			response.sendRedirect("Profile");
		}
	}

}

