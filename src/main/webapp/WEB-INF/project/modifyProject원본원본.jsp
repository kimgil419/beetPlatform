<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트수정</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script>
	$(document).ready(function(){
		switch ("${project.project_progress }") {
		case "예정":
 			$("#progress_select option:eq(0)").attr("selected", "selected");
			break;
		case "완료":
 			$("#progress_select option:eq(1)").attr("selected", "selected");
			break;
		case "보류":
 			$("#progress_select option:eq(2)").attr("selected", "selected");
			break;
		case "폐기":
 			$("#progress_select option:eq(3)").attr("selected", "selected");
			break;
		default:
			alert("progress select error");
			break;
		}
	});
</script>
</head>
<body>
	<h3>프로젝트 수정</h3>
	<form action="updateProject.do?project_idx=${project.project_idx}" method="post">
		<div>
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
						<td><input type="number" name="project_contract_amount" value="${project.project_contract_amount }"></td>
					</tr>
					<tr>
						<th>책임자</th>
						<td><input type="button" id="pop" name="user_id" value="찾기" onclick="search()">
							<input type="text" name="project_manager" value="${project.project_manager }" readonly="readonly">
							<input type="text" name="user_name" value="${project.user_name }" readonly="readonly"></td>
						<th>진행상황</th>
						<td><select id="progress_select" name="project_progress">
							<option value="예정">예정</option>
							<option value="완료">완료</option>
							<option value="보류">보류</option>
							<option value="폐기">폐기</option>
						</select></td>
					</tr>	
				</tbody>
			</table>
		</div>
		<div>
			<table class="table table-bordered">
				<tbody>
					
				</tbody>
			</table>
		</div>
		<div>
			<input type="submit" value="수정">
		</div>		
	</form>
</body>
</html>