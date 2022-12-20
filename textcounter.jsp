<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% System.out.println(new Date().toString()+"：REMOTE_ADDR："+request.getRemoteAddr()+"：HTTP_HOST："+request.getHeader("Host")+"/WebApp/TextCounter"); %>
<%!String title="文字カウンター"; %>
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
<meta name='robots' content='index,follow' >
<meta name="keywords" content="java文字カウンター, 文字カウンター, TextCounter, もじカウンター, 記録なし, ログ保存なし, sql文字カウント, 改行そのまま" >
<meta name="description" content="Javaアプリ開発など日々の研究成果ややってみたことをレポートしています。今回はBlogやサイト記事を作成するとき文字列の長さ、データーベースのカラムのサイズを調べるのが便利なテキストカウンターを作成しました。" >
<link rel="alternate" hreflang="ja" href="https://marbleanser.com/WebApp/TextCounter">
<link rel="alternate" hreflang="ja" href="http://marbleanser.com/WebApp/TextCounter">
<link rel="shortcut icon" href="images/favicon16.ico">
<link rel="stylesheet" type="text/css" href="css/commons.css">
<link rel="stylesheet" type="text/css" href="css/responsiv_320.css">
<title><%= title%></title>
</head>
<body>
	<div id="wrapper">
	<header>
		<h1>JavaWEB開発日記</h1>
			<p>JavaApplicationWeb開発レポート<br>サーバサイドアプリケーション開発をおこない、レポートや軌跡を綴っていきます。</p>
		</header>
			<div id="wrap">
			<h3>文字カウンター</h3>
				<form action="TextCounter" method="POST">
					<p><textarea name="str"  cols="180" rows="20"  wrap="hard" maxlength="5000"><%= request.getAttribute("str")%></textarea></p>
					<p><%= request.getAttribute("length")%>文字です。</p>
					<p><input type="submit" value="カウント"></p>
					<p><small>※5000文字までカウントできます。<br>※大文字・小文字・HTMLタグ・空白もカウントされます。
					<br>※入力された文字の記録・保存は行っていないのでご了承お願いします。</small></p>
				</form>
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
