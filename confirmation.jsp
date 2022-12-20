<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!String title="confirmtaion"; %>
<!DOCTYPE html>
<html lang="ja">
<head>
<c:import url="header.jsp" />
<!-- <script>
	function popup() {
		window.open("QuestionAdd",
				"new",
				"width = 300",
				"height = 600",
				"method = post",
				"status = 200",
				"toolbar = 1",
				"statusbar =1",
				"scrollbars = 1",
				"menubar = 1"
				);
		}
</script> -->
<title><%= title%></title>
</head>
	<body>
		<div id="wrapper">
			<header>
				<h1>JavaWEB開発日記</h1>
				<p>JavaApplicationWeb開発レポート<br>JavaでApplicationを開発をおこないブログ形式でレポートや軌跡を綴っていきます。</p>
			</header>
		<div id="wrap">
			<p>確認画面</p>
			<form action="QuestionAdd" method="POST">
				<table>
					<tr><th>年齢</th><td><c:out value="${ age }"  escapeXml="true" /></td></tr>
					<tr><th>性別</th><td><c:out value="${ gender }" escapeXml="true"  /></td></tr>
					<tr><th>よかった記事</th><td><c:out value="${ niceArticle }"  escapeXml="true" /></td></tr>
					<tr><th>サイトのイメージ</th><td><c:out value="${ siteImg }"  escapeXml="true" /></td></tr>
					<tr><th>お名前</th><td><c:out value="${ name }" />さん<c:remove var="name" /></td></tr>
					<tr><th>E-MAIL</th><td><c:out  value="${ e_mail }"  escapeXml="true" /></td></tr>
					<tr><th>コメント</th><td><c:out value="${ comment }" escapeXml="true"  /></td></tr>
				</table>
				<p>
					<input type="hidden" name="age"  value="${ age }">
					<input type="hidden" name="gender"  value="${ gender }">
					<input type="hidden" name="niceArticle"  value="${ niceArticle }">
					<input type="hidden" name="siteImg"  value="${ siteImg }">
					<input type="hidden" name="name"  value="${ name }">
					<input type="hidden" name="e_mail"  value="${ e_mail }">
					<input type="hidden" name="comment"  value="${ comment }">
					<input type="hidden" name="token" value="${ token }">
				</p>
			<p><input type="submit" value="送信"></p>
			</form>
		</div>
		<nav id="side">
			<aside>
				<c:import url="side.jsp" />
			</aside>
			<p><%= new Date() %></p>
		</nav>
			<footer id="copyright">
				<p>Copyright&nbsp;&copy;&nbsp;2019&nbsp;MARBLEANSER.COM All Rights Reserved.</p>
			</footer>
		</div>
	</body>
</html>