<%@page import="com.beetoffice.approval.ApprovalDAO"%>
<%@page import="com.beetoffice.approval.ApprovalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--(실습) 스크립트릿, 표현식 사용하지 말고 EL, JSTL 사용 형태로 전환 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<!-- jQuery import 방식2 : CDN -->
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script>
$(function(){
	
   
	$("#btn").on("click",function(frm){
		var txt = "";
		console.log(frm);
		$("#ok1").val(txt); 
		$("#ok2").val(txt); 
		$("#ok3").val(txt); 
		
		$("#sub").submit();
		
	})
  });
function refuse(frm){
	var result = confirm('Are you sure you want to do this?');
	
	if(result) {
	frm.action="refuseApproval.do"
	frm.submit();
	} else { //no 
		}
};
</script>

<style>
#container {
   width: 700px;
   margin: 0 auto;
}
h1, h3, p {
   text-align: center;
}
table {
   border-collapse: collapse;
}
table, th, td {
   border: 1px solid black;
   margin: 0 auto;
}
th {
   background-color: orange;
}
.center {
   text-align: center;
}
.left {
   text-align: left;
}
.orange {
   background-color: orange;
}
</style>
</head>
<body>

   <div id="container">
      <h1>결재</h1>
      <p>
         <a href="logout.do">Log-out</a>
      </p>
      <hr>
      <form id="sub" action="updateApproval.do" method="post">

         <table>

            <tr>
               <td width="70" height="70"><c:if
                     test="${not empty approval.ok1  }">
                     <img
                        src="https://st2.depositphotos.com/2274151/6340/i/950/depositphotos_63409211-stock-photo-completed-red-vintage-isolated-seal.jpg"
                        width="70px">
                  </c:if></td>

               <td width="70" height="70"><c:if
                     test="${not empty approval.ok2 }">
                     <img
                        src="https://st2.depositphotos.com/2274151/6340/i/950/depositphotos_63409211-stock-photo-completed-red-vintage-isolated-seal.jpg"
                        width="70px">

                  </c:if></td>

               <td width="70" height="70"><c:if
                     test="${not empty approval.ok3 }">
                     <img
                        src="https://st2.depositphotos.com/2274151/6340/i/950/depositphotos_63409211-stock-photo-completed-red-vintage-isolated-seal.jpg"
                        width="70px">

                  </c:if></td>
            </tr>

         </table>
         <table>
            <tr>
               <th>제목</th>
               <td colspan="2"><input type="text" name="a_title"
                  value="${approval.a_title}"></td>
            </tr>
            <tr>
               <th>작성자</th>
               <td colspan="2">${approval.user_id }</td>
            </tr>

            <tr>
               <th>내용</th>
               <td colspan="3"><textarea rows="10" cols="40" name="a_content">${approval.a_content}</textarea>
               </td>
            </tr>
            <tr>
               <th>등록일</th>
               <td>${approval.regdate}</td>
               <c:if test="${approval.user_id1 == userName.user_id }">
                  <input type="hidden" name="ok1" id="ok1" value="1">
               </c:if>

               <c:if test="${approval.user_id2 == userName.user_id }">
                  <input type="hidden" name="ok2" id="ok2" value="1">
               </c:if>

               <c:if test="${approval.user_id3 == userName.user_id }">
                  <input type="hidden" name="ok3" id="ok3" value="1">
               </c:if>
            </tr>


            <tr>
            <td colspan="2" class="center">
            <c:if test="${ not empty approval.ok1 or not empty approval.ok2 or not approval.ok3}" >
               <input type="submit" value="결재">
               </c:if>
               
                  <input type="button" value="반려" onclick="refuse(this.form)">
                  
                   <c:if test="${(approval.user_id1 == userName.user_id and not empty approval.ok1)
                    or (approval.user_id2 == userName.user_id and not empty approval.ok2)
                     or (approval.user_id3 == userName.user_id and not empty approval.ok3)}">
                  
                   <input type="button" value="결재 취소" id="btn">
                   </c:if>
                   
            </tr>
            
         </table>

      </form>
      <hr>
      <p>
         <a href="insertApproval.do">글쓰기</a>&nbsp;&nbsp; <a
            href="deleteApproval.do?a_num=${approval.a_num}">글삭제</a>&nbsp;&nbsp;
         <a href="getApprovalList.do">글목록</a>
         <p><a href="Main.do">메인메뉴이동</a></p>
      </p>
   </div>

</body>

</html>