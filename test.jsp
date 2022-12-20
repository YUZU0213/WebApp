<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!String title="execut"; %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= title%></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		java.sql.Timestamp t_stmp = new java.sql.Timestamp(Calendar.getInstance().getTimeInMillis());
		request.setCharacterEncoding("UTF-8");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String niceArticle = request.getParameter("niceArticle");
		String siteImg = request.getParameter("siteImg");
		String name = request.getParameter("name");
		String e_mail = request.getParameter("e_mail");
		String comment = request.getParameter("comment");
		session.getAttribute("token");

		if (age.equals("1")) {
			age = "10代";
		}else if (age.equals("2")){
			age = "20代";
		} else if (age.equals("3")) {
			age = "30代";
		} else if (age.equals("4")) {
			age = "40代";
		} else if (age.equals("5")) {
			age = "50代";
		} else if (age.equals("6")) {
			age = "60代";
		} else if (age.equals("7")) {
			age = "70代";
		} else if (age.equals("8")){
			age = "80代";
		} else {
			age = "その他";
		}

		session.setAttribute("age", age);

		if (gender.equals("0")) {
			gender = "男";
		} else {
			gender = "女";
		}
		session.setAttribute("gender", gender);

		if (niceArticle.equals("1")) {
			niceArticle = "IndexArticle";
		} else if(niceArticle.equals("2")){
			niceArticle = "WAR表示されない";
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
			niceArticle = "Java PATHの設定";
		} else if (niceArticle.equals("9")){
			niceArticle = "BIOS ERROR";
		} else if (niceArticle.equals("10")) {
			niceArticle = "JavaJDK10";
		} else {
			niceArticle = "その他";
		}
		session.setAttribute("niceArticle", niceArticle);

		if (siteImg.equals("1")) {
			siteImg = "良い";
		}else  if (siteImg.equals("2")){
			siteImg = "普通";
		}else {
			siteImg = "よくない";
		}
		session.setAttribute("siteImg", siteImg);

		session.setAttribute("name", name);
		if (name.isEmpty() || name == null) {
			session.setAttribute("err_name", "★");
			RequestDispatcher rd = request.getRequestDispatcher("question.jsp");
			rd.forward(request, response);
			return;
		} else {
			session.setAttribute("err_name", "");
		}

		String regexEMail = "^[a-zA-Z0-9!#$%&'_`/=~\\*\\+\\-\\?\\^\\{\\|\\}]+(\\.[a-zA-Z0-9!#$%&'_`/=~\\*\\+\\-\\?\\^\\{\\|\\}]+)*+"
				+ "(.*)@[a-zA-Z0-9][a-zA-Z0-9\\-]*(\\.[a-zA-Z0-9\\-]+)+$";
		Pattern regex = Pattern.compile(regexEMail);
		Matcher m = regex.matcher(e_mail);
		if (m.find()) {
			session.setAttribute("e_mail", e_mail);
		} else {
			session.setAttribute("err_email", "★");
			RequestDispatcher rd = request.getRequestDispatcher("question.jsp");
			rd.forward(request, response);
			return;
		}

		session.setAttribute("comment", comment);
		if (comment.isEmpty() || comment == null) {
			session.setAttribute("err_comment", "★");
			RequestDispatcher rd = request.getRequestDispatcher("question.jsp");
			rd.forward(request, response);
			return;
		} else {
			session.setAttribute("err_comment", "");
		}

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
				System.out.println(new Date()+"："+ count+"：件登録されました。");
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
	%>
</body>
</html>