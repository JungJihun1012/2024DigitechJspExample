<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	section { width: 100%; height: calc(100vh - 200px); }
	.footer {width: 100%; height: 50px; background-color: #0000ff; color: #ffffff; text-align: center; line-height: 50px;}
</style>


</head>
<script type="text/javascript">
	function validate(){
		
		const phoneRegexp = /^(0)\d{1,2}-\d{3,4}-\d{4}$/;
		//회원성명 체크
		if(form.custname.value ==="") {
			alert("회원성명을 입력하지 않았습니다.");
			form.custname.focus();
			return false;
		}
		
		if(form.phone.value === "") {
			alert("전화번호를 입력하지 않았습니다.");
			form.phone.focus();
			return false;
		}else {
			if(!phoneRegexp.test(form.phone.value)){
				alert("전화번호 형식으로 입력하세요");
				form.phone.focus();
				return false;
			}
		}
		//주소
		if(form.address.value==="") {
			alert("주소를 입력하지 않았습니다.");
			form.address.focus();
			return false;
		}
		
		//가입일 체크
		if(form.joindate.value==="") {
			alert("가입일자를 입력하지 않았습니다.");
			form.joindate.focus();
			return false;
		}
		
		if(form.grade.value===""){
			alert("고객등급을 입력하지 않았습니다.");
			form.grade.focus();
			return false;
		}else {
			if(!(form.grade.value==="A"|| form.grade.value==="B" || form.grade.value==="C")) {
				alert("고객등급을 정확히 입력하세요.");
				form.grade.focus();
				return false;
			}
		}
			
	}
</script>
<body>
	<header class="header">
		쇼핑몰 회원관리 ver1.0
	</header>
	<nav class="nav">
		<ul>
			<li><a href="join.jsp">회원등록</a></li>
			<li><a href="getMember.jsp">회원목록 조회/수정</a></li>
			<li><a href="money.jsp">회원매출 조회</a></li>
			<li><a href="">홈쇼핑 회원 정보 수정</a></li>
		</ul>
	</nav>
		<br/>
	<section class="section">
		<div align="center" style="margin: 0 auto;">
			<h3>홈쇼핑 회원 등록</h3>
		</div>
		<br/>
		<div align="center">
		<%  
		//if(rs.next()) {
    	%>
			<form name="form" action="action.jsp" method="post" onsubmit="return validate();">
				<input name="action" type="hidden" value="member">
				<table style="width: 400px;">
					<tr>
						<th>회원번호(자동생성)</th>
						<td>
							<input name="user" type="text" value="<%= %>">
						</td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td>
							<input type="text" name="custname" value="<%=%>">
						</td>
					</tr>
					<tr>
						<th>회원전화</th>
						<td>
							<input type="text" name="phone" value="<%=%>">
						</td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td>
							<input type="text" name="address"value="<%= %>">
						</td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td>
							<input type="date" name="joindate" value="<%=%>">
						</td>
					</tr>
					<tr>
						<th>고객등급[A: VIP, B:일반, C:직원]</th>
						<td>
							<input name="grade" type="text" value="<%=%>">
						</td>
					</tr>
					<tr>
						<th>도시코드</th>
						<td>
							<input name="city" type="text" value="<%=%>">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="등록"/>
							<input type="button" onclick="location.href='getMember.jsp'" value="조회">
						</td>
					</tr>
				</table>
			</form>
			<%
			//}
			%>
		</div>
	</section>
		<footer class="footer">
		<ul>
			<li>HRDKorea copyright &copy; 2016 All right reserved. Human Resouces Development Serivce of Korea.</li>
		</ul>
	</footer>
</body>
</html>