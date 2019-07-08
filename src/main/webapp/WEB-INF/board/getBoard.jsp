
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--(실습) 스크립트릿, 표현식 사용하지 말고 EL, JSTL 사용 형태로 전환 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
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
	.center { text-align: center; }
	.left { text-align: left; }
	.orange { background-color: orange; }
	
	.fancy{
	position:relative;
	display:inline-block;
	font-size:0;
	line-height:0;
}

.fancy:after{
	position:absolute;
	top:1px;
	left:1px;
	bottom:1px;
	right:1px;
	border:1px solid rgba(255,255,255,0.5);
	outline:1px solid rgba(0,0,0,0.2);
	content:" ";
}
</style>
</head>
<body>

<div id="container">
	<h1>글 상세</h1>
	<p><a href="logout.do">Log-out</a></p>
	<hr>
	<form action="updateBoardf.do" method="post">
	<input type="hidden" name="seq" value="${board.seq}">
	<input type="hidden" name="curPage" value="${c1 }">
	<table>
		<tr>
			<th width="70">제목</th>
			<td>${board.t_title}>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${user_name }</td>
		</tr>
		<tr>
			<th>내용</th>
			
			<td style="width: 700px; height: 500px;">
			<div style="border: 5px solid #A9F5A9; padding: 7px; display: ${(board.t_img == null) ? 'none':'' };" >
			<img class="fancy"  style="display: ${(board.t_img == null) ? 'none':'' };" src ="image/${board.t_img}" width="500px;" height="350px;" alt="boardImage"> </div> <!-- $는 .equals는 반응하지 않는다 'null'은 안된다 -->
					<p>
					${board.t_content}
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${board.t_regdate}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.cnt }</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" ${(board.user_id == user_id) ? '':'hidden' } value="글 수정">
			</td>
		</tr>
	</table>
	</form>
	<hr>
	<p>
		<a href="insertBoardf.do?curPage=${c1 }">글쓰기</a>&nbsp;&nbsp;
		
		<a href="deleteBoard.do?seq=${board.seq }&curPage=${c1 }" ${(board.user_id == user_id) ? '':'hidden' }>글삭제</a>&nbsp;&nbsp;
		
		<a href="getBoardList.do?curPage=${c1 }">글목록</a>
	</p>
</div>

<%--댓글 입력 폼 --%>
<form method="post" action="insertComment.do">
	<p>이름 : <input type="text" name="user_name" value="${user_name }"></p>
	<p>내용 : <textarea name="board_content" rows="4" cols="55"></textarea></p>
	<input type="submit" value="댓글저장">
	
	<input type="hidden" name="seq" value="${board.seq }">
	<input type="hidden" name="curPage" value="${c1 }">
</form>

<%--댓글 출력(동적 태그 작성) --%>
<hr>
댓글들
<hr>

<c:forEach var="com" items="${cm_list }">
<div class="comment">
	<form action="deleteComment.do" method="post">
		<p>이름 : ${com.user_name }</p>
		<p>날짜 : ${com.write_date }</p>
		<p>내용 : ${com.board_content }</p>
		<input type="submit" ${(com.user_id == user_id) ? '':'hidden' } value="댓글삭제">
		
		<input type="hidden" name="reply_seq" value="${com.reply_seq }">
		
		<input type="hidden" name="curPage" value="${c1 }">
		<%--삭제처리 후 게시글 상세페이지로 이동시 사용 --%>
		<input type="hidden" name="seq" value="${com.seq }">
	</form>
</div>
</c:forEach>

</body>
</html>