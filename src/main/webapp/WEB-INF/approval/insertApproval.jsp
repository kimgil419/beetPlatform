<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>결재 문서 작성</title>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="js/multiselect.min.js"></script>

<script>
	var employeeData;

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

	$(function() {

		$
				.ajax({
					url : "/searchEmployeeForSelect.do", // 클라이언트가 요청을 보낼 서버의 URL 주소
					data : "keyword=''", // HTTP 요청과 함께 서버로 보낼 데이터
					type : "POST", // HTTP 요청 방식(GET, POST)
					dataType : "json", // 서버에서 보내줄 데이터의 타입
					success : function(data) {

						employeeData = data;

						var employeeData1 = [];

						console.log(employeeData[0]);
						$('#multiselect option').remove();

						for (var i = 0; i < employeeData.length; i++) {
							$('#multiselect').append(
									"<option value="+employeeData[i].user_id+">"
											+ employeeData[i].user_name
											+ employeeData[i].user_position
											+ "</option>");

						}

						$('#approval_id_a').append(
								"<option value='' selected disabled hidden>"
										+ "선택하세요" + "</option>");
						for (var i = 0; i < employeeData.length; i++) {
							$('#approval_id_a').append(
									"<option value="+employeeData[i].user_id+">"
											+ employeeData[i].user_name
											+ employeeData[i].user_position
											+ "</option>");

						}

						$("#approval_id_a").change(function() {
											$('#approval_id_b option').remove()
											var id = ($("#approval_id_a option:selected").val());

											$('#approval_id_b').append(
													"<option value='' selected disabled hidden>"
															+ "선택하세요"
															+ "</option>");
											for (var i = 0; i < employeeData.length; i++) {

												if (employeeData[i].user_id != id) {

													$('#approval_id_b')
															.append(
																	"<option value="+employeeData[i].user_id+ ">"
																			+ employeeData[i].user_name
																			+ employeeData[i].user_position
																			+ "</option>");
												}

											}
											$("#approval_id_b").change(function() {
												$('#approval_id_c option').remove()
																var id2 = ($("#approval_id_b option:selected").val());
																var id1 = ($("#approval_id_a option:selected").val());

																$('#approval_id_c').append("<option value='' selected disabled hidden>"
																						+ "선택하세요"
																						+ "</option>");
																for (var i = 0; i < employeeData.length; i++) {
																	if (employeeData[i].user_id != id2 && employeeData[i].user_id != id1) {
																		$('#approval_id_c').append("<option value="+employeeData[i].user_id+ ">"
																								+ employeeData[i].user_name
																								+ employeeData[i].user_position
																								+ "</option>");
																	}

																}

															});
										});

					}
				});

	

		function renderSearchTmpl() {
			$("#empSearch").html($.render.searchTmpl(employeeData));
		}

		$(function() {

			$("#multiselect").change(function() {
				if ($("#multiselect option:selected ").length > 3) {
					$("#multiselect_rightSelected").prop("disabled", true);
					alert('You can select upto 3 options only')

					return false;
				} else {
					$("#multiselect_rightSelected").prop("disabled", false);
				}

				console.log($("#multiselect_to"));
				if ($("#multiselect_to option").length > 2) {
					$("#multiselect_rightSelected").prop("disabled", true);

					alert('You can select upto 3 options only');

				} else {
					$("#multiselect_rightSelected").prop("disabled", false);

				}
			});

			$("#textbox").click(
					function() {
						$("#multiselect_to").find("option:eq(0)").prop(
								"selected", true);
						$("#multiselect_to").find("option:eq(1)").prop(
								"selected", true);
						$("#multiselect_to").find("option:eq(2)").prop(
								"selected", true);
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
	});
	//세번째 p태그가 눌리면
	//세번째 p태그 사라지고, 두번째 p태그 나타나도록 처리
	if ( "${user_id}" == "" ) {
	 alert("잘못된 접근 다시 로그인 하세요");
	 location.href = "/";
 };
</script>
</head>
<body>
<div id="page-wrapper">

	<div class="container">
		<h1>결재 문서 등록</h1>
	
		<hr>
		<form action="insertApproval.do" method="post">
			<p>
				<input type="button" name="p" id="p" value=" 결재 방식 전환 ">
			</p>


			<table id="p2" >

				<tr>
					<td><input type="checkbox" name="urgent" value="1"> 긴급
					</td>
				</tr>

				<tr>
					<td width="140" id="empSearch">결재1 <select id="approval_id_a"
						name="approval_id_a">

					</select>
					</td>
					<td width="140" id="empSearch">결재2 <select id="approval_id_b"
						name="approval_id_b">
						<option value='' selected disabled >선택하세요 </option>
					</select></td>



					<td width="140" id="empSearch">결재3 <select id="approval_id_c"
						name="approval_id_c">
						<option value='' selected disabled >선택하세요 </option>
					</select></td>


				</tr>

			</table>
<br>
<br>
			<div class="row" id="p3">
				<div class="col-xs-5">
					<select name="from[]" id="multiselect" class="form-control"
						size="8" multiple="multiple">

					</select>
				</div>
				<div class="col-xs-2">

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
					<select name="to" id="multiselect_to" class="form-control" size="8"
						multiple="multiple">
					</select>
				</div>
			</div>




			<table class="table table-hover">
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
					<td colspan="3" id="textbox"><textarea rows="10" cols="40"
							name="a_content" id="textbox"></textarea></td>
				</tr>

				<tr>
					<td colspan="2" class="center"><input type="button"
						value="결재요청" onclick="submit()"></td>
				</tr>
			</table>
		</form>
		
		

	</div>
	</div>
</body>
   
</html>
