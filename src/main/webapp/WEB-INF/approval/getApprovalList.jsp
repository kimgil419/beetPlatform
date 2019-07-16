<%@page import="com.beetoffice.approval.ApprovalDAO"%>
<%@page import="com.beetoffice.approval.ApprovalVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<!-- <link rel="stylesheet"
href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<style>
	
</style>
<script>

</script>
</head>
<body>
<div id="page-wrapper">
<jsp:include page="../menu.jsp"/>
	<div class="container">
<div style="width: 1050px">
	<h1>전자 결재 서류 목록</h1>
	
	
	
	<p>
	
	<button onclick="window.open('ApprovalForm.do','결재 문서 작성','width=1000, height=700, location=no, status=no, scrollbars=yes');"> 결재 문서 작성 </button>
	<button onclick="window.open('getApprovalListDone.do?currentPage=1','지난 문서 목록','width=1000, height=700, location=no, status=no, scrollbars=yes');"> 지난 문서 목록 </button>
	<button onclick="window.open('getApprovalListMy.do?currentPage=1','내가 쓴 문서 목록','width=1000, height=700, location=no, status=no, scrollbars=yes');"> 내가쓴 문서 목록 </button>
	
	</p>
	<table class="table table-hover">
		<tr>
		<th colspan="7">긴급결재서류</th>
		</tr>
		<tr>
			<th width="50">번호</th>
			<th width="200">제목</th>
			<th width="150">작성자</th>
			<th width="50">결재1</th>
			<th width="50">결재2</th>
			<th width="50">결재3</th>
			<th width="150">등록일</th>			
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
			<td>${approval.user_name}</td>
			<td>${approval.user_name1}</td>
			<td>${approval.user_name2}</td>
			<td>${approval.user_name3}</td>
			<td>${approval.regdate}</td>
		</tr>
		</c:if>
		</c:forEach>
		</table>
	
		<hr>
	<!-- 데이타 표시 -->
	<table class="table table-hover">
		
		<tr>
		
		<th colspan="7">직렬결재서류</th>
		</tr>
		<tr>
			<th width="50">번호</th>
			<th width="200">제목</th>
			<th width="150">작성자</th>
			<th width="50">결재1</th>
			<th width="50">결재2</th>
			<th width="50">결재3</th>
			<th width="150">등록일</th>			
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
			<td>${approval.user_name}</td>
			<td>${approval.user_name1}</td>
			<td>${approval.user_name2}</td>
			<td>${approval.user_name3}</td>
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
			<th width="50">번호</th>
			<th width="200">제목</th>
			<th width="150">작성자</th>
			<th width="50">결재1</th>
			<th width="50">결재2</th>
			<th width="50">결재3</th>
			<th width="150">등록일</th>			
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
			<td>${approval.user_name}</td>
			<td>${approval.user_name1}</td>
			<td>${approval.user_name2}</td>
			<td>${approval.user_name3}</td>
			<td>${approval.regdate}</td>
		</tr>
		</c:if>
		</c:forEach>
		</table>
		
		<hr>
		<table class="table">
		<tr>
		<th colspan="7">반려서류</th>
		</tr>
		<tr>
			<th width="50">번호</th>
			<th width="200">제목</th>
			<th width="150">작성자</th>
			<th width="50">결재1</th>
			<th width="50">결재2</th>
			<th width="50">결재3</th>
			<th width="150">등록일</th>			
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
			<td>${approval.user_name}</td>
			<td>${approval.user_name1}</td>
			<td>${approval.user_name2}</td>
			<td>${approval.user_name3}</td>
			<td>${approval.regdate}</td>
		</tr>
		</c:if>
		</c:forEach>
		</table>
		<hr>
	<br>
	
	<p><a href="getCommute.do">메인메뉴이동</a></p>
</div>
	</div>
</div>
</body>
</html>