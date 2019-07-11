<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트작성</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<script src="https://kit.fontawesome.com/9c3276f165.js"></script>
<script>
	$(document).ready(function() {
		var counter = 0;
		$("#addrow").on("click", function () {
			var newRow = $("<tr>");
	        var cols = "";
	        cols += '<td class="col-sm-"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-search-plus"></i></button>' +
	        /* cols += '<td class="col-sm-"><button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modalCart">검색</button>' + */
            		'<input type="text" name="user_id">' +
            		'<input type="text" name="user_name" readonly="readonly"></td>';
            cols += '<td class="col-sm-"><input type="text" name="source_name">' +
            		'<input type="hidden" name="source_idx" value="-1">' +
            		'</td>'
            cols += '<td class="col-sm-"><select name="source_progress">' +
            			'<option value="예정">예정</option>'+
            			'<option value="진행">진행</option>' +
            			'<option value="완료">완료</option>' +
            			'<option value="보류">보류</option>' +
            			'<option value="폐기">폐기</option>';
            cols += '<td><button type="button" class="ibtnDel"><i class="fas fa-eraser"></i></button></td>';
/*             cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger " value="삭제"></td>'; */
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
	    var grandTotal = 3;
	    $("table#function_table").find('input[name^="price"]').each(function () {
	        grandTotal += +$(this).val();
	    });
	    $("#grandtotal").text(grandTotal.toFixed(2));
	}
</script>
<style>
	.flex_div {
		display: flex;
	}
	#flex_div_children1 {
		width: 50%;
	}
	#flex_div_children2 {
		width: 50%;
		display: flex;
		justify-content: flex-end;
	}
</style>
</head>
<body>
<div id="page-wrapper">
	<jsp:include page="../menu.jsp"/>
	<div class="container" style="margin-top:30px;">
		<form action="insertProject.do" method="post">
			<h4>프로젝트 작성</h4>
			<div>
				<table class="table order-bordered">
					<tbody>
						<tr>
							<th>계약업체</th>
							<td><input type="text" name="project_contractor"></td>
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
			<div>
			    <table id="function_table" class=" table order-list">
				    <thead>
				        <tr>
				            <th>담당자</th>
				            <th>기능</th>
				            <th>진행상태</th>
				        </tr>
				    </thead>
				    <tbody>
				    	<tr style="display:none;">
				    		<td>
				    			<input type="text" name="source_idx" value="-9">
				    			<input type="text" name="user_id" value="-9">
				    			<input type="text" name="source_name" value="array_dummy">
				    			<input type="text" name="source_progress" value="array_dummy">
				    		</td>
				    	</tr>
				    </tbody>
				    <tfoot>
				        <tr>
				            <td colspan="5" style="text-align: center;">
				                <button type="button" id="addrow"><i class="fas fa-folder-plus fa-2x"></i></button>
				            </td>
				        </tr>
				    </tfoot>
				</table>
			</div>
			<div>
			</div>
			<div class="flex_div">
				<div id="flex_div_children1">
					<input type="submit" value="등록">
					<input type="reset" value="재작성">
				</div>
				<div id="flex_div_children2">
					<a href="getProjectList.do?currentPage=1&searchCondition=null&searchKeyword=null"><input type="button" value="목록"></a>
					<a href="getCommute.do"><input type="button" value="메인"></a>
				</div>
			</div>
		</form>
	</div>
	<%-- <table>
		<tbody>
			<tr>
				<th>부서</th>
				<th>이름</th>
				<th>사번</th>
			</tr>
			<c:forEach var="employee" items="${employeeList }">
				<tr>
					<td>${employee.dept }</td>
					<td>${employee.user_name }</td>
					<td>${employee.user_id }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> --%>
</div>
<!-- Button trigger modal -->
<!-- 
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-search-plus"></i></button>
 -->
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
				<table>
					<tbody>
						<tr>
							<th>부서</th>
							<th>이름</th>
							<th>사번</th>
						</tr>
						<c:forEach var="userSearchList" items="${userSearchList }">
							<tr>
								<td>${userSearchList.dept }</td>
								<td>${userSearchList.user_name }</td>
								<td>${userSearchList.user_id }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>