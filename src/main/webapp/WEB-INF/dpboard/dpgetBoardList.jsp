
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
<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.border-none, .border-none td { border: none; }
	.center { text-align: center; }
	.left { text-align: left; }
	.right { text-align: right; }
	.orange { background-color: orange; }
	.notie { background-color: #808080; }
	
	/****** 페이지 표시 부분 스타일(시작) ********/
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
	.paging .disable {
		padding: 3px 7px;
		border: 1px solid silver;
		color: silver;
	}
	.paging .now {
		padding: 3px 7px;
		border: 1px solid #ff4aa5;
		background-color: #ff4aa5;
		color: white;
		font-weight: bold;
	}
	/****** 페이지 표시 부분 스타일(끝) ********/
</style>
<script>
var result = '${bdmsg}';
if(result == '비밀글') {
alert(result + '을 열람할 수 있는 권한이 아닙니다'); //아무 조건도 안걸면 계속 나온다 전달도 안된다
} 
</script>
</head>
<body>

<div id="cotainer">


	<!-- 검색을 위한 폼 -->
	<form action="dpgetBoardList.do?curPage=${pvo.nowPage }" method="POST">
	<h1>${dept} 부서 게시판</h1>
	<table class="border-none">
		<tr>
			<td>
				<!--  
				<select name="searchCondition">
					<option value="TITLE">제목
					<option value="CONTENT">내용
				</select>
				-->
				<select name="searchCondition">
				<c:forEach var="option" items="${conditionMap }">
					<option value="${option.value }">${option.key }
				</c:forEach>
				</select>
				
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	
	<!-- 데이타 표시 -->
	<table>
	<thead>
		<tr>
			
			<th width="200">제목</th>
			<th width="150">작성자</th>
			<th width="150">등록일</th>
			<th width="100">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${boardList }">
		<tr>
		
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>
				<img class="fancy"  style="display: ${(board.t_password == null) ? 'none':'' };" src ="image/icon_secret.gif" alt="titleImage"><a href="dpgetBoardInsert.do?seq=${board.seq }&curPage=${pvo.nowPage}&t_password=${board.t_password}">
					${board.t_title }
				</a>
			</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.user_name }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.t_regdate }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.cnt }</td>
		</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<ol class='paging'>
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : 첫번째 블록인 경우 --%>
					<c:when test="${pvo.beginPage == 1}">
						<li class="disable">이전으로</li>
					</c:when>
					<c:otherwise>
						<li><a href="dpgetBoardList.do?curPage=${pvo.beginPage - 1 }">이전으로</a></li>
					</c:otherwise>
				</c:choose>	
				
				<%--블록내에 표시할 페이지 반복처리(시작페이지~끝페이지) --%>
				<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${k == pvo.nowPage }">
						<li class="now">${k }</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="dpgetBoardList.do?curPage=${k }">${k }</a>
						</li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : endPage가 전체페이지수보다 크거나 같으면 --%>
					<c:when test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">다음으로</li>
					</c:when>
					<c:otherwise>
						<li><a href="dpgetBoardList.do?curPage=${pvo.endPage + 1 }">다음으로</a></li>
					</c:otherwise>
					
				</c:choose>
				</ol>
			</td>
			<td>
				<p><a href="dpinsertBoardf.do?curPage=${pvo.nowPage }">새글 등록</a></p>
			</td>
		</tr>
	</tfoot>	
	</table>
	<br>
	
</div>


</body>
</html>