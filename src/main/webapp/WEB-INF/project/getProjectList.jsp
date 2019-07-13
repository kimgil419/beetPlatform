<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트목록</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<script>
	$(document).ready(function(){
		var = ${project}
	});
</script>
<style>
	.flex_div {
		display: flex;
	}
	#flex_div_children1 {
		width: 20%;
	}
	#flex_div_children2 {
		width: 60%;
		display: flex;
		justify-content: center;
	}
	
	#flex_div_children3 {
		width: 20%;
		display: flex;
		justify-content: flex-end;
	}
	#flex_div_search {
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
<div id="page-wrapper">
	<jsp:include page="../menu.jsp"/>
	<div class="container" style="margin-top:30px;">
		<div class="container-fluid">
			<h4>프로젝트목록</h4>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>No.</th>
						<th>프로젝트명</th>
						<th>담당자</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>기간</th>
						<th>진행</th>
						<th>진행상황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="project" items="${projectList }">
					<c:set var="period" value="${project.project_period }" />
					<c:set var="deadline" value="${project.project_deadline }" />
					<fmt:formatNumber pattern="###.#" var="percentage" value="${(1 - deadline / period) * 100 }" />
						<tr>
							<td>${project.project_idx }</td>
							<td><a href="getProject.do?project_idx=${project.project_idx }&currentPage=${pages.currentPage }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword }">${project.project_name }</a></td>
							<td>${project.user_name }</td>
							<td>${project.project_start_date }</td>
							<td>${project.project_end_date }</td>
							<td>${project.project_period }</td>
							<td>
								<div class="progress" style="">
									<div class="progress-bar bg-success" style="width:${percentage }%">${percentage }</div>
								</div>
							</td>
							<td>${project.project_progress }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container-fluid">
			<div class="flex_div">
				<div id="flex_div_children1">
					<c:choose>
						<c:when test="${pages.currentPage == 1 }">
							<button type="button">이전</button>
						</c:when>
						<c:otherwise>
							<a href="getProjectList.do?currentPage=${pages.currentPage - 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}"><button type="button">이전</button></a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pages.currentPage == pages.totalPage }">
							<button type="button">다음</button>
						</c:when>
						<c:otherwise>
							<a href="getProjectList.do?currentPage=${pages.currentPage + 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}"><button type="button">다음</button></a>
						</c:otherwise>
					</c:choose>
				</div>
				<div id="flex_div_children2" class="container-fluid">
					<div class="text-center">
						<ul class="pagination pagination">
							<c:choose>
								<c:when test="${pages.currentPage == 1 }">
									<li class="page-item disabled"><a class="page-link" href="#">처음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="getProjectList.do?currentPage=1&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">처음</a></li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pages.startPage == 1 }">
									<li class="page-item disabled"><a class="page-link" href="#">PREV5</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="getProjectList.do?currentPage=${pages.startPage - 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">PREV5</a>
								</c:otherwise>
							</c:choose>
							<c:forEach var="page" begin="${pages.startPage }" end="${pages.endPage }">
								<c:choose>
									<c:when  test="${page == pages.currentPage }">
										<li class="page-item active"><a class="page-link" href="#">${page }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="getProjectList.do?currentPage=${page }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">${page }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pages.endPage == pages.totalPage }">
									<li class="page-item disabled"><a class="page-link" href="#">NEXT5</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="getProjectList.do?currentPage=${pages.endPage + 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">NEXT5</a></li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pages.currentPage == pages.totalPage }">
									<li class="page-item disabled"><a class="page-link" href="#">마지막</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="getProjectList.do?currentPage=${pages.totalPage }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">마지막</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<div id="flex_div_children3">
					<c:choose>
						<c:when test="${userInfo.user_position == '과장' || userInfo.user_position == '차장' || userInfo.user_position == '부장' || userInfo.user_position == '이사' || userInfo.user_position == '대표이사' }">
							<a href="/mail"><button type="button">메일작성</button></a>
							<a href="writeProject.do"><button type="button">작성</button></a>
							<a href="getCommute.do"><button type="button">메인</button></a>
						</c:when>
						<c:otherwise>
							<a href="getCommute.do"><button type="button">메인</button></a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<form action="getProjectList.do?currentPage=1" method="POST">
			<div class="container">
			<div id="flex_div_search">
				<select name="searchCondition">
					<c:forEach var="option" items="${conditionMap }">
						<option value="${option.value }">${option.key }</option>
					</c:forEach>
				</select>
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>

























