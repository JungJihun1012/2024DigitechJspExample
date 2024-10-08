<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int custno = (int) request.getAttribute("cust_no");
    Date join = (Date) request.getAttribute("join_date");
    String formattedJoinDate = "";
    if (join != null) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        formattedJoinDate = sdf.format(join);
    }
%>
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
        회원정보관리(수정)
    </div>
    <br/> <br/>
    <form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
        <input name="action" type="hidden" value="register" />
        <table style="width: 400px;" border="1">
            <tr>
                <th>회원번호</th>
                <td>
                    <input name="cust_no" type="text" value="<%= custno %>" disabled />
                </td>
            </tr>
            <tr>
                <th>회원성명</th>
                <td>
                    <input name="cust_name" type="text">
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
                    <input name="join_date" type="text" value="<%= formattedJoinDate %>" disabled="disabled">
                </td>
            </tr>
            <tr>
                <th>상태구분</th>
                <td>
                    <select style="width: 100px;">
                        <option value="정상">정상</option>
                        <option value="휴먼">휴먼</option>
                        <option value="탈퇴">탈퇴</option>
                    </select>
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
