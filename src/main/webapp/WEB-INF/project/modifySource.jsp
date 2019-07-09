<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드수정</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">
<script src="http://codemirror.net/lib/codemirror.js"></script>
<script src="http://codemirror.net/addon/edit/matchbrackets.js"></script>
<script src="http://codemirror.net/addon/edit/continuecomment.js"></script>
<script src="http://codemirror.net/mode/javascript/javascript.js"></script>
<script>
	window.onload = function () {
	    var editableCodeMirror = CodeMirror.fromTextArea(document.getElementById('codesnippet_editable'), {
	        mode: "javascript",
	        theme: "default",
	        lineNumbers: true
	    });
	};
	$(document).ready(function() {
		switch ("${source.source_progress }") {
		case "예정":
				$("#progress_select option:eq(0)").attr("selected", "selected");
			break;
		case "진행":
				$("#progress_select option:eq(1)").attr("selected", "selected");
			break;
		case "완료":
				$("#progress_select option:eq(2)").attr("selected", "selected");
			break;
		case "보류":
				$("#progress_select option:eq(3)").attr("selected", "selected");
			break;
		case "폐기":
				$("#progress_select option:eq(4)").attr("selected", "selected");
			break;
		default:
			alert("progress select error");
			break;
		}
	});
</script>
</head>
<body>
	<div id="page-wrapper" class="container-fluid">
	<jsp:include page="../menu.jsp"/>
		<form action="updateSource.do">
			<div>
				<h4>코드수정</h4>
				<table class="table table-bordered">
					<tr>
						<td>No.</td>
						<td><input type="text" name="source_idx" value="${source.source_idx }" readonly="readonly"></td>
						<td>작성자</td>
						<td><input type="button" id="pop" name="search_user_id" value="찾기" onclick="search()">
						<input type="text" name="user_id" value="${source.user_id }">찾기로수정해서쓰게
						<input type="text" name="source_idx" value="${source.user_name }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>기능</td>
						<td><input type="text" name="source_name" value="${source.source_name }"></td>
						<th>진행상황</th>
						<td>
							<select id="progress_select" name="source_progress">
								<option value="예정">예정</option>
								<option value="진행">진행</option>
								<option value="완료">완료</option>
								<option value="보류">보류</option>
								<option value="폐기">폐기</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<textarea rows="4" cols="50" name="source_code" id="codesnippet_editable"></textarea>
			</div>
			<div class="container">
				<input type="submit" value="수정하기">
			</div>
		</form>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	</div>
</body>
</html>