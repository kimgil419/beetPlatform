
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
</style>
</head>
<body>

<div id="cotainer">


	<!-- 검색을 위한 폼 -->
	<form action="getBoardList.do" method="POST">
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
		<tr>
			
			<th width="200">제목</th>
			<th width="150">작성자</th>
			<th width="150">등록일</th>
			<th width="100">조회수</th>
		</tr>
		
		<c:forEach var="board" items="${boardList }">
		<tr>
		
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>
				<a href="getBoard.do?seq=${board.seq }">
					${board.t_title }
				</a>
			</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.user_name }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.t_regdate }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.cnt }</td>
		</tr>
		</c:forEach>
	</table>
	<br>
	<p><a href="insertBoard.jsp">새글 등록</a></p>
</div>


</body>
</html>