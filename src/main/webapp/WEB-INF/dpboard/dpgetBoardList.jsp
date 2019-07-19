
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 스크립트릿, 표현식 사용하지 말고 EL, JSTL 사용 형태로 전환 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<style>
.pagination>li>a { border-radius: 50% !important;margin: 0 5px;}
.project-tab {
    padding: 10%;
    margin-top: -8%;
}
.project-tab #tabs{
    background: #007b5e;
    color: #eee;
}
.project-tab #tabs h6.section-title{
    color: #eee;
}
.project-tab #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #0062cc;
    background-color: transparent;
    border-color: transparent transparent #f3f3f3;
    border-bottom: 3px solid !important;
    font-size: 16px;
    font-weight: bold;
}
.project-tab .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: #0062cc;
    font-size: 16px;
    font-weight: 600;
}
.project-tab .nav-link:hover {
    border: none;
}
.project-tab thead{
    background: #585858;
    color: #FAFAFA;
}
.project-tab a.project-tab1{
    text-decoration: none;
    color: #333;
    font-weight: 600;
}
.notie { background-color: #D8D8D8; }
</style>
<script>
var result = '${secretmassage}';
if(result == '비밀글') {
	alert(result + '을 열람할 수 있는 권한이 아닙니다'); //아무 조건도 안걸면 계속 나온다 전달도 안된다
	} 
</script>
</head>
<body>
<div id="page-wrapper">
<jsp:include page="../menu.jsp"/>




<div class="center-block" style='padding-left: 40%;' >
	<h1>${dept} 부서 게시판</h1>
</div>
	
	<div class = "container" >
	 
                            <div class="project-tab">
	<!-- 데이타 표시 -->
	<table  class="table" cellspacing="0">
	<thead>
		<tr>
			
			<th width="200">제목</th>
			<th width="50">작성자</th>
			<th width="100">등록일</th>
			<th width="50">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${boardList }">
		<tr>
		
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>
				<img class="fancy"  style="display: ${(board.t_password == '구분') ? 'none':'' };" src ="image/icon_secret.gif" alt="titleImage"><a href="dpgetBoardInsert.do?seq=${board.seq }&curPage=${pvo.nowPage}&t_password=${board.t_password}">
				<a class="project-tab1" href="dpgetBoardInsert.do?seq=${board.seq }&curPage=${pvo.nowPage}">
					${board.t_title }
				</a>
			</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.user_name }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.t_regdate }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.cnt }</td>
		</tr>
		</c:forEach>
	</tbody>
	
		<tr>
			<td colspan="4">
			<nav aria-label="Page navigation example">
				
				
				<ul class="pagination">
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : 첫번째 블록인 경우 --%>
					<c:when test="${pvo.beginPage == 1}">
						<li class="disabled"><a class="page-link"  >«</a></li><!-- href가 이동표시가 있으면 li태그를 비활성화해도 이동표시가 생긴다 -->
					</c:when>
					<c:otherwise>
						<li><a class="page-link" href="dpgetBoardList.do?curPage=${pvo.beginPage - 1 }">«</a></li>
					</c:otherwise>
				</c:choose>	
				
				<%--블록내에 표시할 페이지 반복처리(시작페이지~끝페이지) --%>
				<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${k == pvo.nowPage }">
						<li class="page-item"><a class="page-link">${k }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="dpgetBoardList.do?curPage=${k }">${k }</a><!-- 부트스트랩4버전은 클래스 page-link를 써야지 페이징처리표시가 가능해진다 -->
						</li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : endPage가 전체페이지수보다 크거나 같으면 --%>
					<c:when test="${pvo.endPage >= pvo.totalPage }">
					    <li class="disabled"><a class="page-link"  >»</a></li>
						
					</c:when>
					<c:otherwise>
						<li><a class="page-link" href="dpgetBoardList.do?curPage=${pvo.endPage + 1 }">»</a></li>
					</c:otherwise>
					
					
				</c:choose>
				    <li><a href="dpgetBoardList.do?curPage=${pvo.nowPage }&li=original">목록으로</a></li>
					<li><a href="dpinsertBoardf.do?curPage=${pvo.nowPage }">새글 등록</a></li>
				</ul>
				<form action="dpgetBoardList.do?curPage=1" method="POST">
		<div class="center-block" style='width:1000px; background:#F2F2F2; padding-left: 40%;'>
		<select name="searchCondition">
				<c:forEach var="option" items="${conditionMap }">
					<option value="${option.value }">${option.key }
				</c:forEach>
				</select>
				
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
		</div>
		</form>
		</nav>
			</td>
			
		</tr>
		
	</table>
	</div>
	
</div>
	
	<br>
	


</div>
</body>
</html>