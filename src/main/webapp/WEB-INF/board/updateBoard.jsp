
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	th.tt { background-color: orange; }
	.center { text-align: center; }
	.left { text-align: left; }
	.orange { background-color: orange; }
</style>
</head>
<body>

<div id="container">
	<h1>글 상세</h1>
	<p><a href="logout.do">Log-out</a></p>
	<hr>
	<form action="updateBoard.do" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="seq" value="${board.seq}">
	<table>
		<tr>
			<th width="70" class="tt">제목</th>
			<td><input type="text" name="t_title" 
						value="${board.t_title}">
			</td>
		</tr>
		<tr>
			<th class="tt">작성자</th>
			<td>${user_name }</td>
		</tr>
		<tr>
			<th bgcolor="#A9F5A9">사용하던 이미지</th>
			<td><img class="fancy" src ="image/${board.t_img}" style="display: ${(board.t_img == null) ? 'none':'' };" width="500px;" height="350px;" alt="boardImage">
			</td>
		</tr>
		<tr>
			<th class="tt">내용</th>
			<td><textarea rows="10" cols="40" 
					name="t_content">${board.t_content}</textarea>
			</td>
		</tr>
		<tr>
			<th class="tt">등록일</th>
			<td>${board.t_regdate}</td>
		</tr>
		<tr>
			<th class="tt">조회수</th>
			<td>${board.cnt }</td>
		</tr>
		<tr>
		    <th bgcolor="#A9F5A9">바꿀이미지</th>
		    <td>
		        <input type="file" name="t_imgs">
		    </td>
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
		<a href="insertBoardf.do">글쓰기</a>&nbsp;&nbsp;
		
		<a href="deleteBoards.do?seq=${board.seq }" ${(board.user_id == user_id) ? '':'hidden' }>글삭제</a>&nbsp;&nbsp;
		
		<a href="getBoardList.do">글목록</a>
	</p>
</div>

</body>
</html>