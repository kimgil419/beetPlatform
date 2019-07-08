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
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<style>
	S
</style>
</head>
<body>S

<div class="container">
	<h1>전자 결재 서류 목록</h1>
	<h3>[${userInfo.user_name }]님 환영합니다....<a href="logout.do">Log-out</a></h3>

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
	<table class="table table-hover">
		
		<tr>
		
		<th colspan="7">직렬결재서류</th>
		</tr>
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
		
		<c:if test="${(approval.option == 0 ) and (approval.user_id1 == userInfo.user_id and empty approval.ok1) 
		or (approval.user_id2 == userInfo.user_id and not empty approval.ok1 and empty approval.ok2) 
		or (approval.user_id3 == userInfo.user_id and not empty approval.ok1 and not empty approval.ok2 and empty approval.ok3)}" >
		
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
		<hr>
		<hr>
		<table class="table">
		
		<tr>
		<th colspan="7">병렬 결재 서류</th>
		</tr>	
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
		
		<c:if test="${ (approval.option == 1) and (approval.user_id1 == userInfo.user_id and empty approval.ok1) 
		or (approval.user_id2 == userInfo.user_id and empty approval.ok2) 
		or (approval.user_id3 == userInfo.user_id and empty approval.ok3)}" >
		
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
		<hr>
		<hr>
		<table class="table">
		<tr>
		<th colspan="7">반려서류</th>
		</tr>
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
		
		<c:if test="${(not empty approval.refuse) and (approval.user_id1 == userInfo.user_id and empty approval.ok1) 
		or (approval.user_id2 == userInfo.user_id and not empty approval.ok1 and empty approval.ok2) 
		or (approval.user_id3 == userInfo.user_id and not empty approval.ok1 and not empty approval.ok2 and empty approval.ok3)}" >
		
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
		<hr>
		<hr>
		<table class="table">
		<tr>
		<th colspan="7">긴급결재서류</th>
		</tr>
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
		
		<c:if test="${(not empty approval.urgent) and (approval.user_id1 == userInfo.user_id and empty approval.ok1) 
		or (approval.user_id2 == userInfo.user_id and not empty approval.ok1 and empty approval.ok2) 
		or (approval.user_id3 == userInfo.user_id and not empty approval.ok1 and not empty approval.ok2 and empty approval.ok3)}" >
		
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
		<hr>
		<hr>
		<table class="table">
		
		<tr>
		<th colspan="7">지난 서류</th>
		</tr>
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
		
		<c:if test="${ (approval.user_id1 == userInfo.user_id and not empty approval.ok1) 
		or (approval.user_id2 == userInfo.user_id and not empty approval.ok2) 
		or (approval.user_id3 == userInfo.user_id and not empty approval.ok3)}" >
		
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
		<hr>
		<hr>
		<table class="table">
		<tr>
		<th colspan="7">내가쓴 서류</th>
		</tr>
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
		
		<c:if test="${approval.user_id == userInfo.user_id}" >
		
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
	<p><a href="getCommute.do">메인메뉴이동</a></p>
</div>


</body>
</html>