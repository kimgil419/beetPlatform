<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트목록</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<link href="/css/project_common.css" rel="stylesheet" type="text/css" />
<script>
	/* $(document).ready(function(){
		var = ${project}
	}); */
</script>
</head>
<body>
<div id="page-wrapper">
	<jsp:include page="../menu.jsp"/>
	<div class="container">
		<div class="container-fluid">
			<h4>
				<i class="fas fa-arrow-circle-down"></i>
				<small class="text-muted">프로젝트목록</small>
			</h4>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="width:50px;">No.</th>
						<th>프로젝트명</th>
						<th>담당자</th>
						<th>시작일</th>
						<th>종료일</th>
						<th style="width:70px">기간</th>
						<th>진행률</th>
						<th>상황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="project" items="${projectList }">
						<tr>
							<td>${project.project_idx }</td>
							<td class="text-left" style="padding-left:30px;width:240px;"><a href="getProject.do?project_idx=${project.project_idx }&currentPage=${pages.currentPage }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword }">${project.project_name }</a></td>
							<td class="text-center">${project.user_name }</td>
							<td class="text-center">${project.project_start_date }</td>
							<td class="text-center">${project.project_end_date }</td>
							<td class="text-center">${project.project_total_period }</td>
							<c:choose>
								<c:when test="${project.project_progress_percentage <= 0 }">
									<td style="width:135px;">
										<div class="progress" style="">
											<div class="progress-bar bg-success" style="width:0%">0%</div>
										</div>
									</td>
								</c:when>							
								<c:otherwise>
									<td style="width:135px;">
										<div class="progress" style="">
											<div class="progress-bar bg-success" style="width:${project.project_progress_percentage }%">${project.project_progress_percentage }%</div>
										</div>
									</td>
								</c:otherwise>
							</c:choose>
							<td class="text-center" style="width:70px;">${project.project_progress }</td>
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
							<a><button type="button" class="btn btn-outline-primary btn-sm">이전</button></a>
						</c:when>
						<c:otherwise>
							<a href="getProjectList.do?currentPage=${pages.currentPage - 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}"><button type="button" class="btn btn-outline-primary btn-sm">이전</button></a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pages.currentPage == pages.totalPage }">
							<a><button type="button" class="btn btn-outline-primary btn-sm">다음</button></a>
						</c:when>
						<c:otherwise>
							<a href="getProjectList.do?currentPage=${pages.currentPage + 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}"><button type="button" class="btn btn-outline-primary btn-sm">다음</button></a>
						</c:otherwise>
					</c:choose>
				</div>
				<div id="flex_div_children2" class="container-fluid">
					<div class="text-center">
						<ul class="pagination pagination-sm">
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
								<c:when test="${pages.currentPage == pages.totalPage || pages.totalPage == 0 }">
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
							<a href="/mail"><button type="button" class="btn btn-outline-primary btn-sm">메일작성</button></a>
							<a href="writeProject.do"><button type="button" class="btn btn-outline-primary btn-sm">작성</button></a>
							<a href="getCommute.do"><button type="button" class="btn btn-outline-primary btn-sm">메인</button></a>
						</c:when>
						<c:otherwise>
							<a href="getCommute.do"><button type="button" class="btn btn-outline-primary btn-sm">메인</button></a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="container container-bottom" style="margin-top:0; padding-top:0;">
			<form action="getProjectList.do?currentPage=1" method="POST">
				<div id="flex_div_search">
					<div class="form-group row">
						<div class="col-xs-2">
							<select class="form-control input-sm" style="height:33px;font-size=15px;" name="searchCondition">
								<c:forEach var="option" items="${conditionMap }">
									<option style="font-size:15px;" value="${option.value }">${option.key }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-xs-2">
							<input class="form-control input-sm" style="height:33px;" type="text" name="searchKeyword">
						</div>
						<button type="submit"><i class="fas fa-search"></i></button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>

























