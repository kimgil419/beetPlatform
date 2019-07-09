<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트작성</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
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
		
		/* $("input[value='추가']").on("click", function(){
			var html = 
			 	'<tr>' +
				'<td>' +
				'<input type="button" id="pop" name="search_user_id" value="찾기" onclick="search()">' +
				'<input type="text" class="form_control" name="user_id">' +
				'<input type="text" class="form_control" name="user_name" readonly="readonly">' +
				'</td>' +
				'<td><input type="text" name="source_name"></td>' +
				'<td><select name="source_progress"><option value="예정">예정</option><option value="완료">완료</option><option value="보류">보류</option><option value="폐기">폐기</option></select></td>' +
				'</tr>';
			$("#tbody_func").append(html);
		}); */
		var counter = 0;

			$("#addrow").on("click", function () {
				var newRow = $("<tr>");
		        var cols = "";
		        cols += '<td><input type="button" id="pop" name="search_user_id" value="찾기" onclick="search()">' +
                		'<input type="text" class="form_control" name="user_id">' +
                		'<input type="text" class="form_control" name="user_name" readonly="readonly"></td>';
                cols += '<td><input type="text" name="source_name" class="form-control"></td>';
                cols += '<td><select name="source_progress">' +
                			'<option value="예정">예정</option>'+
                			'<option value="진행">진행</option>' +
                			'<option value="완료">완료</option>' +
                			'<option value="보류">보류</option>' +
                			'<option value="폐기">폐기</option>';
                cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="삭제"></td>';
		        newRow.append(cols);
		        $("table#function_table").append(newRow);
		        counter++;
		    });

		    $("table#function_table").on("click", ".ibtnDel", function (event) {
		        $(this).closest("tr").remove();       
		        counter -= 1
		    });
	});
	function calculateRow(row) {
	    var price = +row.find('input[name^="price"]').val();

	}

	function calculateGrandTotal() {
	    var grandTotal = 0;
	    $("table#function_table").find('input[name^="price"]').each(function () {
	        grandTotal += +$(this).val();
	    });
	    $("#grandtotal").text(grandTotal.toFixed(2));
	}
</script>
<style>

</style>
</head>
<body>
	<div id="page-wrapper">
	<jsp:include page="../menu.jsp"/>
		<form action="insertProject.do" method="post">
			<div class="container">
				<h4>프로젝트 작성</h4>
				<table class="table order-list">
					<tbody>
						<tr>
							<th>계약업체</th>
							<td><input type="text" name="project_contractor" class="form-control"></td>
						</tr>
						<tr>
							<th>계약기간</th>
							<td><input type="date" name="project_start_date"><input type="date" name="project_end_date"></td>
						</tr>
						<tr>
							<th>프로젝트명</th>
							<td><input type="text" name="project_name"></td>
						</tr>
						<tr>
							<th>계약금액</th>
							<td><input type="number" name="project_contract_amount"></td>
						</tr>
						<tr>
							<th>책임자</th>
							<td><input type="text" value="${userInfo.user_name }" readonly="readonly">
								<input type="hidden" name="project_manager" value="${userInfo.user_id}" }></td>
						</tr>
						<tr>
							<th>진행상태</th>
							<td>
								<select name="project_progress">
									<option value="예정">예정</option>
									<option value="진행">진행</option>
									<option value="완료">완료</option>
									<option value="보류">보류</option>
									<option value="폐기">폐기</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- remote ajax call이 되는영역 -->
				</div>
			</div>
		</div>
		<div class="container">
		    <table id="function_table" class=" table order-list">
			    <thead>
			        <tr>
			            <td>담당자</td>
			            <td>기능</td>
			            <td>진행상태</td>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td class="col-sm-">
			                <input type="button" id="pop" name="search_user_id" value="찾기" onclick="search()">
			                <input type="text" class="form_control" name="user_id">
			                <input type="text" class="form_control" name="user_name" readonly="readonly">
			            </td>
			            <td class="col-sm-">
			                <input type="text" name="source_name" class="form-control">
			            </td>
			            <td class="col-sm-">
			            	<select name="source_progress">
			            		<option value="예정">예정</option>
			            		<option value="진행">진행</option>
			            		<option value="완료">완료</option>
			            		<option valeu="보류">보류</option>
			            		<option value="폐기">폐기</option>
			            	</select>
			            </td>
			            <td class="col-sm-"><a class="deleteRow"></a>
			
			            </td>
			        </tr>
			    </tbody>
			    <tfoot>
			        <tr>
			            <td colspan="5" style="text-align: left;">
			                <input type="button" class="btn btn-lg btn-block " id="addrow" value="기능추가" />
			            </td>
			        </tr>
			        <tr>
			        </tr>
			    </tfoot>
			</table>
		</div>
	
			<div class="container">
				<input type="submit" value="등록">
				<input type="reset" value="재작성">
			</div>
		</form>
	</div>
</body>
</html>