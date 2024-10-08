<%@page import="java.util.ArrayList"%>
<%@page import="VO.MemberVO"%>
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
</head>
<body>
	<header class="header">
		도서 대여관리 ver1.0
	</header>
	<%@include file="Nav.jsp" %>
	<section class="section">
		<div align="center">
			회원등록
		</div>
		<table>
			<tr>
				<th><a href="EditMember">회원번호</a></th>
				<th>회원성명</th>
				<th>핸드폰번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>상태구분</th>
			</tr>
			<%
				for(int i=0; i<list.size(); i++) {
					MemberVO vo = list.get(i);
			%>
			<tr>
				<th><%=vo.getCust_no() %></th>
				<th><%=vo.getCust_name() %></th>
				<th><%=vo.getPhone() %></th>
				<th><%=vo.getAddress() %></th>
				<th><%=vo.getJoin_date() %></th>
				<%
					String sf = vo.getStat_fg();
					if(sf != null) {
						switch(sf) {
						case "0":
						%>
						<th>정상</th>
						<%
							break;
						case "1":
						%>
						<th>휴먼</th>
						<%
							default :
						%>
						<th></th>
						<%
						}} else {
						%>
						<th></th>
						<%} %>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>