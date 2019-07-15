<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
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
	.border-none, .border-none td { border: none; }
</style>
<script>
function categoryChange() {
	var sel = $("#ss option:selected").val();
	var se = "";
	if (sel != "X"){
		
		$("#category").val(sel); 
	}
}

function send_go() {
	if (document.frm.t_title.value.trim() == "") {
		
		alert("제목을 입력안하셨습니다.\n입력하세요.");

		document.frm.t_title.focus();
		
		return false;
		
	} else if(document.frm.user_name.value.trim() == "") {
		alert("작성자를 입력안하셨습니다.\n입력하세요.");

		document.frm.user_name.focus();
		
		return false;
	} else if(document.frm.t_content.value.trim() == "") {
		alert("내용을 입력안하셨습니다.\n입력하세요.");

		document.frm.t_content.focus();
		
		return false;
	}else {
		frm.action = "insertBoard.do?curPage=${c2}";
		frm.submit();
	}
}

var result = '${bdmsg}';
var results = '${bdfsmsg}';
if(result == '공지') {
alert(result + '를 쓸 수 없는 권한입니다'); //아무 조건도 안걸면 계속 나온다 전달도 안된다
}else if(results == '본문'){
	alert(results + '태그를 선택해주세요');
}
</script>
</head>
<body>
<div id="page-wrapper">
<jsp:include page="../menu.jsp"/>
<div id="container">

	<h1>글등록</h1>
	<p><a href="logout.do">Log-out</a></p>
	<hr>
	<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<form method="post" name ="frm"
	        enctype="multipart/form-data">
	        
	    
		
		<div class="form-group">
		<label>제목</label>
		<input type="text" class="form-control"  name="t_title"  size="30">
		</div>
		<div class="form-group">
		<label>작성자</label>
		<input type="text" class="form-control"  name="user_name" value="${user_name }">
		</div>
		<div class="form-group">
		<label>본문</label>
		        <select class="form-control"  name="ss" id="ss" onchange="categoryChange()">
                    <option value="X">선택사항</option>
                    <option value="Y">공지사항</option>
                    <option value="N">일반글</option>      
                </select>
                <input type="hidden" name="t_noti" id="category">
        </div>
        <div class="form-group">    
        <label>내용</label>    
	     <textarea name="t_content" class="form-control"  rows="10" cols="40"></textarea>
	    </div>
	    <div class="form-group">
	    <label>업로드</label>
	    <input type="file" class="form-control"  name="t_imgs">
		
				
	    </div>

	
	</form>
	</div>
	</div>
	<hr>
	<input type="button" value="새글 등록" onclick="send_go()">
	<p><a href="getBoardList.do?curPage=${c2 }">글 목록 가기</a></p>

</div>
</div>
</body>
</html>





