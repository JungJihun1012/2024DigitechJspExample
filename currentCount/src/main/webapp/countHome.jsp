<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Declaration vs Scriptlet</title>
</head>
<body>
    <h2>JSP 선언부(<%! %>)와 스크립틀릿(<% %>) 차이점 이해</h2>

	<%!int currentCount; %>
    <%currentCount++;%>


    <p>현재 카운터 값: <%= currentCount %></p>
    <p>이 페이지는 새로고침할 때마다 카운터 값이 증가합니다.</p>
</body>
</html>