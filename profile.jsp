<%@page import="beans.*"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="profileObj" class="beans.ProfileBean" scope="session" />
<% System.out.println(new Date().toString()+"：REMOTE_ADDR："+request.getRemoteAddr()+"：HTTP_HOST："+request.getHeader("Host")+"/WebApp/Profile"); %>
<%!String title="管理者のページ"; %>
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
<meta name="robots" content="index,follow" >
<meta name="keywords" content="MARBLEANSER.COM">
<meta name="description" content="サイト管理人のM.YAMAMOTOです、よろしくお願いします。ブログ歴は浅いので記事は多くないですが、メモとして記録しているのでお立ち寄りしみて下さい。サイト運営・情報・技術者 SSLサーバ証明書作成 Javaアプリ開発などやってみたことをレポートしています。">
<link rel="alternate" hreflang="ja" href="https://marbleanser.com/WebApp<%= request.getServletPath()%>">
<link rel="alternate" hreflang="ja" href="http://marbleanser.com/WebApp<%= request.getServletPath()%>">
<link rel="shortcut icon" href="images/favicon16.ico">
<link rel="stylesheet" type="text/css" href="css/commons.css">
<link rel="stylesheet" type="text/css" href="css/responsiv_320.css">
<title><%= title%></title>
</head>
<body>
	<div id="wrapper">
		<header>
			<h1>JavaWEB開発日記</h1>
			<p>JavaApplicationWeb開発レポート<br>サーバサイドアプリケーションやクラウドアプリケーション開発をおこない<br>レポートや軌跡を綴っていきます。</p>
		</header>
		<div id="wrap">
		<h3>プロフィール</h3>
			<div class="none">
				<%-- <script type="text/javascript" src="https://seal.fujissl.jp/getSeal.do?cn=marbleanser.com"></script> --%>
			</div>
				<p><jsp:getProperty property="comment" name="profileObj"/></p>
				<p><jsp:getProperty property="profileImg" name="profileObj"/></p>
			<table>
				<tr><th>Common<br></th><td><jsp:getProperty property="common" name="profileObj"/></td></tr>
				<tr><th>技術<br></th><td><jsp:getProperty property="tec" name="profileObj"/></td></tr>
				<tr><th>E-MAIL</th><td><jsp:getProperty property="e_mail" name="profileObj"/></td></tr>
			</table>
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