<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트작성</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<link href="/css/project_common.css" rel="stylesheet" type="text/css" />
<script>
	var employeeList = ${employeeList};
	var counter = 0;
	var countRow = 0;
	var index = 0;
	
	$(document).ready(function() {
		$("#addrow").on("click", function () {
			var newRow = $("<tr>");
	        var cols = "";
	        cols += 
	        		'<td class="col-sm-">' +
	        		'<button type="button" id="searchButton" class="searchButton' + index + '" value="' + index + '"data-toggle="modal" data-target="#exampleModal" onclick="selectEmployee(' + index + ')">' +
	       		 	'<i class="fas fa-search-plus"></i></button>' +
            		'<input type="text" id="employee_id' + index + '" name="user_id">' +
            		'<input type="text" id="employee_name' + index + '" name="user_name" readonly="readonly"></td>';
            cols += '<td class="col-sm-"><input type="text" name="source_name">' +
            		'<input type="hidden" name="source_idx" value="-1">' +
            		'</td>'
            cols += '<td class="col-sm-"><select name="source_progress">' +
            			'<option value="예정">예정</option>' +
            			'<option value="진행">진행</option>' +
            			'<option value="완료">완료</option>' +
            			'<option value="보류">보류</option>' +
            			'<option value="폐기">폐기</option>';
            cols += '<td><button type="button" class="ibtnDel"><i class="fas fa-eraser"></i></button></td>';
	        newRow.append(cols);
	        $("table#function_table").append(newRow);
	        counter++;
	        index++;
	    });

	    $("table#function_table").on("click", ".ibtnDel", function (event) {
	        $(this).closest("tr").remove();
	        counter -= 1
	    });

	    $(document).on("click", '.selectName', function(e){
	    	const name = $(e.target).text();
	    	const id = $(e.target).parent().prev().prev().text();
	    	const idx = $(e.target).parent().prev().prev().prev().text();
	    	$('#employee_id' + idx).val(id);
	    	$('#employee_name' + idx).val(name);
	    });
		
	});
	
	function selectEmployee(index){
		$("#here").empty();
		const number = index;
		var idx = 0;
		employeeList.forEach(function (item){
			const string =
				"<tr class='selectedList'>" +
				"<td>" +
				"</td>" +
				"<td style='width:70px; padding-top:10px;display:none; class='selectIdx'>" + index + "</td>" +
				"<td style='width:70px; padding-top:10px;display:none; class='selectId'>" + item.user_id + "</td>" +
				"<td style='width:100px; padding-top:10px;'>" + item.user_position + "</td>" +
				"<td style='width:100px; padding-top:10px;'><a href='#' id='" + item.user_name + "' class='selectName' value='sss'>" + item.user_name + "</a></td>" +
				"<td style='width:100px; padding-top:10px;'>" + item.dept + "</td>" +
				"</tr>";
			$("#here").append(string);
		});
		idx++;
	};
	
	function calculateRow(row) {
	    var price = +row.find('input[name^="price"]').val();
	}
	
	function calculateGrandTotal() {
	    var grandTotal = 3;
	    $("table#function_table").find('input[name^="price"]').each(function () {
	        grandTotal += +$(this).val();
	    });
	    $("#grandtotal").text(grandTotal.toFixed(2));
	}
	
	function insertProject(frm) {
		if(frm.project_name.value.trim()=="") {
			alert("프로젝트이름을 입력해주세요.");
			frm.project_name.value="";
			frm.project_name.focus();
			return false;
		}
		if(frm.project_contractor.value.trim()=="") {
			alert("계약업체를 입력해주세요.");
			frm.project_contractor.value="";
			frm.project_contractor.focus();
			return false;
		}
		if(frm.project_contract_amount.value=="") {
			alert("계약금액을 입력해주세요.");
			frm.project_contract_amount.value="";
			frm.project_contract_amount.focus();
			return false;
		}
		if(frm.project_start_date.value=="") {
			alert("시작일을 입력해주세요.");
			frm.project_start_date.focus();
			return false;
		}
		if(frm.project_end_date.value.trim()=="") {
			alert("종료일을 입력해주세요.");
			frm.project_end_date.focus();
			return false;
		}
		if(frm.project_start_date.value >= frm.project_end_date.value) {
			alert("시작일이 종료일과 같거나 늦습니다.");
			frm.project_start_date.focus();
			return false;
		}
		if(frm.project_contract_amount.value <= 0) {
			alert("계약금액을 제대로 입력해주세요.");
			frm.project_name.value="";
			frm.project_contract_amount.focus();
			return false;
		}
		if(frm.user_id.value=="") {
			alert("기능담당자를 입력하세요.");
			return false;
		}
		if(frm.source_name.value=="") {
			alert("기능명을 입력하세요.");
			frm.source_name.focus();
			return false;
		}
 		frm.action="insertProject.do";
		frm.submit();
	}
</script>
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="../menu.jsp" />
		<div class="container">
			<form method="post">
				<h4>
					<i class="fas fa-arrow-circle-down"></i>
					<small class="text-muted">프로젝트작성</small>
				</h4>
				<div>
					<table class="table order-bordered">
						<tbody>
							<tr>
								<th>프로젝트명</th>
								<td><input type="text" name="project_name"></td>
							</tr>
							<tr>
								<th>계약업체</th>
								<td><input type="text" name="project_contractor"></td>
							</tr>
							<tr>
								<th>계약금액</th>
								<td><input type="number" name="project_contract_amount"></td>
							</tr>
							<tr>
								<th>계약기간</th>
								<td><input type="date" name="project_start_date"><input
									type="date" name="project_end_date"></td>
							</tr>
							<tr>
								<th>책임자</th>
								<td><input type="text" value="${userInfo.user_name }"
									readonly="readonly"> <input type="hidden"
									name="project_manager" value="${userInfo.user_id}"}></td>
							</tr>
							<tr>
								<th>진행상태</th>
								<td><select name="project_progress">
										<option value="예정">예정</option>
										<option value="진행">진행</option>
										<option value="완료">완료</option>
										<option value="보류">보류</option>
										<option value="폐기">폐기</option>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<table id="function_table" class="table table-bordered">
						<thead>
							<tr>
								<th>담당자</th>
								<th>기능</th>
								<th>진행상태</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr style="display: none;">
								<td><input type="text" name="source_idx" value="-9">
									<input type="text" name="user_id" value="-9">
									<input type="text" name="source_name" value="array_dummy">
									<input type="text" name="source_progress" value="array_dummy">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div></div>
				<div class="flex_div">
					<div id="flex_div_children1">
						<a><button type="button" class="btn btn-outline-primary btn-sm" onclick="insertProject(this.form);">등록</button></a>
						<a><button type="reset" class="btn btn-outline-primary btn-sm">재작성</button></a>
					</div>
					<div id="flex_div_children2">
						<button type="button" id="addrow"><i class="fas fa-folder-plus fa-lg"></i></button>
					</div>
					<div id="flex_div_children3">
						<a href="getProjectList.do"><button type="button" class="btn btn-outline-primary btn-sm">목록</button></a>
						<a href="getCommute.do"><button type="button" class="btn btn-outline-primary btn-sm">메인</button></a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container" style="max-width: 500px;">
					<div class="float:right;">
						<input type="text" name="search" id="searchBar" style="border: none; width: 130px;" placeholder="search keyword...">
						<div style="padding-top: 4px; display: inline-block;" onclick="">
							<i class="fas fa-search" style="color: lightgrey;"></i>
						</div>
					</div>
				</div>
				<div id="here"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>