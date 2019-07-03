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
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/multiselect.min.js"></script>
<script type="text/javascript">

	

	function loadRenderTemplate() {
		$.ajax({
			url : 'empSearch.html',
			dataType : 'html',
			async : 'false',
			success : function(templateData) {
				$.templates({
					searchTmpl : templateData
				});
				//employeeSearch();
			}
		});
	};
	function employeeSearch() {

		$.ajax({
			url : "/searchEmployeeForSelect.do", // 클라이언트가 요청을 보낼 서버의 URL 주소
			data : "keyword=''", // HTTP 요청과 함께 서버로 보낼 데이터
			type : "POST", // HTTP 요청 방식(GET, POST)
			dataType : "json", // 서버에서 보내줄 데이터의 타입
			success : function(data) {
				var employeeData = data
				var employeeData1 = [];

				console.log(employeeData[0]);
				$('#multiselect option').remove();
				for (var i = 0; i < employeeData.length; i++) {
					$('#multiselect').append(
							"<option value="+ employeeData[i].user_id + ">" + employeeData[i].user_name
									+ employeeData[i].user_position
									+ "</option>");

				}

				employeeData1 = employeeData.filter(function(x) {
					return x.user_position === "대리" || x.user_position === "주임"
				});

				$('#user_id1 option').remove();
				console.log(employeeData1[0]);
				for (var i = 0; i < employeeData1.length; i++) {
					$('#user_id1').append(
							"<option value="+ employeeData1[i].user_id+ ">" + employeeData1[i].user_name
									+ employeeData1[i].user_position
									+ "</option>");

				}
				employeeData1 = employeeData.filter(function(x) {
					return x.user_position === "과장" || x.user_position === "부장"
				});

				$('#user_id2 option').remove();
				console.log(employeeData1[0]);
				for (var i = 0; i < employeeData1.length; i++) {
					$('#user_id2').append(
							"<option value="+ employeeData1[i].user_id + ">" + employeeData1[i].user_name
									+ employeeData1[i].user_position
									+ "</option>");

				}

				employeeData1 = employeeData.filter(function(x) {
					return x.user_position === "차장"
							|| x.user_position === "대표이사"
							|| x.user_position === "이사"
				});

				$('#user_id3 option').remove();
				console.log(employeeData1[0]);
				for (var i = 0; i < employeeData1.length; i++) {
					$('#user_id3').append(
							"<option value="+ employeeData1[i].user_id + ">" + employeeData1[i].user_name
									+ employeeData1[i].user_position
									+ "</option>");

				}

			}

		});

	};
	
	function submit() {
		
	}

	function renderSearchTmpl() {
		$("#empSearch").html($.render.searchTmpl(employeeData));
	}

	$(function() {
	
		
		$("#multiselect").change(function() {
			if ($("#multiselect option:selected ").length > 3 ) {
				$("#multiselect_rightSelected").prop("disabled", true);
				alert('You can select upto 3 options only')
				
				return false;
			} else { $("#multiselect_rightSelected").prop("disabled", false); }
		

			console.log($("#multiselect_to"));
			if ($("#multiselect_to option").length > 2) {
				$("#multiselect_rightSelected").prop("disabled", true);
				alert('You can select upto 3 options only');
				return false;
			} else { $("#multiselect_rightSelected").prop("disabled", false); }
		});

		$('#multiselect').multiselect();

		$("#p3").hide();

		$("#p").click(function() {

			if ($("#p3").css("display") === "none") {
				$("#p2").hide();
				$("#p3").show();
			} else {
				$("#p3").hide();
				$("#p2").show();
			}

		});

	});
	

	//세번째 p태그가 눌리면
	//세번째 p태그 사라지고, 두번째 p태그 나타나도록 처리
</script>
</head>
<body>

	<div id="container">
		<h1>글등록</h1>
		<p>
			<a href="logout.do">Log-out</a>
		</p>
		<hr>
		<form action="insertApproval.do" method="post"> 
			<p>
				<input type="button" name="p" id="p" value=" 결재 방식 전환 ">
			</p>





			<table id="p2">

				<tr>
					<td><input type="checkbox" name="urgent" value="1"> 긴급
					</td>
				</tr>

				<tr>
					<td width="140" id="empSearch">결재1 <select id="user_id1"
						name="user_id1">
							<option value="1">1</option>
							<option value="2">2</option>
					</select> <input type="button" value="찾기" onclick="employeeSearch()"></input>
					</td>
					<td width="140" id="empSearch">결재2 <select id="user_id2"
						name="user_id2">
							<option value="1">1</option>
							<option value="2">2</option></select></td>
							
							

					<td width="140" id="empSearch">결재3 <select id="user_id3"
						name="user_id3">
							<option value="1">1</option>
							<option value="2">2</option></select></td>
							
							
				</tr>

			</table>

			<div class="row" id="p3">
				<div class="col-xs-5" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
					<select name="from[]" id="multiselect" class="form-control"
						size="8" multiple="multiple">
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
				</div>
				<div class="col-xs-2">
					<input type="button" value="찾기" onclick="employeeSearch()"></input>
					
					<button type="button" id="multiselect_rightSelected"
						class="btn btn-block">
						<i class="glyphicon glyphicon-chevron-right"></i>
					</button>
					<button type="button" id="multiselect_leftSelected"
						class="btn btn-block">
						<i class="glyphicon glyphicon-chevron-left"></i>
					</button>
					<button type="button" id="multiselect_leftAll"
						class="btn btn-block">
						<i class="glyphicon glyphicon-backward"></i>
					</button>
				</div>
				<div class="col-xs-5">
					<select name="to[]" id="multiselect_to" class="form-control"
						size="8" multiple="multiple">
					</select>
				</div>
			</div>




			<table>
				<tr>
					<th>제목</th>
					<td colspan="2"><input type="text" name="a_title"></td>
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
					<td colspan="2" class="center"><input type="button"
						value="결재요청" onclick="submit()"></td>
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





