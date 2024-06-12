<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	*{margin: 0; padding: 0; list-style:none; box-sizing: border-box; text-decoration: none; color: inherit;}
	.header{background-color: blue; display: flex; justify-content: center; align-items: center; width: 100%; height: 70px; color: white ;}
	.nav{width: 100%; height: 50px; position: relative; background-color: lightgray; color: black; line-height: 50px;}
	.nav ul {display: flex;}
	.nav li {margin: 0 3.5%; line-height: 50px;}
	section { width: 100%; height: calc(100vh - 200px); }
	.footer {width: 100%; height: 50px; background-color: #0000ff; color: #ffffff; text-align: center; line-height: 50px;}
</style>
</head>
<body>
	<header class="header">
		쇼핑몰 회원관리 ver1.0
	</header>
	<nav class="nav">
		<ul>
			<li><a href="join.jsp">회원등록</a></li>
			<li><a href="getMember.jsp">회원목록 조회/수정</a></li>
			<li><a href="">회원매출 조회</a></li>
			<li><a href="">홈쇼핑 회원 정보 수정</a></li>
		</ul>
	</nav>
	<section class="section">
	</section>
	<footer class="footer">
		<ul>
			<li>HRDKorea copyright &copy; 2016 All right reserved. Human Resouces Development Serivce of Korea.</li>
		</ul>
	</footer>
</body>
</html>