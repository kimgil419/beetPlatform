
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--(실습) 스크립트릿, 표현식 사용하지 말고 EL, JSTL 사용 형태로 전환 --%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
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
<script>

//case1
$(document).on('click', 'a[href="#"]', function(e){
	e.preventDefault();
});

// case2
$('a[href="#"]').click(function(e) {
	e.preventDefault();
});
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
    	async: false,
        type:'POST',
        url : "<c:url value='/addComment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
    	async: false,
        type:'GET',
        url : "<c:url value='/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].comment + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                    
                    
                }
               
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
</script>
</head>
<body>
<div id="page-wrapper">
<jsp:include page="../menu.jsp"/>
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
			<img class="fancy"  style="display: ${(board.t_img == null) ? 'none':'' };" src ="${pageContext.request.contextPath}/image/${board.t_img}" width="500px;" height="350px;" alt="boardImage"> </div> <!-- $는 .equals는 반응하지 않는다 'null'은 안된다 -->
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





    <div>
  <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="board_content" placeholder="${com.board_content }"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="fn_comment('${board.seq}')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${board.seq}" />
        <input type="hidden" name="seq" value="${board.seq}">        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
    </div>






</div>
</body>
</html>