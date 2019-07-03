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
		case "진행":
 			$("#progress_select option:eq(1)").attr("selected", "selected");
			break;
		case "완료":
 			$("#progress_select option:eq(2)").attr("selected", "selected");
			break;
		case "보류":
 			$("#progress_select option:eq(3)").attr("selected", "selected");
			break;
		default:
			alert("progress select error");
			break;
		}
		
		
		////////////////펌/////////////
		$("#add_row").on("click", function() {
	        // Dynamic Rows Code
	        
	        // Get max row id and set new id
	        var newid = 0;
	        $.each($("#tab_logic tr"), function() {
	            if (parseInt($(this).data("id")) > newid) {
	                newid = parseInt($(this).data("id"));
	            }
	        });
	        newid++;
	        
	        var tr = $("<tr></tr>", {
	            id: "addr"+newid,
	            "data-id": newid
	        });
	        
	        // loop through each td and create new elements with name of newid
	        $.each($("#tab_logic tbody tr:nth(0) td"), function() {
	            var td;
	            var cur_td = $(this);
	            
	            var children = cur_td.children();
	            
	            // add new td and element if it has a nane
	            if ($(this).data("name") !== undefined) {
	                td = $("<td></td>", {
	                    "data-name": $(cur_td).data("name")
	                });
	                
	                var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
	                c.attr("name", $(cur_td).data("name") + newid);
	                c.appendTo($(td));
	                td.appendTo($(tr));
	            } else {
	                td = $("<td></td>", {
	                    'text': $('#tab_logic tr').length
	                }).appendTo($(tr));
	            }
	        });
	        
	        // add delete button and td
	        /*
	        $("<td></td>").append(
	            $("<button class='btn btn-danger glyphicon glyphicon-remove row-remove'></button>")
	                .click(function() {
	                    $(this).closest("tr").remove();
	                })
	        ).appendTo($(tr));
	        */
	        
	        // add the new row
	        $(tr).appendTo($('#tab_logic'));
	        
	        $(tr).find("td button.row-remove").on("click", function() {
	             $(this).closest("tr").remove();
	        });
		});
	
	
	
	
	    // Sortable Code
	    var fixHelperModified = function(e, tr) {
	        var $originals = tr.children();
	        var $helper = tr.clone();
	    
	        $helper.children().each(function(index) {
	            $(this).width($originals.eq(index).width())
	        });
	        
	        return $helper;
	    };
	  
	    $(".table-sortable tbody").sortable({
	        helper: fixHelperModified      
	    }).disableSelection();
	
	    $(".table-sortable thead").disableSelection();
	
	
	
	    $("#add_row").trigger("click");
	});
</script>
<style>
	.table-sortable tbody tr {
	    cursor: move;
	}
</style>
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
							<option value="진행">진행</option>
							<option value="완료">완료</option>
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
		
		<div class="container">
	    <div class="row clearfix">
	    	<div class="col-md-12 table-responsive">
				<table class="table table-bordered table-hover table-sortable" id="tab_logic">
					<thead>
						<tr>
							<th class="text-center">담당자</th>
							<th class="text-center">기능</th>
							<th class="text-center">수정일</th>
	    					<th class="text-center">진행</th>
	        				<th class="text-center" style="border-top: 1px solid #ffffff; border-right: 1px solid #ffffff;"></th>
						</tr>
					</thead>
					<tbody>
	    				<tr id='addr0' data-id="0" class="hidden">
							<td data-name="name">
							    <input type="text" name='name0'  placeholder='Name' class="form-control"/>
							</td>
							<td data-name="mail">
							    <input type="text" name='mail0' placeholder='Email' class="form-control"/>
							</td>
							<td data-name="desc">
							    <textarea name="desc0" placeholder="Description" class="form-control"></textarea>
							</td>
	    					<td data-name="sel">
							    <select name="source_progress">
	    					        <option value="예정" selected="selected">예정</option>
	        				        <option value="진행">진행</option>
	        				        <option value="완료">완료</option>
	        				        <option value="폐기">폐기</option>
							    </select>
							</td>
	                        <td data-name="del">
	                            <button name="del0" class='btn btn-danger glyphicon glyphicon-remove row-remove'><span aria-hidden="true">×</span></button>
	                        </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<input type="submit" value="수정">
		<a id="add_row" class="btn btn-primary float-right">Add Row</a>
		</div>	
		<div>
		</div>
	</form>
</body>
</html>