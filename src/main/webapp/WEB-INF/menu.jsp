<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* 사이드바 래퍼 스타일 */
#page-wrapper {
	padding-left: 250px;
}

#sidebar-wrapper {
	position: fixed;
	width: 250px;
	height: 100%;
	margin-left: -250px;
	background:;
	overflow-x: hidden;
	overflow-y: auto;
}

#page-content-wrapper {
	width: 100%;
	padding: 20px;
}
/* 사이드바 스타일 */
.sidebar-nav {
	width: 250px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #999;
}

.sidebar-nav li a:hover {
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}
</style>
</head>
<body>






	<!-- 사이드바 -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#"><img
					src="image/K-074.png" width="100"></a></li>
			<li><a href="getApprovalList.do">전자결재(김길중)</a></li>
			<li><a href="getCommuteList.do">출결관리(김길중)</a></li>
			<li><a href="getProjectList.do?currentPage=1">프로젝트 관리(김동현)</a></li>
			<li><a href="getBoardList.do?curPage=1&li=original">사내게시판 (한재정) </a></li>
			<li><a href="dpgetBoardList.do?curPage=1&li=original">부서게시판 (한재정) </a></li>

			<li><a
				${((userInfo.dept=='인사' && userInfo.user_position=='부장') 
    || (userInfo.dept=='인사' && userInfo.user_position=='대표이사') 
    || (userInfo.dept=='인사' && userInfo.user_position=='대리') 
    || (userInfo.dept=='인사' && userInfo.user_position=='과장') 
    || (userInfo.dept=='인사' && userInfo.user_position=='차장')) ? '' : 'hidden'}
				href="finsertUser.do"> 사원등록 (한재정) </a></li>

			<li><a href="getMeetingRoomList.do">회의실예약(김범현)</a></li>
			<li><a href="showEmployee.do">사원검색(김범현)</a></li>
			<li><a href="showEachEmployee.do">마이페이지(김범현)</a></li>
		</ul>
	</div>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<h1>비트플랫폼 인트라넷</h1>
			</div>
			<div>
<form>
				<ul class="nav navbar-nav navbar-right">
					<li><input type="text" name="user_id"
						value=" ${userInfo.user_id } " readonly="readonly"> <input
						type="text" name="user_name" value=" ${userInfo.user_name } 님 "
						readonly="readonly">
	
			<c:if test="${ccc == 'x' }">
				<input type="button" value="출근" onclick="in_commute(this.form)">
			</c:if>

			<c:if
				test="${ getCommute.user_id !='' and not empty getCommute.user_id }">
				<input type="button" value="퇴근" onclick="out_commute(this.form)">
			</c:if>
						</li>
				</ul>
				</form>
			</div>
		</div>
	</nav>
</body>
</html>