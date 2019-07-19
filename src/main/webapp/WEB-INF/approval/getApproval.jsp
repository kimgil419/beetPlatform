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
<title>결재 문서</title>
<script src="//code.jquery.com/jquery.min.js"></script>



<script>
$(function(){
	
   
	$("#btn").on("click",function(frm){
		var txt = "";
		console.log(frm);
		$("#first_approval").val(txt); 
		$("#second_approval").val(txt); 
		$("#third_approval").val(txt); 
		
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

</style>
</head>
<body>
<div id="page-wrapper">
<jsp:include page="../menu.jsp"/>
   <div class="container">
   <div class="col-md-8">
      <h1>결재</h1>
      <hr>
      <form id="sub" action="updateApproval.do" method="post">

         <table style="position: absolute; right: 30px;">

            <tr>
               <td width="70" height="70" style="border: solid 1px black; text-align: center;">
               ${approval.user_name1} <c:if
                     test="${not empty approval.first_approval  }">
                     <img
                        src="https://st2.depositphotos.com/2274151/6340/i/950/depositphotos_63409211-stock-photo-completed-red-vintage-isolated-seal.jpg"
                        width="70px">
                  </c:if></td>

               <td width="70" height="70" style="border: solid 1px black; text-align: center;">
                 ${approval.user_name2}
               <c:if
                     test="${not empty approval.second_approval }">
                     <img
                        src="https://st2.depositphotos.com/2274151/6340/i/950/depositphotos_63409211-stock-photo-completed-red-vintage-isolated-seal.jpg"
                        width="70px">

                  </c:if></td>

               <td width="70" height="70" style="border: solid 1px black; text-align: center;">
                 ${approval.user_name3}
               <c:if
                     test="${not empty approval.third_approval }">
                     <img
                        src="https://st2.depositphotos.com/2274151/6340/i/950/depositphotos_63409211-stock-photo-completed-red-vintage-isolated-seal.jpg"
                        width="70px">

                  </c:if></td>
            </tr>
   </table>
   <br>
<br>
<br>
<br>
      
         <table class="table">
            <tr>
               <th style="width: 100px">제목</th>
               <td colspan="2"><input type="text" name="a_title"
                  value="${approval.a_title}"></td>
            </tr>
            <tr>
               <th>작성자</th>
               <td colspan="2">${approval.user_id }</td>
            </tr>

            <tr>
               <th>내용</th>
               <td colspan="2"><textarea rows="10" cols="40" name="a_content" style="width: 600px; height: 500px;">${approval.a_content}</textarea>
               </td>
            </tr>
            <tr>
               <th>등록일</th>
               <td>${approval.regdate}</td>
               <c:if test="${approval.user_id1 == userInfo.user_id }">
                  <input type="hidden" name="first_approval" id="first_approval" value="1">
               </c:if>

               <c:if test="${approval.user_id2 == userInfo.user_id }">
                  <input type="hidden" name="second_approval" id="second_approval" value="1">
               </c:if>

               <c:if test="${approval.user_id3 == userInfo.user_id }">
                  <input type="hidden" name="third_approval" id="third_approval" value="1">
               </c:if>
            </tr>


            <tr>
            <td colspan="2" class="center">
            <c:if
							test="${ (not empty approval.first_approval or not empty approval.second_approval or not approval.third_approval)
             and (approval.user_id1 == userInfo.user_id or approval.user_id2 == userInfo.user_id or approval.user_id3 == userInfo.user_id  ) }">
							<input type="submit" value="결재">
						</c:if> <input type="button" value="반려" onclick="refuse(this.form)">
                  
                   <c:if test="${(approval.user_id1 == userInfo.user_id and not empty approval.first_approval)
                    or (approval.user_id2 == userInfo.user_id and not empty approval.second_approval)
                     or (approval.user_id3 == userInfo.user_id and not empty approval.third_approval)}">
                  
                   <input type="button" value="결재 취소" id="btn">
                   </c:if>
                   
            </tr>
            
         </table>

      </form>
      <hr>
      <p>
         

         <a href="getApprovalList.do">전자 결재 목록</a>
     
   </div>
   </div>
</div>
</body>

</html>