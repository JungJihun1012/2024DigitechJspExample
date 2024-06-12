<%@page import="VO.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="Header.jsp" %>
	<%@include file="Nav.jsp" %>
	<section class="section">
	<br><br><br>
	<table>
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
			for(int i=0;i<list.size(); i++) {
				MemberVO vo = list.get(i);
		%>
		<tr>
			<th><%=vo.getCustno() %></th>
			<th><%=vo.getCustname() %></th>
			<th><%=vo.getPhone() %></th>
			<th><%=vo.getAddress() %></th>
			<th><%=vo.getJoindate() %></th>
			<%
			String grade =vo.getGrade();
			if(grade != null){
			switch(grade){
			case "A":
			%>
			<th>VIP</th>
			<%
			break;
			case "B":		
			%>
			<th>일반</th>
			<%
			break;
			case "C":
			%>
			<th>직원</th>
			<%
			default :
			%>
			<th></th>
			<%
			}}else{
			%>
			<th></th>
			<%
			}
			%>
			<th><%=vo.getCity() %></th>
		</tr>
		<%
			}
		%>
	</table>
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>