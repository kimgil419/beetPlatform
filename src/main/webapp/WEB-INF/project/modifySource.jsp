<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드수정</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<link href="/css/project_common.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.0/theme/eclipse.css" integrity="sha256-WhzJFLQmMeYNz3p+/UEqGJczEHrgZQiYawzX76gjnuo=" crossorigin="anonymous" />
<script src="http://codemirror.net/lib/codemirror.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.0/addon/edit/matchbrackets.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.0/addon/comment/continuecomment.js"></script>
<script src="http://codemirror.net/mode/javascript/javascript.js"></script>
<script>
	window.onload = function () {
	    var editableCodeMirror = CodeMirror.fromTextArea(document.getElementById('codesnippet_editable'), {
	        mode: "javascript",
	        theme: "eclipse",
	        lineNumbers: true,
	        lineWrapping: true,
	        autofocus: true
	    });
	    editableCodeMirror.setSize(1000, 600);
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
<div id="page-wrapper">
	<jsp:include page="../menu.jsp"/>
	<form action="updateSource.do">
		<div class="container">
			<h4>
				<i class="fas fa-arrow-circle-down"></i>
				<small class="text-muted">${source.source_name } 수정</small>
			</h4>
			<table class="table table-bordered">
				<tr>
					<th>No.</th>
					<td><input type="text" name="source_idx" value="${source.source_idx }" readonly="readonly"></td>
					<th>작성자</th>
					<td><button type="button" class="searchButton" data-toggle="modal" data-target="#exampleModal" onclick="selectEmployee()"><i class="fas fa-search-plus"></i></button>
					<input type="text" name="user_id" value="${source.user_id }">
					<input type="text" name="source_idx" value="${source.user_name }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>기능</th>
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
		<div class="container">
			<textarea rows="4" cols="50" name="source_code" id="codesnippet_editable">${source.source_code }</textarea>
		</div>
		<div class="container container-bottom">
			<input type="submit" class="btn btn-outline-primary btn-sm" value="수정하기">
		</div>
	</form>
</div>
</body>
</html>