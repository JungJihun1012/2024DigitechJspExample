<%@page import="VO.MemberMoneyVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<MemberMoneyVO> list = (ArrayList<MemberMoneyVO>) request.getAttribute("list");
    %><
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Header.jsp" %>
	<%@include file="Nav.jsp" %>
	<section class="section">
		<h2>회원 매출 조회</h2>
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
				for(MemberMoneyVO vo : list){
			%>
			<tr>
				<th><%=vo.getCustno() %></th>
				<th><%=vo.getCustname() %></th>
				<th><%=vo.getGrade() %></th>
				<th><%=vo.getAmount() %></th>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>