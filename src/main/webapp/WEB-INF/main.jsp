<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
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
<body>
<div id="page-wrapper">
<jsp:include page="menu.jsp"/>  
	

  

</div>
</body>
</html>