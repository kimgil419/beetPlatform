<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
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

.border-none, .border-none td {
	border: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
function loadRenderTemplate() {
    $.ajax({
       url: 'empSearch.html'
       , dataType: 'html'
       ,async : 'false'
          , success: function(templateData) {
        	$.templates({searchTmpl: templateData});
        	//employeeSearch();
          }
    });
};
function employeeSearch(){

	$.ajax({
		url: "/searchEmployeeForSelect.do", // 클라이언트가 요청을 보낼 서버의 URL 주소
        data: "keyword=''",                // HTTP 요청과 함께 서버로 보낼 데이터
		type: "POST",                             // HTTP 요청 방식(GET, POST)
		 dataType: "json",                         // 서버에서 보내줄 데이터의 타입
		success : function(data) {
			 var employeeData = data
			 var employeeData1 = [];
		
		 employeeData1= employeeData.filter(function(x){
				   return x.user_position ==="과장" ||x.user_position ==="부장"
			   });
			
			 $('#user_id1 option').remove();
			 $('#user_id2 option').remove();
			 $('#user_id3 option').remove();
			 console.log(employeeData1[0]);
	   for (var i = 0; i < employeeData1.length; i++) {
		 $('#user_id1').append("<option value=''>"+employeeData1[i].user_name +"</option>");
		 $('#user_id2').append("<option value=''>"+employeeData1[i].user_name +"</option>");
		 $('#user_id3').append("<option value=''>"+employeeData1[i].user_name +"</option>");
  		}
	      		console.log(employeeData);
				console.log(employeeData1);
		}

});
	
};

function  renderSearchTmpl(){
	  $("#empSearch").html($.render.searchTmpl(employeeData));
}


</script>
</head>
<body>

	<div id="container">
		<h1>글등록</h1>
		<p>
			<a href="logout.do">Log-out</a>
		</p>
		<hr>
		<form>
			<table>
				<tr>
					<td><input type="checkbox" name="urgent" value="1"> 긴급
					</td>
				</tr>

				<tr>
					<td width="140" id="empSearch">결재1 
					<select id="user_id1" name="user_id">
							<option value="1">1</option>
							<option value="2">2</option>
					</select>
						<input type="button" value="찾기" onclick="employeeSearch()"></input>
					</td>
					<td width="140" id="empSearch">결재1 
					<select id="user_id2" name="user_id">
							<option value="1">1</option>
							<option value="2">2</option>
					</select>
						<input type="button" value="찾기" onclick="employeeSearch()"></input>
					</td>

					<td width="140" id="empSearch">결재1 
					<select id="user_id3" name="user_id">
							<option value="1">1</option>
							<option value="2">2</option>
					</select>
						<input type="button" value="찾기" onclick="employeeSearch()"></input>
					</td>
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
					<td colspan="2">${userInfo.user_name }<input type="hidden"
						name="user_id" value="${userInfo.user_id}"></td>
				</tr>

				<tr>
					<th>내용</th>
					<td colspan="3"><textarea rows="10" cols="40" name="a_content"></textarea></td>
				</tr>

				<tr>
					<td colspan="2" class="center"><input type="submit"
						value="결재요청"></td>
				</tr>
			</table>
		</form>
		<p>
			<a href="getApprovalList.do">글 목록 가기</a>
		<p>
			<a href="Main.do">메인메뉴이동</a>
		</p>
		</p>
	</div>
</body>
</html>





