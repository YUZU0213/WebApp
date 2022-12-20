<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% session.removeAttribute("token");%>
<% session.setMaxInactiveInterval(60); %>
<% System.out.println(new Date().toString()+"：REMOTE_ADDR："+request.getRemoteAddr()+"：HTTP_HOST："+request.getHeader("Host")+"WebApp/QuestionAdd"); %>
<%!String title="WEBアンケートThanks"; %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-114106565-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-114106565-1');
</script>
<meta name="google-site-verification" content="dOdBtBJsE796vRY9M160HfwVg4X6sY4E4czCQ9t1e4k" />
<meta name="msvalidate.01" content="5D1B817F9A91BC736D39662B83A2B98A" />
<meta name="viewport" content="width-device,initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta http-equiv="cache-control" content="no-cache" >
<meta name="robots" content="noindex, nofollow" >
<meta name="keywords" content="#" >
<meta http-equiv="refresh" content="60; URL=Question">
<link rel="alternate" hreflang="ja" href="https://marbleanser.com/WebApp<%= request.getServletPath()%>">
<link rel="shortcut icon" href="images/favicon16.ico">
<link rel="stylesheet" type="text/css" href="css/commons.css">
<link rel="stylesheet" type="text/css" href="css/responsiv_320.css">
<title><%= title%></title>
</head>
<body>
	<div id="wrapper">
		<header>
			<h1>JavaWEB開発日記</h1>
			<p>JavaApplicationWeb開発レポート<br>JavaMVC設計でApplicationを開発をおこないブログ形式でレポートや軌跡を綴っていきます。</p>
		</header>
	<div id="wrap">
		<p>WEBアンケートご協力ありがとうございました。</p>
		<p>送信結果：<c:out value="${ count }"  escapeXml="true" />件登録されました。</p>
			<table>
				<tr><th>年齢</th><td><c:out value="${ age }"  escapeXml="true" /><c:remove var="age"/></td></tr>
				<tr><th>性別</th><td><c:out value="${ gender }" escapeXml="true"  /><c:remove var="gender" /></td></tr>
				<tr><th>よかった記事</th><td><c:out value="${ niceArticle }"  escapeXml="true" /><c:remove var="niceArticle" /></td></tr>
				<tr><th>サイトのイメージ</th><td><c:out value="${ siteImg }"  escapeXml="true" /><c:remove var="siteImg" /></td></tr>
				<tr><th>お名前</th><td><c:out value="${ name }" />さん<c:remove var="name" /></td></tr>
				<tr><th>E-MAIL</th><td><c:out  value="${ e_mail }"  escapeXml="true" /><c:remove var="e_mail" /></td></tr>
				<tr><th>コメント</th><td><c:out value="${ comment }" escapeXml="true"  /><c:remove var="comment" /></td></tr>
			</table>
		<p>上記内容で登録されました。</p>
		<p>こちらのページは60秒後にアンケートトップに移動します<% session.invalidate();%><br>ブラウザの戻るは使用しないでください。</p>
	</div>
	<nav id="side">
		<aside>
			<c:import url="side.jsp" />
		</aside>
		<p><%= new Date() %></p>
	</nav>
		<footer id="copyright">
			<c:import url="footer.jsp" />
		</footer>
	</div>
</body>
</html>