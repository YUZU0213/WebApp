<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% System.out.println(new Date().toString()
		+"：REMOTE_ADDR："+request.getRemoteAddr()
		+"：HTTP_HOST："+request.getHeader("Host")+"/WebApp/ipcheck.jsp"); %>
<%!String title="Java開発日記"; %>
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
<meta name="google-site-verification" content="dOdBtBJsE796vRY9M160HfwVg4X6sY4E4czCQ9t1e4k"/>
<meta name="msvalidate.01" content="5D1B817F9A91BC736D39662B83A2B98A"/>
<meta name="viewport" content="width-device,initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="cache-control" content="no-cache" >
<meta name="robots" content="index, follow">
<meta name="keywords" content="ipチェック, ipaddress,check, ipアドレスチェック" >
<meta name="description" content="こちらのページではREMOTE_HOST REMOTE_PORT REMOTE_ADDR HTTP_REFERE HTTP_HOSTを参照できます。現在のサイトの接続状況を確認することができます。
HTTP_REFEREはサイトページ内のどこのページから来たのか参照できます。">
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
			<p>JavaApplicationWeb開発レポート<br>サーバサイドアプリケーション、クラウドアプリケーション開発をおこない、レポートや軌跡を綴っていきます。</p>
		</header>
			<div id="wrap">
				<h3>IPAddressCheck</h3>
				<P>接続先デバイス</p>
				<p>
					REMOTE_HOST: <%= request.getRemoteHost()%><br>
					REMOTE_PORT: <%= request.getRemotePort()%><br>
					REMOTE_ADDR: <%= request.getRemoteAddr()%><br>
					HTTP_REFERER: <%= request.getHeader("Referer")%><br>
					HTTP_HOST: <%= request.getHeader("Host")%>
				</p>
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
</html>