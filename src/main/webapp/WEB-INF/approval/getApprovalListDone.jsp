<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지난 서류 목록</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
	
	<div class="container" style="margin-top:30px;">
		<div class="container-fluid">
			<h4>지난 결재 목록</h4>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>결재자1</th>
						<th>결재자2</th>
						<th>결재자3</th>
						<th>등록일</th>
					
					</tr>
				</thead>
				<tbody>
					<c:forEach var="approvalList" items="${approvalListDone }">
						<tr>
							<td>${approvalList.a_num }</td>
							<td><a href="getApprovalDone.do?a_num=${approvalList.a_num }
							&currentPage=${pages.currentPage }&searchCondition=${pages.searchCondition }
							&searchKeyword=${pages.searchKeyword }">${approvalList.a_title }</a></td>
							<td>${approvalList.user_name }</td>
							<td>${approvalList.user_id1} </td>
							<td>${approvalList.user_id2} </td>
							<td>${approvalList.user_id3} </td>							
							<td>${approvalList.regdate }</td>
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
							<a href="getApprovalListDone.do?currentPage=${pages.currentPage - 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}"><button type="button">이전</button></a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pages.currentPage == pages.totalPage }">
							<button type="button">다음</button>
						</c:when>
						<c:otherwise>
							<a href="getApprovalListDone.do?currentPage=${pages.currentPage + 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}"><button type="button">다음</button></a>
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
									<li class="page-item"><a class="page-link" href="getApprovalListDone.do?currentPage=1&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">처음</a></li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pages.startPage == 1 }">
									<li class="page-item disabled"><a class="page-link" href="#">PREV5</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="getApprovalListDone.do?currentPage=${pages.startPage - 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">PREV5</a>
								</c:otherwise>
							</c:choose>
							<c:forEach var="page" begin="${pages.startPage }" end="${pages.endPage }">
								<c:choose>
									<c:when  test="${page == pages.currentPage }">
										<li class="page-item active"><a class="page-link" href="#">${page }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="getApprovalListDone.do?currentPage=${page }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">${page }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pages.endPage == pages.totalPage }">
									<li class="page-item disabled"><a class="page-link" href="#">NEXT5</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="getApprovalListDone.do?currentPage=${pages.endPage + 1 }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">NEXT5</a></li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pages.currentPage == pages.totalPage }">
									<li class="page-item disabled"><a class="page-link" href="#">마지막</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="getApprovalListDone.do?currentPage=${pages.totalPage }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword}">마지막</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<form action="getApprovalListDone.do?currentPage=1" method="POST">
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