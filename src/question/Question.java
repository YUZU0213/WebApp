package question;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Question
 */
public class Question extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean err = false;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Question() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		session.setAttribute("name", "");
		session.setAttribute("err_name", "");
		session.setAttribute("comment", "");
		session.setAttribute("err_comment", "");
		RequestDispatcher rd = request.getRequestDispatcher("question.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		response.setContentType("text/html" );
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

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
		String token = (String) session.getAttribute("token");

		System.out.println("Token???"+token);

		if (age.equals("1")) {
			age = "10???";
		}else if (age.equals("2")){
			age = "20???";
		} else if (age.equals("3")) {
			age = "30???";
		} else if (age.equals("4")) {
			age = "40???";
		} else if (age.equals("5")) {
			age = "50???";
		} else if (age.equals("6")) {
			age = "60???";
		} else if (age.equals("7")) {
			age = "70???";
		} else if (age.equals("8")) {
			age = "?????????";
		} else {
			age = "?????????";
		}
		session.setAttribute("age", age);

		if (gender.equals("0")) {
			gender="???";
		} else {
			gender="???";
		}
		session.setAttribute("gender", gender);

		if (niceArticle.equals("1")) {
			niceArticle = "IndexArticle";
		} else if(niceArticle.equals("2")){
			niceArticle = "WAR??????????????????";
		} else if(niceArticle.equals("3")){
			niceArticle = "Google Plugin for Eclipse4.5";
		}else if (niceArticle.equals("4")) {
			niceArticle = "JavaJDK";
		}else if (niceArticle.equals("5")) {
			niceArticle = "Tomcat";
		}else if (niceArticle.equals("6")) {
			niceArticle = "OpenSSL";
		} else if (niceArticle.equals("7")) {
			niceArticle = "Apache2.2";
		} else if (niceArticle.equals("8")) {
			niceArticle = "Java PATH?????????";
		} else if (niceArticle.equals("9")){
			niceArticle = "BIOS ERROR";
		} else if (niceArticle.equals("10")) {
			niceArticle = "JavaJDK10";
		} else {
			niceArticle = "?????????";
		}
		session.setAttribute("niceArticle", niceArticle);

		if (siteImg.equals("1")) {
			siteImg="??????";
		}else  if (siteImg.equals("2")){
			siteImg="??????";
		}else {
			siteImg="????????????";
		}
		session.setAttribute("siteImg", siteImg);


		if (name.length() == 0) {
			err = true;
			session.setAttribute("err_name", "???");
		} else {
			session.setAttribute("name", name);
		}

		String regex = "^[a-zA-Z0-9!#$%&'_`/=~\\*\\+\\-\\?\\^\\{\\|\\}]+(\\.[a-zA-Z0-9!#$%&'_`/=~\\*\\+\\-\\?\\^\\{\\|\\}]+)*+"
				+ "(.*)@[a-zA-Z0-9][a-zA-Z0-9\\-]*(\\.[a-zA-Z0-9\\-]+)+$";
		Pattern ptn = Pattern.compile(regex);
		Matcher m = ptn.matcher(e_mail);
		if (m.find()) {
			err = false;
			session.setAttribute("e_mail", e_mail);
		} else {
			err = true;
			session.setAttribute("err_email", "???");
		}

		if (comment.length() == 0) {
			err = true;
			session.setAttribute("err_comment", "???");
		} else {
			session.setAttribute("comment", comment);
		}

		if (!err) {
			RequestDispatcher rd = request.getRequestDispatcher("confirmation.jsp");
			rd.forward(request, response);

			/**
			 * Question ??? test.jsp
			 * Question POST ??? confirmation.jsp ??? QuestionAdd
			 *
			PrintWriter out = response.getWriter();

			out.println("<!DOCTYPE html>");
			out.println("<html lang=\"ja\">");
			out.println("<head>");
			out.println("<meta charset=\"utf-8\">");
			out.println("<!-- Global site tag (gtag.js) - Google Analytics -->"
					+ "<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-114106565-1\"></script>"
					+ "<script>  window.dataLayer = window.dataLayer || [];  function gtag(){dataLayer.push(arguments);}  gtag('js', new Date()); "
					+ "gtag('config', 'UA-114106565-1');</script>");
			out.println("<meta name=\"google-site-verification\" content=\"dOdBtBJsE796vRY9M160HfwVg4X6sY4E4czCQ9t1e4k\" />");
			out.println("<meta name=\"msvalidate.01\" content=\"5D1B817F9A91BC736D39662B83A2B98A\" />");
			out.println("<meta name=\"viewport\" content=\"width-device,initial-scale=1.0\">");
			out.println("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" >");
			out.println("<meta http-equiv=\"cache-control\" content=\"no-cache\" >");
			out.println("<meta name=\"robots\" content=\"index, follow\" >");
			out.println("<meta name=\"keywords\" content=\"#\" >");
			out.println("<link rel=\"alternate\" hreflang=\"ja\" href=\"https://marbleanser.com/WebApp/Question\">");
			out.println("<link rel=\"shortcut icon\" href=\"./images/favicon16.ico\">");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/commons.css\">");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/responsive_320.css\">");
			out.println("<title>WEB???????????????</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<div id=\"wrapper\">");
			out.println("<header>");
			out.println("<h1>JavaWEB????????????</h1>");
			out.println("<p>JavaApplicationWeb??????????????????<br>JavaMVC?????????Application??????????????????????????????????????????????????????????????????????????????????????????</p>");
			out.println("</header>");
			out.println("<div id=\"wrap\">");
			out.println("<h3>WEB???????????????????????????</h3>");
			out.println("<form action=\"QuestionAdd\" method=\"POST\">");
			out.println("<table>");
			out.println("<tr><th>??????</th><td>"+age+"</td></tr>");
			out.println("<tr><th>??????</th><td>"+gender+"</td></tr>");
			out.println("<tr><th>??????????????????</th><td>"+niceArticle+"</td></tr>");
			out.println("<tr><th>????????????????????????</th><td>"+siteImg+"</td></tr>");
			out.println("<tr><th>?????????</th><td>"+name+"??????</td></tr>");
			out.println("<tr><th>????????????</th><td>"+comment+"</td></tr>");
			out.println("<tr><th>E-MAIL</th><td>"+e_mail+"</td></tr>");
			out.println("<tr><td colspan=\"2\"><input type=\"hidden\" name=\"token\" value=\""+session.getAttribute("token")+"\"></td></tr>");
			out.println("</table>");
			out.println("<p><input type=\"submit\" value=\"??????\"></p>");
			out.println("</form>");
			out.println("<p>???????????????????????????HTML??????????????????????????????????????????????????????<br>????????????????????????????????????????????????????????????????????????</p>");
			out.println("</div>");
			out.println("<nav id=\"side\">");
			out.println("<ul>");
			out.println("<li><a href=\"RepoArticle?id=1\">IndexArticle</a></li>");
			out.println("<li><a href=\"RepoArticle?id=2\">WAR??????????????????</a></li>");
			out.println("<li><a href=\"RepoArticle?id=3\">Google Plugin for Eclipse4.5</a></li>");
			out.println("<li><a href=\"RepoArticle?id=4\">JavaJDK</a></li>");
			out.println("<li><a href=\"RepoArticle?id=5\">Tomcat</a></li>");
			out.println("<li><a href=\"RepoArticle?id=6\">OpenSSL</a></li>");
			out.println("<li><a href=\"RepoArticle?id=7\">APache2.2</a></li>");
			out.println("<li><a href=\"RepoArticle?id=8\">Java path</a></li>");
			out.println("<li><a href=\"RepoArticle?id=9\">BIOS ERROR</a></li>");
			out.println("<li><a href=\"RepoArticle?id=10\">JavaJDK10</a></li>");
			out.println("<li><a href=\"RepoArticle?id=11\">smtp4dev</a></li>");
			out.println("<li><a href=\"RepoArticle?id=12\">keytool</a></li>");
			out.println("<li><a href=\"RepoArticle?id=13\">MariaDB?????????</a></li>");
			out.println("<li><a href=\"ipcheck.jsp\">IP&nbsp;Check</a></li>");
			out.println("<li><a href=\"TextCounter\">TextCounter</a></li>");
			out.println("<li><a href=\"Profile\">??????????????????</a></li>");
			out.println("<li><a href=\"Question\">Question</a></li>");
			out.println("</ul>");
			out.println("<p>"+new Date()+"</p>");
			out.println("</nav>");
			out.println("<footer id=\"copyright\">");
			out.println("<p>Copyright&nbsp;&copy;&nbsp;2021&nbsp;MARBLEANSER.COM All Rights Reserved.</p>");
			out.println("</footer>");
			out.println("</div>");
			out.println("</body>");
			out.println("</html>");
			*/
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("question.jsp");
			rd.forward(request, response);
		}
	}

}
