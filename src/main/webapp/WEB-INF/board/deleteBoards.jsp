
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 스크립트릿, 표현식 사용하지 말고 EL, JSTL 사용 형태로 전환 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제_비밀번호 확인 구간</title>
<script>
var result = '${dlmsg}';
if(result == '비밀번호') {
alert(result + '가 틀리셨습니다 인사과에 문의해주세요'); //아무 조건도 안걸면 계속 나온다 전달도 안된다
}
</script>
</head>
<body>
<form action="deleteBoard.do?seq=${board.seq }" method="post">
<input type="text" name="password">
<input type="text" name="curPage" value="${cc }">	
		
		
		<input type="submit" value="글삭제" >
</form>

</body>
</html>