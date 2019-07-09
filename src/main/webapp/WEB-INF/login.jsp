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
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>

<script>
$(document).ready(function(){
	
	 if( $("#user_id").val().length == 0 )
		 {
		 $("#user_id").focus();
		 }
});



function send_go() {
	if (document.frm.user_id.value.trim() == "") {
		
		alert("아이디(ID)는 필수 입력항목입니다.\n입력하세요.");
	
	
		document.frm.user_id.focus();
		
		return false;
		
		
	} else if(document.frm.user_password.value.trim() == "") {
		alert("비밀번호도 필수 입력항목입니다.\n입력하세요.");
	
		document.frm.user_password.focus();
		
		return false;
	} else {
		frm.action = "login.do";
		frm.submit();
	}
}

var result = '${lgmsg}';
if(result == '아이디') {
alert(result + '나 비밀번호가 틀리셨습니다 인사과에 문의해주세요'); //아무 조건도 안걸면 계속 나온다 전달도 안된다
}
</script>
</head>
<body>


	<h1>로그인</h1>
	<hr>
	<form name="frm" method="post">
	<fieldset>
		<legend>로그인</legend>
		<p>아이디: <input type="text" name="user_id" id="user_id"></p>
		<p>비번: <input type="text" name="user_password"></p>
	
		
		<input type="button" value="회원가입" onclick="send_go()">

	</fieldset>
	
	</form>


</body>
</html>