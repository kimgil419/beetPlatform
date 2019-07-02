<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>소스코드 상세보기</h1>
	<table border="1">
		<tbody>
			<tr>
				<td>담당자(미작업)</td>
			</tr>
			<tr>
				<td>소스번호</td>
				<td>${source.source_idx }</td>
			</tr>
			<tr>
				<td>기능</td>
				<td>${source.source_name }</td>
			</tr>
			<tr>
				<td>기능</td>
				<td>${source.source_code }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td><button type="button"><a href="modifySource.do?source_idx=${source.source_idx }">코드수정</</a></button></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>