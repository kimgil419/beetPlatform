
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 스크립트릿, 표현식 사용하지 말고 EL, JSTL 사용 형태로 전환 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<style>
.project-tab {
    padding: 10%;
    margin-top: -8%;
}
.project-tab #tabs{
    background: #007b5e;
    color: #eee;
}
.project-tab #tabs h6.section-title{
    color: #eee;
}
.project-tab #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #0062cc;
    background-color: transparent;
    border-color: transparent transparent #f3f3f3;
    border-bottom: 3px solid !important;
    font-size: 16px;
    font-weight: bold;
}
.project-tab .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: #0062cc;
    font-size: 16px;
    font-weight: 600;
}
.project-tab .nav-link:hover {
    border: none;
}
.project-tab .tt{
    background: #f3f3f3;
    color: #333;
}
.project-tab a{
    text-decoration: none;
    color: #333;
    font-weight: 600;
}
</style>
</head>
<body>
<div id="page-wrapper">
<jsp:include page="../menu.jsp"/>
<div class="container">
<div id="tabs" class="project-tab">
            
	<h1>글 상세</h1>
	<p><a href="logout.do">Log-out</a></p>
	<hr>
	<form action="updateBoard.do" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="seq" value="${board.seq}">
	<input type="hidden" name="curPage" value="${c3 }">
	<table class="table" cellspacing="0">
		<tr>
			<th class="tt">제목</th>
			<td><input type="text" name="t_title" 
						value="${board.t_title}">
			</td>
			
		</tr>
		<tr>
			<th class="tt">작성자</th>
			<td>${board.user_name }</td>
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
		<a href="insertBoardf.do?curPage=${c3 }">글쓰기</a>&nbsp;&nbsp;
		
		<a href="deleteBoard.do?seq=${board.seq }&curPage=${c3 }" ${(board.user_id == user_id) ? '':'hidden' }>글삭제</a>&nbsp;&nbsp;
		
		<a href="getBoardList.do?curPage=${c3 }">글목록</a>
	</p>
</div>
</div>
</div>
</body>
</html>