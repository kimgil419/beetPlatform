<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트작성</title>
<script src='/js/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" type="text/css" /> 
<script>
	function search() {
		$('div.modal').modal({
			remote : '/html/layer.html'
		});
	}
	$(document).ready(function() {
		var counter = 0;
		$("#addrow").on("click", function () {
			var newRow = $("<tr>");
	        var cols = "";
	        cols += '<td class="col-sm-"><button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modalCart">검색</button>' +
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
            cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger " value="삭제"></td>';
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
	<div id="page-wrapper" class="container-fluid">
	<jsp:include page="../menu.jsp"/>
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
			
			<div class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- remote ajax call이 되는영역 -->
					</div>
				</div>
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
				    </tbody>
				    <tfoot>
				        <tr>
				            <td colspan="5" style="text-align: left;">
				                <input type="button" class="btn btn-lg btn-block " id="addrow" value="추가" />
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
	<hr>
	<hr>


<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">모달출력버튼</button><br/>
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Header</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            Body
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>




</body>
</html>