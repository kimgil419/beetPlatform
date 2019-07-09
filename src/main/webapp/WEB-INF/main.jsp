<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
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
        
        

        }
    </script>
<style>
.video-item img {
	max-width: 64px;
}

.video-detail .details {
	margin-top: 10px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.list-group-item {
	cursor: pointer;
}

.list-group-item:hover {
	background-color: #eee;
}

#board2 {
height: 200px;
overflow: hidden;
}

	
	.notie { background-color: #808080; }
</style>
<body>

	<div id="page-wrapper" >
	
		<jsp:include page="menu.jsp" />
		
		<div id="board1" class="col-md-4" >
		<div id="board2" >
			<table class="table table-hover">

				<tr>

					<th colspan="7">직렬결재서류</th>
				</tr>
				<tr>
					<th width="50">번호</th>
					<th width="100">제목</th>
					<th width="80">작성자</th>
					<th width="90">등록일</th>
				</tr>
				<c:forEach var="approval" items="${approvalList}" >

					<c:if
						test="${(approval.option == 0 ) and (approval.user_id1 == userInfo.user_id and empty approval.ok1) 
		or (approval.user_id2 == userInfo.user_id and not empty approval.ok1 and empty approval.ok2) 
		or (approval.user_id3 == userInfo.user_id and not empty approval.ok1 and not empty approval.ok2 and empty approval.ok3)}">

						<tr>
							<td class="center">${approval.a_num }</td>
							<td><a href="getApproval.do?a_num=${approval.a_num }">
									${approval.a_title } </a></td>
							<td>${approval.user_name}</td>
							<td>${approval.regdate}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			</div>
			<div id="board2" >
			
			<table class="table table-hover">
				<tr>

					<th colspan="7">병렬결재서류</th>
				</tr>
				<tr>
					<th width="50">번호</th>
					<th width="100">제목</th>
					<th width="80">작성자</th>
					<th width="90">등록일</th>
				</tr>
				<c:forEach var="approval" items="${approvalList}" >

					<c:if
						test="${ (approval.option == 1 ) and (approval.user_id1 == userInfo.user_id and empty approval.ok1) 
		or (approval.option == 1 ) and  (approval.user_id2 == userInfo.user_id and empty approval.ok2) 
		or (approval.option == 1 ) and  (approval.user_id3 == userInfo.user_id and empty approval.ok3)}">
						<tr>
							<td class="center">${approval.a_num }</td>
							<td><a href="getApproval.do?a_num=${approval.a_num }">
									${approval.a_title } </a></td>
							<td>${approval.user_name}</td>
							<td>${approval.regdate}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			</div>

		</div>
		
		
		<div id="board1"  class="col-md-4">
		<form name="frm" method="post" action="getBoardList.do?curPage=1&li=original">
		
		<table class="table table-hover" > 
        <tr>

					<th colspan="3">사내전체게시판</th><th><input type="submit" value="더보기" onclick="send_go()"></th>
		</tr>
		<tr>
			
			<th width="150">제목</th>
			<th width="80">작성자</th>
			<th width="100">등록일</th>
			<th width="50">조회수</th>
		</tr>


		<c:forEach var="board" items="${BdList }">
		<tr>
		
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>
				<a href="getBoardInsert.do?seq=${board.seq }&curPage=1">
					${board.t_title }
				</a>
			</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.user_name }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.t_regdate }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.cnt }</td>
		</tr>
		</c:forEach>

	
    </table>
    </form>
    <form name="frmmm" method="post" action="dpgetBoardList.do?curPage=1&li=original">
    <table class="table table-hover">
	<thead>
	    <tr>

					<th colspan="3">부서게시판</th><th><input type="submit" value="더보기" ></th>
		</tr>
		<tr>
			
			<th width="150">제목</th>
			<th width="80">작성자</th>
			<th width="100">등록일</th>
			<th width="50">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${DpboardList }">
		<tr>
		
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>
				<img class="fancy"  style="display: ${(board.t_password == null) ? 'none':'' };" src ="image/icon_secret.gif" alt="titleImage"><a href="dpgetBoardInsert.do?seq=${board.seq }&curPage=1&t_password=${board.t_password}">
					${board.t_title }
				</a>
			</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.user_name }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.t_regdate }</td>
			<td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.cnt }</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	
	</form>
	</div>
	
	<div id="root" class="col-md-8"></div>
	<script src="/js/youtube-bundle.js"></script>
	
	</div>
</body>
</html>