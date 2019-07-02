<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="/js/jquery-3.4.0.js"></script>
<!-- <style>
	ul, li {
		display: inline;
	}	
</style> -->
</head>
<body>
	<h1>조건, ${pages.searchCondition }</h1>
	<h1>문구, ${pages.searchKeyword }</h1>
	<h1>프로젝트리스트</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>담당자</th>
				<th>제목</th>
				<th>등록일</th>
				<th>진행상황</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="project" items="${projectList }">
				<tr>
					<td>${project.project_idx }</td>
					<td>${project.user_name }</td>
					<td><a href="getProject.do?project_idx=${project.project_idx }">${project.project_name }</a></td>
					<td>${project.project_reg_date }</td>
					<td>${project.project_progress }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr>
	<div>
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
	<div class="text-center">
		<ul class="pagination mx-auto">
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
	<div>
		<c:choose>
			<c:when test="${userInfo.user_position == '과장' || userInfo.user_position == '차장' || userInfo.user_position == '부장' || userInfo.user_position == '이사' || userInfo.user_position == '대표이사' }">
				<a href="writeProject.do"><button type="button">프로젝트 작성</button></a>
			</c:when>
		</c:choose>
		<a href="getCommute.do"><button type="button">메인화면</button></a>
	</div>
	<form action="getProjectList.do?currentPage=1" method="POST">
		<div>
			<table>
				<tr>
					<td>
						<select name="searchCondition">
							<c:forEach var="option" items="${conditionMap }">
								<option value="${option.value }">${option.key }</option>
							</c:forEach>
						</select>
						<input type="text" name="searchKeyword">
						<input type="submit" value="검색">
					</td>
				</tr>
			</table>
		</div>
	</form>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>

























