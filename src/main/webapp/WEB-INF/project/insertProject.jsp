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
<script src="https://kit.fontawesome.com/9c3276f165.js"></script>

<!-- <script src="/js/pagination.min.js"></script> -->
<!-- <link href="css/pagination.css" rel='stylesheet'/> -->
<!-- <script src="/js/selectEmployee.js"></script> -->
<!-- <script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js" data-auto-replace-svg="nest"></script> -->

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
	        		'<button type="button" class="btn btn-primary searchButton' + index + '" value="' + index + '"data-toggle="modal" data-target="#exampleModal" onclick="selectEmployee(' + index + ')">' +
	       		 	'<i class="fas fa-search-plus"></i></button>' +
            		'<input type="text" class="employee_id' + index + '" name="user_id">' +
            		'<input type="text" class="employee_name' + index + '" name="user_name" readonly="readonly"></td>';
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
	        console.log(index);
	    });

	    $("table#function_table").on("click", ".ibtnDel", function (event) {
	    	console.log($('#function_table'));
	        $(this).closest("tr").remove();
	        console.log($(this));
	        counter -= 1
	    });
	    
	    
	    $(document).on("click", $('.searchButton'), function(){
	    	$('.searchButton').next().addClass(countRow);
	    	$('.searchButton').next().next().addClass(countRow);
	    });
	    
	    /* $(document).on("click", $('.selectName---'), function(){
	    	var id = $(this).closest('td').prev().text();
	    	var name = $(this).text();
	    	console.log('id:' + id);
	    	console.log('name: ' + name);
	    	console.log($('.searchButton0').val());
	    	console.log($('.employee_id0').val());
	    	console.log($('.employee_name0'));
	    }); */
	});
	function selectEmployee(index){
		$("#here").empty();
		employeeList.forEach(function (item){
			const img = item.user_picture;
			const string =
				"<tr class='selectedList'>" +
				"<td>" +
				`<img style="width:24px;height:"32px;" src="image/${img}" alt="프로필 사진">` +
				"</td>" +
				"<td style='padding-top:10px;display:none;'>" + item.user_id + "</td>" +
				"<td style='padding-top:10px;'><a href='#' class='selectName'>" + item.user_name + "</a></td>" +
				"<td style='padding-top:10px;'>" + item.user_position + "</td>" +
				"<td style='padding-top:10px;'>" + item.dept + "</td>" +
				"</tr>" +
				"<input type='text' class='transmit' value='dddddddddd'>";
			$("#here").append(string);
		});
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
		frm.action="insertProject.do";
		frm.submit();
	}
</script>
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="../menu.jsp" />
		<div class="container" style="margin-top: 30px;">
			<form method="post">
				<h5>프로젝트작성</h5>
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
									<input type="text" name="user_id" value="-9"> <input
									type="text" name="source_name" value="array_dummy"> <input
									type="text" name="source_progress" value="array_dummy">
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5" style="text-align: center;">
									<button type="button" id="addrow">
										<i class="fas fa-folder-plus fa-2x"></i>
									</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div></div>
				<div class="flex_div">
					<div id="flex_div_children1">
						<input type="button" value="등록f"
							onclick="insertProject(this.form); return false;"> <input
							type="button" value="등록" onclick="insertProject(this.form);">
						<input type="reset" value="재작성">
					</div>
					<div id="flex_div_children2"></div>
					<div id="flex_div_children3">
						<a href="getProjectList.do?currentPage=1&searchCondition=null&searchKeyword=null">
							<input type="button" value="목록">
						</a>
						<a href="getCommute.do">
							<input type="button" value="메인">
						</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<!-- 여기에 일단 리스트를 띄우고 싶어요. -->
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
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>