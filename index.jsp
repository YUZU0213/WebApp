<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!String title="Java開発日記";%>
<!DOCTYPE html>
<html lang="ja">
<head>
<c:import url="header.jsp" />
<title><%= title%></title>
</head>
<body>
	<div id="wrapper">
		<header>
			<h1>${ articleObj.headerTitle }</h1>
			<article>${ articleObj.headerArticle }</article>
		</header>
	<div id="wrap">
		<h2>${ articleObj.contentsTitle }</h2>
		<article>${ articleObj.contentsArticle }</article>
	</div>
	<nav id="side">
		<aside>
			<c:import url="side.jsp" />
		</aside>
		<p><%= new Date()%></p>
	</nav>
		<footer id="copyright">
			<c:import url="footer.jsp" />
		</footer>
	</div>
</body>
</html>