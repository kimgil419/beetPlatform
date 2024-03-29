<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function addRow() {
		var tbody_func = document.getElementById('tbody_func');
		var row = tbody_func.insertRow(tbody_func.rows.length);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		cell1.innerHTML = "<input type='text' name='user_id'>";
		cell2.innerHTML = "<input type='text' name='source_name'>";
		cell3.innerHTML = '<select name="source_progress"><option value="예정">예정</option><option value="완료">완료</option><option value="보류">보류</option><option value="폐기">폐기</option></select>';
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<h1>프로젝트 작성</h1>
	<form action="insertProject.do" method="post">
		<table border="1">
			<tbody>
				<tr>
					<th>계약업체</th>
					<td><input type="text" name="project_contractor"></td>
				</tr>
				<tr>
					<th>프로젝트명</th>
					<td><input type="text" name="project_name"></td>
					<th>계약금액</th>
					<td><input type="number" name="project_contract_amount"></td>
					<th>계약기간</th>
					<td><input type="date" name="project_start_date"></td>
					<td><input type="date" name="project_end_date"></td>
				</tr>
				<tr>
					<th>팀장</th>
					<td><input type="text" name="project_manager"></td>
					<th>진행상황</th>
					<td>
						<select name="project_progress">
							<option value="예정">예정</option>					
							<option value="완료">완료</option>						
							<option value="보류">보류</option>						
							<option value="폐기">폐기</option>						
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<table border="1">
			<tbody id="tbody_func">
				<tr>
					<td colspan="3">
						<input type="button" value="추가" onclick="addRow()">
						<input type="button" value="삭제" onclick="deleteRow()">
					</td>
				</tr>
				<tr>
					<th>담당자</th>
					<th>기능</th>
					<th>진행상황</th>
				</tr>
				<tr>
					<td><input type="text" name="user_id"></td>
					<td><input type="text" name="source_name"></td>
					<td>
						<select name="source_progress">
							<option value="예정">예정</option>						
							<option value="완료">완료</option>						
							<option value="보류">보류</option>						
							<option value="폐기">폐기</option>						
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="등록">
		<input type="reset" value="재작성">
	</form>
</body>
</html>