<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
<script>
function categoryChange() {
	var sel = $("#ss option:selected").val();
	var se = "";
	if (sel != "X"){
		
		$("#category").val(sel); 
	}
}

function send_go(frm) {
	if (frm.t_title.value.trim() == "") {
		
		alert("제목을 입력안하셨습니다.\n입력하세요.");
		frm.t_title.value = "";
		frm.t_title.focus();
		
		frm.action = "redirect:insertBoard";
		frm.submit();
		
	} else if(frm.user_name.value.trim() == "") {
		alert("작성자를 입력안하셨습니다.\n입력하세요.");
		frm.user_name.value = "";
		frm.user_name.focus();
		
		frm.action = "redirect:insertBoard";
		frm.submit();
	} else if(frm.t_content.value.trim() == "") {
		alert("내용을 입력안하셨습니다.\n입력하세요.");
		frm.t_content.value = "";
		frm.t_content.focus();
		
		frm.action = "redirect:insertBoard";
		frm.submit();
	}
}

var result = '${bdmsg}';
var results = '${bdfsmsg}';
if(result == '공지') {
alert(result + '를 쓸 수 없는 권한입니다'); //아무 조건도 안걸면 계속 나온다 전달도 안된다
}else if(results == '본문'){
	alert(results + '태그를 선택해주세요');
}
</script>
</head>
<body>

<div id="container">
	<h1>글등록</h1>
	<p><a href="logout.do">Log-out</a></p>
	<hr>
	<form action="insertBoard.do?curPage=${c2 }" method="post"
	        enctype="multipart/form-data">
	<table>
		<tr>
			<th width="70">제목</th>
			<td>
				<input type="text" name="t_title" size="30">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" name="user_name" value="${user_name }">
			</td>
		</tr>
		<tr>
		    <th>본문</th>
		    <td>
		        <select name="ss" id="ss" onchange="categoryChange()">
                    <option value="X">선택사항</option>
                    <option value="Y">공지사항</option>
                    <option value="N">일반글</option>      
                </select>
                <input type="hidden" name="t_noti" id="category">
		    </td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="t_content" rows="10" cols="40"></textarea>
			</td>
		</tr>
		<tr>
		    <th>업로드</th>
		    <td>
		        <input type="file" name="t_imgs">
		    </td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="새글 등록" onclick="send_go(this.form)">
			</td>
		</tr>
	</table>
	</form>
	<p><a href="getBoardList.do?curPage=${c2 }">글 목록 가기</a></p>
</div>

</body>
</html>





