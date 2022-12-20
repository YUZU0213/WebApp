<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% System.out.println(new Date().toString()+"：REMOTE_ADDR："+request.getRemoteAddr()+"：HTTP_HOST："+request.getHeader("Host")+"/WebApp/Question"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!String title="WEBアンケート";%>
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
<meta name="keywords" content="MARBLEANSER.COM,WEBアンケート,フォーム" >
<meta name="description" content="MARBLEASNSER.COMアンケートフォームです。サイトの感想についてご意見がいただければありがたいです。 感想につきましては1回の送信で300文字までとなっています。" >
<link rel="alternate" hreflang="ja" href="https://marbleanser.com/WebApp<%= request.getServletPath()%>">
<link rel="shortcut icon" href="images/favicon16.ico">
<link rel="stylesheet" type="text/css" href="css/commons.css">
<link rel="stylesheet" type="text/css" href="css/question.css">
<link rel="stylesheet" type="text/css" href="css/responsiv_320.css">
<%--
<script>
	function popup() {
		window.open(
			"text.html",
			 "new",
			 "width = 300",
			 "height = 600",
			 "toolbar = 1",
			 "status = 1",
			 "statusbar =1",
			 "scrollbars = 1",
			 "menubar = 0"
            );  }
 </script>
--%>
<script>
	function reset() {
		window.form.reset;
		return;
	}
</script>
<title><%= title%></title>
</head>
<body>
	<div id="wrapper">
		<header>
			<h1>JavaWEB開発日記</h1>
			<p>JavaApplicationWeb開発レポート<br>JavaMVC設計でApplicationを開発をおこないブログ形式でレポートや軌跡を綴っていきます。</p>
		</header>
	<div id="wrap">
		<h3>アンケートフォーム</h3>
		<p>MARBLEASNSER.COMアンケートフォームです。<br>サイトの感想についてご意見がいただければありがたいです。<br>感想につきましては1回の送信で300文字までとなっています。</p>
	<form action="test.jsp" method="POST">
		<table>
			<tr><td>年齢<br>
			<select name="age">
			<option>選択してください</option>
			<option value="1">10代</option>
			<option value="2">20代</option>
			<option value="3">30代</option>
			<option value="4">40代</option>
			<option value="5">50代</option>
			<option value="6">60代</option>
			<option value="7">70代</option>
			<option value="8">その他</option>
			</select></td></tr>
			<tr><td>性別<br><label>男<input type="radio"  name="gender" value="0" checked></label>&nbsp;<label>女<input type="radio" name="gender" value="1"></label></td></tr>
			<tr><td >よかった記事<br><select name="niceArticle">
			<option selected>選択してください</option>
			<option value="1">IndexArticle</option>
			<option value="2" >WAR表示されない</option>
			<option value="3">GAE Plugin Ecripse4.5</option>
			<option value="4">JavaJDK</option>
			<option value="5">Tomcat</option>
			<option value="6">OpenSSL</option>
			<option value="7">Apache2.2</option>
			<option value="8">JavaPath</option>
			<option value="9">BIOS ERROR</option>
			<option value="10">Java JDK10</option>
			<option value="99">その他</option>
			</select></td></tr>
			<tr><td>サイトのイメージ<br><label>良い<input type="radio" name="siteImg" value="1" checked></label>&nbsp;
			<label>普通<input type="radio" name="siteImg" value="2"></label>&nbsp;
			<label>良くない<input type="radio" name="siteImg" value="3"></label></td></tr>
			<tr><td>お名前<br><input type="text" name="name" value='<c:out value="${ name }" escapeXml="true" />' size="40" maxlength="128"><c:out value="${ err_name }" /></td></tr>
			<tr><td>E-MAIL<br><input type="text" name="e_mail" value='<c:out value="${ e_mail }" escapeXml="true" />'  size="40" maxlength="128" ><c:out value="${ err_email }" /></td></tr>
			<tr><td>コメント・4000文字以内<br><textarea name="comment" cols="40" rows="4"  wrap="hard" maxlength="4096" ><c:out value="${ comment }" escapeXml="true" /><c:out value="${ err_comment }" /></textarea>
			</td></tr>
			<tr><td colspan="2"><input type="hidden" name="token" value='<c:out value="${ token }" escapeXml="true" />'></td></tr>
			<tr><td><input type="submit" value="送信" onclick="popup();" >&nbsp;<input type="button" onclick="reset();" value="リセット"></td></tr>
		</table>
	</form>
		<p>※動作に影響の出るHTMLタグ、メタタグの入力はご遠慮下さい。<br>※特殊文字、絵文字は反映されない場合があります。</p>
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