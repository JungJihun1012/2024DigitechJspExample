<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header">
		도서대여관리 ver 1.0
	</header>
	<%@include file="Nav.jsp" %>
	<section class="section">
	<div align="center" style="margin: 0 auto;">
		대여도서 등록
	</div>
	<br/> <br/>
		<form name="form" action="" method="post">
			<input name="action" type="hidden" value="register" />
				<table style="width: 400px;">
					<tr>
						<th>대여일자</th>
						<td>
							<input name="rent_ymd" type="text" value="" disabled/>
						</td>
					</tr>
					<tr>
						<th>대여번호(자동채번)</th>
						<td>
							<input name="rent_no" type="text">
						</td>
					</tr>
					<tr>
						<th>도서코드</th>
						<td>
							<input name="rent_book" type="text" >
						</td>
					</tr>
					<tr>
						<th>고객번호</th>
						<td>
							<input name="rent_rent" type="text">
						</td>
					</tr>
					<tr>
						<th>반납기한(대여일 7일후)</th>
						<td>
							<input name="close_ymd" type="text">
						</td>
					</tr>
					<tr>
						<td colsapn="2" align="center">
							<input type="submit" value="등록" >
							<input type="button" value="조회">
						</td>
					</tr>
				</table>
		</form>
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>