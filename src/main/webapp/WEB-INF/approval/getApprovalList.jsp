<%@page import="com.beetoffice.approval.ApprovalDAO"%>
<%@page import="com.beetoffice.approval.ApprovalVO"%>
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
	<h1>전자 결재 서류 목록</h1>
	<h3>[${userName.user_name }]님 환영합니다....<a href="logout.do">Log-out</a></h3>

	<!-- 검색을 위한 폼 -->
	<form action="getApprovalList.do" method="POST">
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
			<th width="100">번호</th>
			<th width="200">제목</th>
			<th width="150">작성자</th>
			<th width="50">결재1</th>
			<th width="50">결재2</th>
			<th width="50">결재3</th>
			<th width="50">등록일</th>			
		</tr>
		
		<c:forEach var="approval" items="${approvalList}">
		
		<c:if test="${ (approval.user_id1 == userName.user_id and empty approval.ok1) 
		or (approval.user_id2 == userName.user_id and not empty approval.ok1 and empty approval.ok2) 
		or (approval.user_id3 == userName.user_id and not empty approval.ok1 and not empty approval.ok2 and empty approval.ok3)}" >
		
		<tr>
			<td class="center">${approval.a_num }</td>
			<td>
				<a href="getApproval.do?a_num=${approval.a_num }">
					${approval.a_title }
				</a>
			</td>
			<td>${approval.user_id}</td>
			<td>${approval.user_id1}</td>
			<td>${approval.user_id2}</td>
			<td>${approval.user_id3}</td>
			<td>${approval.regdate}</td>
		</tr>
		</c:if>
		</c:forEach>
		<tr>
		<th colspan="7">지난 서류</th>
		</tr>
			
		<c:forEach var="approval" items="${approvalList}">
		
		<c:if test="${ (approval.user_id1 == userName.user_id and not empty approval.ok1) 
		or (approval.user_id2 == userName.user_id and not empty approval.ok2) 
		or (approval.user_id3 == userName.user_id and not empty approval.ok3)}" >
		
		<tr>
			<td class="center">${approval.a_num }</td>
			<td>
				<a href="getApproval.do?a_num=${approval.a_num }">
					${approval.a_title }
				</a>
			</td>
			<td>${approval.user_id}</td>
			<td>${approval.user_id1}</td>
			<td>${approval.user_id2}</td>
			<td>${approval.user_id3}</td>
			<td>${approval.regdate}</td>
		</tr>
		</c:if>
		</c:forEach>
			
	</table>
	<br>
	<p><a href="ApprovalForm.do">새글 등록</a></p>
</div>


</body>
</html>