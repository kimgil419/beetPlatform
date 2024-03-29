<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트수정</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<link href="/css/project_common.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(function(){
		switch ("${project.project_progress }") {
		case "예정":
 			$("#progress_select option:eq(0)").attr("selected", "selected");
			break;
		case "진행":
 			$("#progress_select option:eq(1)").attr("selected", "selected");
			break;
		case "완료":
 			$("#progress_select option:eq(2)").attr("selected", "selected");
			break;
		case "보류":
 			$("#progress_select option:eq(3)").attr("selected", "selected");
			break;
		case "폐기":
 			$("#progress_select option:eq(4)").attr("selected", "selected");
 			break;
		default:
			alert("progress select error");
			break;
		}
		
		var counter = 0;

		$("#addrow").on("click", function () {
			var newRow = $("<tr>");
	        var cols = "";
	        cols += '<td class="col-sm-"><button type="button" id="searchEmployee" data-toggle="modal" href="remote.html" data-target="#modal"><i class="fas fa-search-plus"></i></button>' +
            		'<input type="text" name="user_id">' +
            		'<input type="text" name="user_name" readonly="readonly"></td>';
            cols += '<td><input type="text" name="source_name">' +
            		'<input type="hidden" name="source_idx" value="-1">' +
            		'</td>'
            cols += '<td><select name="source_progress">' +
            			'<option value="예정">예정</option>'+
            			'<option value="진행">진행</option>' +
            			'<option value="완료">완료</option>' +
            			'<option value="보류">보류</option>' +
            			'<option value="폐기">폐기</option>';
			cols += '<td><button type="button" class="ibtnDel"><i class="fas fa-eraser"></i></button></td>';
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
</head>
<body>
<div id="page-wrapper">
	<jsp:include page="../menu.jsp"/>
	<div class="container" style="margin-top:30px;">
		<form action="updateProject.do?project_idx=${project.project_idx}" method="post">
			<div>
				<div>
					<h4>
						<i class="fas fa-arrow-circle-down"></i>
						<small class="text-muted">프로젝트수정</small>
					</h4>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th>계약업체</th>
								<td><input type="text" name="project_contractor" value="${project.project_contractor }"></td>
								<th>계약기간</th>
								<td><input type="date" name="project_start_date" value="${project.project_start_date }">
									<input type="date" name="project_end_date" value="${project.project_end_date }"></td>
							</tr>
							<tr>
								<th>프로젝트명</th>
								<td><input type="text" name="project_name" value="${project.project_name }"></td>
								<th>계약금액</th>
								<td><input type="number" name="project_contract_amount" value="${project.project_contract_amount }"> 원</td>
							</tr>
							<tr>
								<th>책임자</th>
								<td><button type="button" class="searchButton" data-toggle="modal" data-target="#exampleModal" onclick="selectEmployee()"><i class="fas fa-search-plus"></i></button>
									<input type="text" name="project_manager" value="${project.project_manager }" readonly="readonly">
									<input type="text" name="user_name" value="${project.user_name }" readonly="readonly"></td>
								<th>진행상황</th>
								<td><select id="progress_select" name="project_progress">
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
			</div>		
			<div>
			    <table id="function_table" class="table table-bordered">
				    <thead>
				        <tr>
				            <th>담당자</td>
				            <th>기능</td>
				            <th>진행상태</td>
				            <th>삭제</th>
				        </tr>
				    </thead>
				    <tbody>
				    	<tr>
				    		<tr style="display: none;">
								<td><input type="text" name="source_idx" value="-9">
									<input type="text" name="user_id" value="-9">
									<input type="text" name="source_name" value="array_dummy">
									<input type="text" name="source_progress" value="array_dummy">
								</td>
							</tr>
				    	</tr>
				    	<c:forEach var="source" items="${sourceList }" varStatus="status">
				    		<tr>
				    			<td class="col-sm-">
					                <button type="button" class="searchButton" data-toggle="modal" data-target="#exampleModal" onclick="selectEmployee()"><i class="fas fa-search-plus"></i></button>
					                <input type="text" name="user_id" value="${source.user_id }">
					                <input type="text" name="user_name" value="${source.user_name }" readonly="readonly">
				            	</td>
					            <td class="col-sm-">
					                <input type="text" name="source_name" value="${source.source_name }">
					                <input type="hidden" name="source_idx" value="${source.source_idx }">
					            </td>
					            <td class="col-sm-">
					            	<select id="source_progress${status.index }" name="source_progress">
					            		<option value="예정">예정</option>
					            		<option value="진행">진행</option>
					            		<option value="완료">완료</option>
					            		<option valeu="보류">보류</option>
					            		<option value="폐기">폐기</option>
					            	</select>
					            	<script>
					            		switch ("${source.source_progress }") {
					            		case "예정":
					            			$("#source_progress${status.index } option:eq(0)").attr("selected", "selected");
					            			break;
					            		case "진행":
					            			$("#source_progress${status.index } option:eq(1)").attr("selected", "selected");
					            			break;
					            		case "완료":
					            			$("#source_progress${status.index } option:eq(2)").attr("selected", "selected");
					            			break;
					            		case "보류":
					            			$("#source_progress${status.index } option:eq(3)").attr("selected", "selected");
					            			break;
					            		case "폐기":
					            			$("#source_progress${status.index } option:eq(4)").attr("selected", "selected");
					            			break;
					            		default:
					            			alert("source_progress selector error");
					            			break;
					            		}
					            	</script>
					            </td>
								<td>
									<button type="button" class="ibtnDel"><i class="fas fa-eraser"></i></button>
								</td>
				    		</tr>
				    	</c:forEach>
				    </tbody>
				</table>
			</div>
			<div>
			    <div class="flex_div">
					<div id="flex_div_children1">
						<input type="submit" class="btn btn-outline-primary btn-sm" value="수정">
						<a href="deleteProject.do?project_idx=${project.project_idx }"><button type="button" class="btn btn-outline-primary btn-sm">삭제</button></a>
					</div>
					<div id="flex_div_children2">
						<button type="button" id="addrow"><i class="fas fa-folder-plus fa-lg"></i></button>
					</div>
					<div id="flex_div_children3">
						<a href="getProject.do?project_idx=${project.project_idx }"><button type="button" class="btn btn-outline-primary btn-sm">돌아가기</button></a>
						<a href="getProjectList.do?currentPage=1&searchCondition=null&searchKeyword=null"><button type="button" class="btn btn-outline-primary btn-sm">목록</button></a>
						<a href="getCommute.do"><button type="button" class="btn btn-outline-primary btn-sm">메인</button></a>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>