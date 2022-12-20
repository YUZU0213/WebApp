package question;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QuestionAdd
 */
public class QuestionAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionAdd() {
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
		if (!"GET".equals(request.getMethod())) {
			response.sendRedirect("Question");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		java.sql.Timestamp t_stmp = new java.sql.Timestamp(Calendar.getInstance().getTimeInMillis());

		if (!"POST".equals(request.getMethod())) {
			response.sendRedirect("Question");
		}

		if (session.isNew()) {
			session.invalidate();
			response.sendRedirect("Question");
		}

		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String niceArticle = request.getParameter("niceArticle");
		String siteImg = request.getParameter("siteImg");
		String name = request.getParameter("name");
		String e_mail = request.getParameter("e_mail");
		String comment = request.getParameter("comment");

		System.out.println("Token："+session.getAttribute("token"));

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = null;
			final String url = "jdbc:mysql://localhost/webapp?Reconnect=true&useSSL=true";
			final String user = "root";
			final String password = "1500";
			try {
				conn = DriverManager.getConnection(url, user, password);
				final String sql = "insert into webapp.question (t_stmp, age, gender, niceArticle, siteImg, name, e_mail, comment) values (?,?,?,?,?,?,?,?)";
				PreparedStatement psmt = conn.prepareStatement(sql);
				psmt.setTimestamp(1, t_stmp);
				psmt.setString(2, age);
				psmt.setString(3, gender);
				psmt.setString(4, niceArticle);
				psmt.setString(5, siteImg);
				psmt.setString(6, name);
				psmt.setString(7, e_mail);
				psmt.setString(8, comment);
				Integer count = psmt.executeUpdate();

				session.setAttribute("count", count);
				System.out.println(new Date()+"："+count+"：件登録されました。");
				psmt.close();
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
		RequestDispatcher rd = request.getRequestDispatcher("questionExit.jsp");
		rd.forward(request, response);
	}

}
