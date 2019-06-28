<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>프로젝트 수정</h1>
	<form action="updateProject.do?project_idx=${project.project_idx}" method="post">
		<table border="1">
			<tr>
				<th>프로젝트번호</th>
				<td>${project.project_idx }</td>
				<th>계약업체</th>
				<td><input type="text" name="project_contractor" value="${project.project_contractor }"></td>
				<th>등록일</th>
				<td>${project.project_reg_date }</td>
			</tr>
			<tr>
				<th>프로젝트명</th>
				<td><input type="text" name="project_name" value="${project.project_name }"></td>
				<th>계약금액</th>
				<td><input type="number" name="project_contract_amount" value="${project.project_contract_amount }"></td>
				<th>계약기간</th>
				<td><input type="date" name="project_start_date" value="${project.project_start_date }"></td>
				<td><input type="date" name="project_end_date" value="${project.project_end_date }"></td>
			</tr>
			<tr>
				<th>팀장</th>
				<td><input type="text" name="project_manager" value="${project.project_manager }"></td>
				<th>팀원</th>
				<td><input type="text" name="project_members" value="${project.project_members }"></td>
				<th>진행상황</th>
				<td><input type="text" name="project_progress" value="${project.project_progress }"></td>
			<tr>
		</table>
		<input type="submit" value="수정">
	</form>
</body>
</html>