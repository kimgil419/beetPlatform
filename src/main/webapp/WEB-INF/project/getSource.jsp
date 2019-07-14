<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드상세보기</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.0/theme/eclipse.css" integrity="sha256-WhzJFLQmMeYNz3p+/UEqGJczEHrgZQiYawzX76gjnuo=" crossorigin="anonymous" />
<script src="http://codemirror.net/lib/codemirror.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.0/addon/edit/matchbrackets.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.0/addon/comment/continuecomment.js"></script>
<script src="http://codemirror.net/mode/javascript/javascript.js"></script>
<script>
	window.onload = function () {
		var readOnlyCodeMirror = CodeMirror.fromTextArea(document.getElementById('codesnippet_readonly'), {
	        mode: "javascript",
	        theme: "eclipse",
	        lineNumbers: true,
	        lineWrapping: true,
	        autofocus: true,
	        readOnly: true
	    });
		readOnlyCodeMirror.setSize(1000, 550);
	};
</script>
<style>
	.flex_div {
		display: flex;
	}
	#flex_div_children1 {
		width: 50%;
	}
	#flex_div_children2 {
		width: 50%;
		display: flex;
		justify-content: flex-end;
	}
	th {
		background-color: WhiteSmoke;
	}
	#sourceCode {
		margin-bottom: 10px;
	}
</style>
</head>
<body>
<div id="page-wrapper">
	<jsp:include page="../menu.jsp"/>
	<div class="container" style="margin-top:30px;">
		<h5>기능명 소스코드</h5>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>No.</th>
					<td>${source.source_idx }</td>
					<th>담당자</th>
					<td>${source.user_name }</td>
				</tr>
				<tr>
					<th>기능</th>
					<td>${source.source_name }</td>
					<th>진행상황</th>
					<td>${source.source_progress }</td>
				</tr>
			</tbody>
		</table>
		<div id="sourceCode">
			<textarea row="4" cols="50" id="codesnippet_readonly">${source.source_code }</textarea>		
		</div>
		<div>
			<div class="flex_div">
				<div id="flex_div_children1">
					<a href="modifySource.do?source_idx=${source.source_idx }"><input type="button" value="수정"></a>
					<a href="deleteSource.do?source_idx=${source.source_idx }&project_idx=${source.project_idx }"><input type="button" value="삭제"></a>
				</div>
				<div id="flex_div_children2">
					<a href="getProject.do?project_idx=${source.project_idx }"><input type="button" value="프로젝트"></a>
					<a href="getProjectList.do?currentPage=1&searchCondition=null&searchKeyword=null"><input type="button" value="목록"></a>
					<a href="getCommute.do"><input type="button" value="메인"></a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>