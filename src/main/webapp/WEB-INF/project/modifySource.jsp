<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="library/codemirror/codemirror.js"></script>
<link rel="stylesheet" href="library/codemirror/codemirror.css">
<script src="library/codemirror/mode/javascript.js"></script>
<script>
	var codeMirror = CodeMirror(document.getElementById("code_editor"));
</script>
</head>
<body>
<h1>코드수정</h1>
	<form action="updateSource.do">
		<table border="1">
			<tr>
				<td>코드번호</td>
				<td><input type="text" name="source_idx" value="${source.source_idx }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="source_name" value="${source.source_name }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="code_editor" name="source_code" cols="200" rows="150">${source.source_code }</textarea></td>
			</tr>
		</table>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>