<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트상세</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<link href="/css/project_common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="page-wrapper">
    <jsp:include page="../menu.jsp"/>
    <div class="container">
		<h4>
			<i class="fas fa-arrow-circle-down"></i>
			<small class="text-muted">프로젝트상세</small>
		</h4>
		<table class="table table-bordered">
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
				<td><fmt:formatNumber pattern="##,###,###,###"
						value="${project.project_contract_amount }" />원</td>
				<th>계약기간</th>
				<td>${project.project_start_date }&nbsp;&nbsp;~&nbsp;${project.project_end_date }</td>
			</tr>
			<tr>
				<th>책임자</th>
				<td>${project.user_name }</td>
				<th>진행상황</th>
				<td>${project.project_progress }</td>
			<tr>
		</table>
		<h4>
			<i class="fas fa-arrow-circle-down"></i>
			<small class="text-muted">프로젝트상세</small>
		</h4>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>No.</th>
					<th>기능</th>
					<th>담당자</th>
					<th>진행상황</th>
					<th>수정일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="source" items="${sourceList }">
					<tr>
						<td>${source.source_idx }</td>
						<td>${source.user_name }</td>
						<td><a href="getSource.do?source_idx=${source.source_idx }">${source.source_name }</a></td>
						<td>${source.source_progress }</td>
						<td>수정일</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<div class="container container-bottom">
			<div class="flex_div">
				<div id="flex_div_children1">
					<c:if
						test="${project.project_manager == user_id || fn:contains(user_position, '이사')}">
						<a href="modifyProject.do?project_idx=${project.project_idx }"><input
							type="button" class="btn btn-outline-primary btn-sm" value="수정"></a>
						<a href="deleteProject.do?project_idx=${project.project_idx }"><input
							type="button" class="btn btn-outline-primary btn-sm" value="삭제"></a>
					</c:if>
				</div>
				<div id="flex_div_children2"></div>
				<div id="flex_div_children3">
					<a href="getProjectList.do?currentPage=${pages.currentPage }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword }">
						<input type="button" class="btn btn-outline-primary btn-sm" value="돌아가기"></a>
					<a href="getProjectList.do?"><input type="button" class="btn btn-outline-primary btn-sm" value="목록"></a>
					<a href="getCommute.do"><input type="button" class="btn btn-outline-primary btn-sm" value="메인"></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>