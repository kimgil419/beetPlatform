<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>직원등록</title>

<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<!--  jQuery UI 라이브러리 js파일-->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script>
$(function() {
	  $( "#testDatepicker" ).datepicker({
	       changeYear: true,
	       changeMonth: true,
	       yearRange: '1960:2020',
	       dateFormat: 'yy-mm-dd'
	  });
	});
</script>
</head>
<body>

<h1>성공입니다</h1>

	<form action="insertUser.do" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="user_id"></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="text" name="user_password"></td>
		</tr>
		<tr>
			<th>소속부서</th>
			<td><input type="text" name="dept"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" id="testDatepicker" name="birth"></td>
		</tr>
		<tr>
			<th>직무</th>
			<td><input type="text" name="job_id"></td>
		</tr>
		<tr>
			<th>입사날짜</th>
			<td><input type="text" id="testDatepicker" name="firstjoin"></td>
		</tr>
		<tr>
			<th>퇴사날짜</th>
			<td><input type="text" id="testDatepicker" name="departure"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="user_name"></td>
		</tr>
		<tr>
			<th>직급</th>
			<td><input type="text" name="user_position"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<th>내선전화번호</th>
			<td><input type="text" name="cphone"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="직원등록">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>