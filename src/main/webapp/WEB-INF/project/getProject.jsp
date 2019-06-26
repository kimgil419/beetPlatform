<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>프로젝트 상세보기</h1>
	<table border="1">
		<tr>
			<th>프로젝트번호</th>
			<td>${project.project_idx }</td>
			<th>계약업체</th>
			<td>${project.project_contractor }</td>
			<th>등록일</th>
			<td>${project.project_reg_date }</td>
		</tr>
		<tr>
			<th>프로젝트명</th>
			<td>${project.project_name }</td>
			<th>계약금액</th>
			<td>${project.project_contract_amount }</td>
			<th>계약기간</th>
			<td>${project.project_start_date }</td>
			<td>${project.project_end_date }</td>
		</tr>
		<tr>
			<th>팀장</th>
			<td>${project.project_manager }</td>
			<th>팀원</th>
			<td></td>
			<th>진행상황</th>
			<td>${project.project_progress }</td>
		<tr>
	</table>
<table border="1">
	<tr>
		<th>담당자</th>
		<th>소스번호(삭제예정)</th>
		<th>기능</th>
		<th>진행상황</th>
	</tr>
	<c:forEach var="source" items="${sourceList }">
		<tr>
			<td>${source.user_id }</td>
			<td>${source.source_idx }</td>
			<td><a href="getSource.do?source_idx=${source.source_idx }">${source.source_name }</a></td>
			<td>${source.source_progress }</td>
		</tr>
	</c:forEach>
</table>
<a href="deleteProject.do?project_idx=${project.project_idx }">삭제</a>
<a href="modifyProject.do?project_idx=${project.project_idx }">수정</a>
</body>
</html>