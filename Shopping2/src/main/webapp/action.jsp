<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="DBConnection.jsp" %>
    <%
    	String action = request.getParameter("action");
    	String move_url = "";
    	String msg = "";
    	switch(action) {
    	case "join":
    		String sql = "insert into member_tbl_02 values((select max(custno)+1 from member_tbl_02),? ,?, ?, ?, ?, ?)";
    		stmt = conn.prepareStatement(sql);
    		
    		stmt.setString(1, request.getParameter("custname"));
    		stmt.setString(2, request.getParameter("phone"));
    		stmt.setString(3, request.getParameter("address"));
    		stmt.setString(4, request.getParameter("joindate"));
    		stmt.setString(5, request.getParameter("grade"));
    		stmt.setString(6, request.getParameter("city"));
    		
    		if(stmt.executeUpdate()>0)
    			msg="성공적으로 저장되었습니다.";
    		else
    			msg="오류가 발생했습니다.";
    		
    		move_url = "join.jsp";
    		
    		stmt.close();
    		break;
    		
    	case "member":
			sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, request.getParameter("custname"));
			stmt.setString(2, request.getParameter("phone"));
			stmt.setString(3, request.getParameter("address"));
			stmt.setString(4, request.getParameter("joindate"));
			stmt.setString(5, request.getParameter("grade"));
			stmt.setString(6, request.getParameter("city"));
			stmt.setString(7, request.getParameter("user"));
			
			if(stmt.executeUpdate()>0)
    			msg="성공적으로 저장되었습니다.";
    		else
    			msg="오류가 발생했습니다.";
    			move_url = "join.jsp";
    			
    		break;
    	}
    %>
<script type="text/javascript">
	alert('<%=msg%>');
	location.replace("<%=move_url%>");
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>