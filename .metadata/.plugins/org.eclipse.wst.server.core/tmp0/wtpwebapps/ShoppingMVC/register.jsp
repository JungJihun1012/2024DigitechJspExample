<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css" />
</head>
<body>
	<%@include file="Header.jsp" %>
	<%@include file="Nav.jsp" %>
	<section class="section">
		<div align="center" style="margin: 0 auto;">
				<h3>홈쇼핑 회원 등록</h3>
			</div>
			<br/>
			<div align="center">
				<form name="form" action="RegisterCtrl" method="post" onsubmit="return validate();">
					<input name="action" type="hidden" value="register">
					<table style="width: 400px;">
						<tr>
							<th>회원번호(자동생성)</th>
							<td>
								<input name="custno" type="text" value="<%=rs.getString("custno")%>">
							</td>
						</tr>
						<tr>
							<th>회원성명</th>
							<td>
								<input type="text" name="custname">
							</td>
						</tr>
						<tr>
							<th>회원전화</th>
							<td>
								<input type="text" name="phone">
							</td>
						</tr>
						<tr>
							<th>회원주소</th>
							<td>
								<input type="text" name="address">
							</td>
						</tr>
						<tr>
							<th>가입일자</th>
							<td>
								<input type="date" name="joindate">
							</td>
						</tr>
						<tr>
							<th>고객등급[A: VIP, B:일반, C:직원]</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>도시코드</th>
							<td>
								<input type="text">
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
			</div>
	</section>
	<%@include file="Footer.jsp" %>
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
</body>
</html>