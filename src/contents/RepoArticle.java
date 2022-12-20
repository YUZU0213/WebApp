package contents;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ArticleBean;

/**
 * Servlet implementation class RepoArticle
 */
public class RepoArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RepoArticle() {
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
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/ah:mm");
		java.sql.Timestamp createdate = new java.sql.Timestamp(Calendar.getInstance().getTimeInMillis());


		if (request.getParameter("id")==null) {
			response.sendRedirect("RepoArticle?id=1");
		} else {
			String Id = request.getParameter("id");
			Cookie cookie = new Cookie("WebApp", Id.toString());
			cookie.setSecure(true);
			cookie.setDomain("marbleanser.com");
			cookie.setMaxAge(24*60*60*1000);
			cookie.setPath("/ReportArticle?id="+Id);
			response.addCookie(cookie);
			String HTTP_HOST = request.getHeader("Host");
			String ip_addr = request.getRemoteAddr();
			System.out.println(sdf.format(date)+"：REMOTE_ADDR："+ip_addr+"：HTTP_HOST："+HTTP_HOST+"/WebApp/RepoArticle?id="+Id+"");

			ArticleBean articleObj = null;
			if (articleObj==null) {
				articleObj = new ArticleBean();
				session.setAttribute("articleObj", articleObj);
			}

			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn = null;
				try {
					final String url = "jdbc:mysql://localhost/webapp?Reconnect=true&useSSL=true";
					final String user = "root";
					final String password = "1500";
					conn = DriverManager.getConnection(url, user, password);
					String sql = "select id, keywords, description, headerTitle, headerArticle, contentsTitle, contentsArticle";
					sql = sql + " from webapp.blogindex where id="+Id+"";
					Statement stmt = conn.createStatement();

					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) {
						articleObj.setId(rs.getString("id"));
						articleObj.setKeywords(rs.getString("keywords"));
						articleObj.setDescription(rs.getString("description"));
						articleObj.setHeaderTitle(rs.getString("headerTitle"));
						articleObj.setHeaderArticle(rs.getString("headerArticle"));
						articleObj.setContentsTitle(rs.getString("contentsTitle"));
						articleObj.setContentsArticle(rs.getString("contentsArticle"));
					}
					rs.close();
					stmt.close();

					String http_url = "https://"+HTTP_HOST+"/WebApp/RepoArticle?id="+Id;
					String sql1 = "insert into webapp.log (createdate, ip_addr, http_url, session, referer) values (?,?,?,?,?)";
					PreparedStatement pstmt = conn.prepareStatement(sql1);
					pstmt.setTimestamp(1, createdate);
					pstmt.setString(2, ip_addr);
					pstmt.setString(3, http_url);
					pstmt.setString(4, session.getId());
					pstmt.setString(5, request.getHeader("Referer"));

					pstmt.executeUpdate();
					pstmt.close();
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					try {
						if (conn!=null) {
							conn.close();
						}
					} catch (SQLException e) {
						// TODO: handle exception
						e.printStackTrace();
					}
				}
			} catch (ClassNotFoundException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!"POST".equals(request.getMethod())) {
			doGet(request, response);
		}
	}

}
