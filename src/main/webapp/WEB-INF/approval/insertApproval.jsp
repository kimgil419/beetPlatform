<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<style>
#container {
	width: 700px;
	margin: 0 auto;
}

h1, h3, p {
	text-align: center;
}

table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	margin: 0 auto;
}

th {
	background-color: orange;
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}
</style>
</head>
<body>

	<div id="container">
		<h1>글등록</h1>
		<p>
			<a href="logout.do">Log-out</a>
		</p>
		<hr>
		<form action="insertApproval.do" method="post"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td><input type="checkbox" name="urgent" value="1"> 긴급 </td>
				</tr>

				<tr>
					<td width="70">결재1<input type="text" name="user_id1"></td>

					<td width="70">결재2<input type="text" name="user_id2"></td>

					<td width="70">결재3<input type="text" name="user_id3"></td>
					
				</tr>

			</table>
		
				<table>
					<tr>
						<th>제목</th>
						<td colspan="2"><input type="text" name="a_title"
							value="${approval.a_title}"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td colspan="2">${userName.user_name }
						<input type="hidden" name="user_id" value="${userName.user_id}"></td>
					</tr>

					<tr>
						<th>내용</th>
						<td colspan="3"><textarea rows="10" cols="40"
								name="a_content"></textarea></td>
					</tr>
					
					<tr>
						<td colspan="2" class="center"><input type="submit"
							value="결재요청"></td>
					</tr>
				</table>
				</form>
				<p>
					<a href="getApprovalList.do">글 목록 가기</a>
				</p>
				</div>
</body>
</html>





