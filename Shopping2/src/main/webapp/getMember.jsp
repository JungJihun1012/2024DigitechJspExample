<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnection.jsp"%>
<%
//db가져오기
String sql = "select * from member_tbl_02 order by custno";
stmt = conn.prepareStatement(sql);

rs = stmt.executeQuery();
%>
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
	section { width: 100%; height: calc(100vh - 200px);}
	.footer {width: 100%; height: 50px; background-color: #0000ff; color: #ffffff; text-align: center; line-height: 50px;}
	th {padding: 0 20px;}
</style>
</head>
<body>
	<header class="header">
		쇼핑몰 회원관리 ver1.0
	</header>
	<nav class="nav">
		<ul>
			<li><a href="">회원등록</a></li>
			<li><a href="">회원목록 조회/수정</a></li>
			<li><a href="">회원매출 조회</a></li>
			<li><a href="">홈쇼핑 회원 정보 수정</a></li>
		</ul>
	</nav>
	<br />
	<br />
	<br />
	<section class="section">
	<div align="center">
		<h3>회원목록 조회/수정</h3>
		<table border="black">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<th><a href="member.jsp?custno=<%=rs.getString("custno")%>"><%=rs.getString("custno")%></a></th>
				<th><%=rs.getString("custname")%></th>
				<th><%=rs.getString("phone")%></th>
				<th><%=rs.getString("address")%></th>
				<th><%=rs.getString("joindate").substring(0, 10)%></th>
				<% 
					String grade = rs.getString("grade");
					
					String sGrade = "";
					switch(grade) {
						case "A":
							sGrade = "VIP";
							break;
						case "B":
							sGrade = "일반";
							break;
						case "C":
							sGrade = "직원";
							break;
						default:
							sGrade = "오류";
					}
				%>
				<th><%=sGrade %></th>
				<th><%=rs.getString("city")%></th>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	</section>
	<footer class="footer">
		<ul>
			<li>HRDKorea copyright &copy; 2016 All right reserved. Human Resouces Development Serivce of Korea.</li>
		</ul>
	</footer>
</body>
</html>