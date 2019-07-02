<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
</style>
</head>
<script>
function send_go(frm) {
	if (frm.user_id.value.trim() == "") {
		alert("아이디(ID)는 필수 입력항목입니다.\n입력하세요.");
		frm.id.value = "";
		frm.id.focus();
		return false;
		
	} else if(frm.user_password.value.trim() == "") {
		alert("비밀번호도 필수 입력항목입니다.\n입력하세요.");
		frm.id.value = "";
		frm.id.focus();
		return false;
	} 
	frm.action = "login.do";
	frm.submit();
	
}
var result = '${lgmsg}';
if(result == '아이디') {
alert(result + '나 비밀번호가 틀리셨습니다 인사과에 문의해주세요'); //아무 조건도 안걸면 계속 나온다 전달도 안된다
}
</script>
<body>

<div id="container">
	<h1>로그인</h1>
	<hr>
	<form method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="user_id" value="${user.id }"></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="text" name="user_password" value="${user.password }"></td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="로그인" onclick="send_go(this.form)">
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>