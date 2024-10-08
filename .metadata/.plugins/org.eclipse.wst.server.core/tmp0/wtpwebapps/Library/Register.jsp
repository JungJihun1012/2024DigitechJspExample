<%@ page import="VO.RentalVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    RentalVO rent = (RentalVO) request.getAttribute("rental");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rental Registration</title>
</head>
<body>
<script type="text/javascript">
    function validate() {

        if (form.rent_book.value === "") {
            alert("도시코드를 입력하지 않았습니다.");
            form.rent_book.focus();
            return false;
        }
        
        if(form.rent_cust.value === "") {
        	alert("고객번호를 입력하지 않았습니다.");
        	form.rent_cust.focus();
        	return false;
        }
        
    }
</script>
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
            <th>대여일자</th>
            <td>
                <input name="rent_ymd" type="text" value="<%= rent != null ? rent.getRent_ymd() : "" %>"/>
            </td>
        </tr>
        <tr>
            <th>대여번호(자동채번)</th>
            <td>
                <input name="rent_no" type="text" value="<%= rent != null ? rent.getRent_no() : "" %>" disabled>
            </td>
        </tr>
        <tr>
            <th>도서코드</th>
            <td>
                <input name="rent_book" type="text">
            </td>
        </tr>
        <tr>
            <th>고객번호</th>
            <td>
                <input name="rent_cust" type="text">
            </td>
        </tr>
        <tr>
            <th>반납기한(대여일 7일후)</th>
            <td>
                <input name="close_ymd" type="text" value="<%= rent != null ? rent.getClose_ymd() : "" %>">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="등록">
                <input type="button" value="조회" onclick="location.href='SearchServlet'">
            </td>
        </tr>
    </table>
</form>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>
