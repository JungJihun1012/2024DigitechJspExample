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
<form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
    <input name="action" type="hidden" value="register" />
    <table style="width: 400px;">
        <tr>
            <th>회원번호</th>
            <td>
                <input name="cust_no" type="text"/>
            </td>
        </tr>
        <tr>
            <th>회원성명</th>
            <td>
                <input name="cust_name" type="text" >
            </td>
        </tr>
        <tr>
            <th>핸드폰번호</th>
            <td>
                <input name="phone" type="text">
            </td>
        </tr>
        <tr>
            <th>주소</th>
            <td>
                <input name="address" type="text">
            </td>
        </tr>
        <tr>
            <th>가입일자</th>
            <td>
                <input name="join_date" type="text" >
            </td>
        </tr>
        <tr>
        	<th>상태구분</th>
        	<td>
        		<input name="stat_fg" type="submit"/>
        	</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="수정">
                <input type="button" value="조회" onclick="location.href='SearchServlet'">
            </td>
        </tr>
    </table>
</form>
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>