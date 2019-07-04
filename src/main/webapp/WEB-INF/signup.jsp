<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>직원등록</title>

<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<!--  jQuery UI 라이브러리 js파일-->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script>
$(function() {
	var idck = 0;
	
	    //idck 버튼을 클릭했을 때 
	    $("#idck").click(function() {
	        
	        //userid 를 param.
	        var userid =  $("#user_id").val(); 
	        
	        $.ajax({
	            
	            type : 'POST',
	            data : userid,
	            url : "idcheck.do",
	            dataType : "json",
	      
	            success : function(data) {
	            	console.log(typeof data.cnt);
	                if (data.cnt > 0) {
	                    
	                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
	                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
	               
	                    $("#user_id").focus();
	                   
	                
	                } else {
	                    alert("사용가능한 아이디입니다.");
	                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
	                    $("#divInputId").addClass("has-success")
	                    $("#divInputId").removeClass("has-error")
	                    $("#userpwd").focus();
	                    //아이디가 중복하지 않으면  idck = 1 
	                    idck = 1;
	                    
	                }
	            }
	         
	        });
	    });
	
	  $( "#testDatepicker" ).datepicker({
	       changeYear: true,
	       changeMonth: true,
	       yearRange: '1960:2020',
	       dateFormat: 'yy-mm-dd'
	  });
	  $( "#testDatepicker1" ).datepicker({
	       changeYear: true,
	       changeMonth: true,
	       yearRange: '1960:2020',
	       dateFormat: 'yy-mm-dd'
	  });
	});
function categoryChange() {
	var sel = $("#ss option:selected").val();
	var se = "";
	if (sel != "X"){
		
		$("#category").val(sel); 
	}
}
</script>
</head>
<body>

<h1>성공입니다</h1>

	<form action="idcheck.do" method="post">
	<div id="divInputId" >
			<input type="text" name="user_id"  id="user_id">
			<input type="submit" value="아이디중복체크" id="idck">
			</div>
			</form>
	
	
	<form action="insertUser.do" method="post"
	        enctype="multipart/form-data">
	<table>

		<tr>
			<th>아이디</th>
			
			<td>
		
			<input type="text" name="user_id"  id="user_id">
			
			
			</td>
		
		</tr>
		  
		<tr>
			<th>패스워드</th>
			<td><input type="text" name="user_password"></td>
		</tr>
		<tr>
			<th>소속부서</th>
			<td><input type="text" name="dept"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" id="testDatepicker" name="birth"></td>
		</tr>
		<tr>
			<th>직무</th>
			<td><input type="text" name="job_id"></td>
		</tr>
		<tr>
			<th>입사날짜</th>
			<td><input type="text" id="testDatepicker1" name="firstjoin"></td>
		</tr>
		<tr>
			<th>퇴사날짜</th>
			<td><input type="text" id="testDatepicker" name="departure"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="user_name"></td>
		</tr>
		<tr>
			<th>직급</th>
			<td>
		        <select name="ss" id="ss" onchange="categoryChange()">
                    <option value="X">선택사항</option>
                    <option value="사원">사원</option>
                    <option value="주임">주임</option> 
                    <option value="대리">대리</option>
                    <option value="과장">과장</option>    
                    <option value="차장">차장</option>
                    <option value="부장">부장</option>    
                    <option value="이사">이사</option>   
                    <option value="대표이사">대표이사</option>      
                </select>
                <input type="hidden" name="user_position" id="category">
		    </td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<th>내선전화번호</th>
			<td><input type="text" name="cphone"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="user_email"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="user_addr"></td>
		</tr>
		<tr>
		    <th>첨부파일</th>
		    <td>
		        <input type="file" name="user_pictures">
		    </td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="직원등록">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>