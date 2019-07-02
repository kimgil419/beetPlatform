<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script>
	function in_commute(frm) {
		var result = confirm('출근 하시겠습니까?');

		if (result) {
			frm.action = "insertCommute.do"
			frm.submit();
		} else { //no 
		}
	};
	function out_commute(frm) {
		var result = confirm('퇴근 하시겠습니까?');

		if (result) {
			frm.action = "updateCommute.do"
			frm.submit();
		} else { //no 
		}
	};
</script>
</head>
<body>

	<form>
		<input type="text" name="user_id" value=" ${userInfo.user_id } "
			readonly="readonly"> <input type="text" name="user_name"
			value=" ${userInfo.user_name } 님 " readonly="readonly">

    <h1>메인화면입니다</h1>
     
    <a href="getApprovalList.do">전자결재(김길중)</a>
    <a href="getCommuteList.do">출결관리(김길중)</a>
    <a href="getProjectList.do?currentPage=1">프로젝트 관리(김동현)</a>
    <a href="getBoardList.do?curPage=1">게시판 (한재정) </a>
    <a 
    ${((userInfo.dept=='인사' && userInfo.user_position=='부장') || (userInfo.dept=='인사' && userInfo.user_position=='대표이사') || (userInfo.dept=='인사' && userInfo.user_position=='대리') || (userInfo.dept=='인사' && userInfo.user_position=='과장') || (userInfo.dept=='인사' && userInfo.user_position=='차장')) ? '' : 'hidden'} href="insertUser.do"> 사원등록 (한재정) </a>
    <a href="getMeetingRoomList.do">회의실예약(김범현)</a>
    <a href="showEmployee.do">사원검색(김범현)</a>
    <a href="showEachEmployee.do">마이페이지(김범현)</a>


		<p>
			<c:if test="${ccc == 'x' }">
				<input type="button" value="출근" onclick="in_commute(this.form)">
			</c:if>

			<c:if
				test="${ getCommute.user_id !='' and not empty getCommute.user_id }">
				<input type="button" value="퇴근" onclick="out_commute(this.form)">
			</c:if>
		</p>
	</form>
</body>
</html>