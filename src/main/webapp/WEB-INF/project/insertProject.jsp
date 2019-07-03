<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트작성</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src='/js/jquery-3.4.1.min.js'></script>
<script>
	/* css를 적용할 수 없는 팝업. 모달 등의 방식으로 팝업창을 띄워야 한다.
	function searchEmployee() {
	    var popUrl = "searchEmployee.do";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"",popOption);
	}
	*/
	 
	function search() {
		$('div.modal').modal({
			remote : '/html/layer.html'
		});
	}
	
	$(document).ready(function() {
		 $("input[value='추가']").on("click", function(){
			var html = 
			 	'<tr>' +
				'<td>' +
				'<input type="button" id="pop" name="search_user_id" value="찾기" onclick="search()">' +
				'<input type="text" name="user_id">' +
				'<input type="text" name="user_name" readonly="readonly">' +
				'</td>' +
				'<td><input type="text" name="source_name"></td>' +
				'<td><select name="source_progress"><option value="예정">예정</option><option value="완료">완료</option><option value="보류">보류</option><option value="폐기">폐기</option></select></td>' +
				'</tr>';
			$("#tbody_func").append(html);
		});
	});
</script>
<style>

</style>
</head>
<body>
	<h3>프로젝트 작성</h3>
	<form action="insertProject.do" method="post">
		<div>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>계약업체</th>
						<td><input type="text" name="project_contractor"></td>
						<th>계약기간</th>
						<td><input type="date" name="project_start_date"><input type="date" name="project_end_date"></td>
					</tr>
					<tr>
						<th>프로젝트명</th>
						<td><input type="text" name="project_name"></td>
						<th>계약금액</th>
						<td><input type="number" name="project_contract_amount"></td>
					</tr>
					<tr>
						<th>책임자</th>
						<td><input type="text" value="${userInfo.user_name }" readonly="readonly">
							<input type="hidden" name="project_manager" value="${userInfo.user_id}" }></td>
						<th>진행상황</th>
						<td>
							<select name="project_progress">
								<option value="예정">예정</option>
								<option value="완료">완료</option>
								<option value="보류">보류</option>
								<option value="폐기">폐기</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<table class="table table-bordered">
				<tbody id="tbody_func">
					<tr>
						<td colspan="3">
							<input type="button" value="추가">
							<input type="button" value="삭제" onclick="deleteRow()">
						</td>
					</tr>
					<tr>
						<th>담당자</th>
						<th>기능</th>
						<th>진행상황</th>
					</tr>
					<tr>
						<td>
							<input type="button" id="pop" name="search_user_id" value="찾기" onclick="search()">
							<input type="text" name="user_id">
							<input type="text" name="user_name" readonly="readonly">
						</td>
						<td><input type="text" name="source_name"></td>
						<td>
							<select name="source_progress">
								<option value="예정">예정</option>
								<option value="완료">완료</option>
								<option value="보류">보류</option>
								<option value="폐기">폐기</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<input type="submit" value="등록">
			<input type="reset" value="재작성">
		</div>
	</form>

	<div class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- remote ajax call이 되는영역 -->
			</div>
		</div>
	</div>

</body>
</html>