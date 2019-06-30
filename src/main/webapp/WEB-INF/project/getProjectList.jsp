<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>

</script>
<style>
	ul, li {
		display: inline;
	}	
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>프로젝트리스트</h1>
	<table border='1'>
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
					<td>${project.project_manager }</td>
					<td><a href="getProject.do?project_idx=${project.project_idx }">${project.project_name }</a></td>
					<td>${project.project_reg_date }</td>
					<td>${project.project_progress }</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<ul>
						<c:choose>
							<c:when test="${pages.currentPage == 1 }">
								<li>처음</li>
							</c:when>
							<c:otherwise>
								<li><a href="getProjectList.do?currentPage=1">처음</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pages.startPage == 1 }">
								<li>&lt;&lt;</li>
							</c:when>
							<c:otherwise>
								<li><a href="getProjectList.do?currentPage=${pages.startPage - 1 }">&lt;&lt;</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pages.currentPage == 1 }">
								<li>&lt;</li>
							</c:when>
							<c:otherwise>
								<li><a href="getProjectList.do?currentPage=${pages.currentPage - 1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
							<c:forEach var="page" begin="${pages.startPage }" end="${pages.endPage }">
								<li><a href="getProjectList.do?currentPage=${page }">${page }</a></li>
							</c:forEach>
						<c:choose>
							<c:when test="${pages.currentPage == pages.totalPage }">
								<li>&gt;</li>
							</c:when>
							<c:otherwise>
								<li><a href="getProjectList.do?currentPage=${pages.currentPage + 1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pages.endPage == pages.totalPage }">
								<li>&gt;&gt;</li>
							</c:when>
							<c:otherwise>
								<li><a href="getProjectList.do?currentPage=${pages.endPage + 1 }">&gt;&gt;</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pages.currentPage == pages.totalPage }">
								<li>끝</li>
							</c:when>
							<c:otherwise>
								<li><a href="getProjectList.do?currentPage=${pages.totalPage }">끝</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</td>
			</tr>
		</tfoot>
	</table>
	<a href="https://www.naver.com/">>타사이트 링크 어케검????</a>
	<c:choose>
		<c:when test="${user.position == '과장' || user.position == '차장' || user.position == '부장' || user.position == '이사' || user.position == '대표이사' }">
			<a href="writeProject.do">프로젝트 작성</a>
		</c:when>
		<c:otherwise>
			<a href="#">직급이 딸려요</a>
		</c:otherwise>
	</c:choose>
	<a href="writeProject.do">프로젝트 작성2</a>
	<a href="http://localhost:9999/main.jsp">메인화면main.jsp</a>
	<a href="http://localhost:9999/login.do">메인화면login.do</a>
	<a href="login.do">메인화면 순수 login.do</a>
	
</body>
</html>




































