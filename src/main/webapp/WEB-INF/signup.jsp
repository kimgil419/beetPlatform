<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>직원등록</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<!--  jQuery UI 라이브러리 js파일-->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	                    $("#user_ids").val(userid);
	                    $("#user_password").focus();
	                    //아이디가 중복하지 않으면  idck = 1 
	                    idck = 1;
	                    
	                }
	            }
	         
	        });
	        return false; //ajax는 새로고침을 막아야 하기 때문에 이런식으로 코드를 쓰거나 idcheck.do부분의 버튼을 submit에서 button으로 바꿔야 한다
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
	  
	  $( "#testDatepicker2" ).datepicker({
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

function categoryChanged() {
	var sel = $("#ssd option:selected").val();
	var se = "";
	if (sel != "X"){
		
		$("#categoryd").val(sel); 
	}
	
}
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

function send_go(frm) {
	if (frm.user_id.value.trim() == "") {
		
		alert("아이디(ID)를 입력안하셨습니다.\n입력하세요.");
		frm.user_id.value = "";
		frm.user_id.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
		
	} else if(frm.user_password.value.trim() == "") {
		alert("비밀번호를 입력안하셨습니다.\n입력하세요.");
		frm.user_password.value = "";
		frm.user_password.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	} else if(frm.dept.value.trim() == "") {
		alert("소속부서를 입력안하셨습니다.\n입력하세요.");
		frm.dept.value = "";
		frm.dept.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	} else if(frm.birth.value.trim() == "") {
		alert("생년월일을 입력안하셨습니다.\n입력하세요.");
		frm.birth.value = "";
		frm.birth.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.job_id.value.trim() == "") {
		alert("직무를 입력안하셨습니다.\n입력하세요.");
		frm.job_id.value = "";
		frm.job_id.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.firstjoin.value.trim() == "") {
		alert("입사일을 입력안하셨습니다.\n입력하세요.");
		frm.firstjoin.value = "";
		frm.firstjoin.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.user_name.value.trim() == "") {
		alert("이름을 입력안하셨습니다.\n입력하세요.");
		frm.user_name.value = "";
		frm.user_name.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.user_position.value.trim() == "") {
		alert("직급을 입력안하셨습니다.\n입력하세요.");
		frm.user_position.value = "";
		frm.user_position.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.phone.value.trim() == "") {
		alert("전화번호를 입력안하셨습니다.\n입력하세요.");
		frm.phone.value = "";
		frm.phone.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.cphone.value.trim() == "") {
		alert("내선번호를 입력안하셨습니다.\n입력하세요.");
		frm.cphone.value = "";
		frm.cphone.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.user_email1.value.trim() == "") {
		alert("이메일용아이디를 입력안하셨습니다.\n입력하세요.");
		frm.user_email1.value = "";
		frm.user_email1.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.user_email2.value.trim() == "") {
		alert("이메일을 입력안하셨습니다.\n입력하세요.");
		frm.user_email2.value = "";
		frm.user_email2.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.addr1.value.trim() == "") {
		alert("우편번호를 입력안하셨습니다.\n입력하세요.");
		frm.addr1.value = "";
		frm.addr1.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.addr2.value.trim() == "") {
		alert("도로명 주소를 입력안하셨습니다.\n입력하세요.");
		frm.addr2.value = "";
		frm.addr2.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.addr3.value.trim() == "") {
		alert("상세주소를 입력안하셨습니다.\n입력하세요.");
		frm.addr3.value = "";
		frm.addr3.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}else if(frm.user_pictures.value.trim() == "") {
		alert("프로필사진을 업로드안하셨습니다.\n업로드하세요.");
		frm.user_pictures.value = "";
		frm.user_pictures.focus();
		
		frm.action = "redirect:signup";
		frm.submit();
	}
}
</script>
</head>
<body>
	<div id="page-wrapper" >
	<jsp:include page="menu.jsp" />

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
		
			<input type="text" name="user_id"  id="user_ids">
			
			
			</td>
		
		</tr>
		  
		<tr>
			<th>패스워드</th>
			<td><input type="text" name="user_password"></td>
		</tr>
		<tr>
			<th>소속부서</th>
			<td><select id="ssd" onchange="categoryChanged()">
                    <option value="X">선택사항</option>
                    <option value="사업">사업부</option>
                    <option value="해외사업">해외사업부</option> 
                    <option value="개발">개발부</option>
                    <option value="총무">총무부</option>    
                    <option value="인사">인사부</option>
                    <option value="시설관리">시설관리부</option>    
                    <option value="인재개발">인재개발부</option>   
                    <option value="회계">회계부</option>      
                </select><input type="hidden" name="dept"  id="categoryd"></td>
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
			<td><input type="text" id="testDatepicker2" name="departure"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="user_name"></td>
		</tr>
		<tr>
			<th>직급</th>
			<td>
		        <select id="ss" onchange="categoryChange()">
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
			<th>전화번호('-'없이 입력해주세요)</th>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<th>내선전화번호</th>
			<td><input type="text" name="cphone"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="user_email1">@<input type="text" name="user_email2"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><div class="form-group">                   
                <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
                                            <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
                </div>
                <div class="form-group">
                                            <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
                </div>
                <div class="form-group">
                                            <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
                </div>
        </td>
		</tr>
		<tr>
		    <th>프로필사진</th>
		    <td>
		        <input type="file" name="user_pictures">
		    </td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="직원등록" onclick="send_go(this.form)">
			</td>
		</tr>
	</table>
	</form>

</div>
</body>
</html>