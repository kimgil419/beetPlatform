
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
</style>
</head>
<body>

<div id="cotainer">
	<h1>출퇴근 기록</h1>
	<h3>[${userName }]님 환영합니다....<a href="logout.do">Log-out</a></h3>

	<!-- 검색을 위한 폼 -->
	<form action="getApprovalList.do" method="POST">
	<table class="border-none">
		<tr>
			<td>
				
				<select name="searchCondition">
				<c:forEach var="option" items="${conditionMap}">
					<option value="${option.value}">${option.key}
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
			<th width="100">사번</th>
			<th width="100">이름</th>
			<th width="200">출근</th>
			<th width="200">퇴근</th>
			<th width="50">직급</th>
			<th width="50">부서</th>
			<th width="50">직무</th>		
		</tr>
		
		<c:forEach var="commute" items="${commuteList}">
		
		<tr>
			<td class="center"> ${commute.user_id } </td>
			<td class="center">${commute.user_name}</td>
			<td class="center">${commute.in_time }</td>
			<td class="center">${commute.out_time }</td>
			<td class="center">${commute.user_position }</td>
			<td class="center">${commute.dept }</td>
			<td class="center">${commute.job_id }</td>
		</tr>
	
		</c:forEach>
	</table>
	<br>
	<p><a href="insertApproval.jsp">새글 등록</a></p>
</div>


</body>
</html>