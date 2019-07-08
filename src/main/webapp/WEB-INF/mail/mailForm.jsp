<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='<c:url value="/css/bootstrap.min.css" />' rel="stylesheet">
<link href='<c:url value="/css/kfonts2.css" />' rel="stylesheet">
<script src='<c:url value="/jquery/jquery-1.11.3.min.js" />'></script>
<script src='<c:url value="/js/bootstrap.min.js"  />'></script>

<title>메일 보내기</title>
</head>
<body>
	<div class="container">
		<h4>메일 보내기</h4>
		<form action="${pageContext.request.contextPath}/mail/mailSending" method="post">
			<div align="center">
				<input type="text" name="setFrom" size="120" style="width: 100%"
					placeholder="나의 이메일(개인정보로 불러오면 될듯)" class="form-control">
			</div>
			<div align="center">
				<input type="text" name="tomail" size="120" style="width: 100%"
					placeholder="상대의 이메일" class="form-control">
			</div>
			<div align="center">
				<input type="text" name="title" size="120" style="width: 100%"
					placeholder="제목을 입력해주세요" class="form-control">
			</div>
			<p>
			<div align="center">
				<textarea name="content" cols="120" rows="12"
					style="width: 100%; resize: none" placeholder="내용#"
					class="form-control"></textarea>
			</div>
			<p>
			<div align="center">
				<input type="submit" value="메일 보내기" class="btn btn-warning">
			</div>
		</form>
	</div>
</body>
</html>
