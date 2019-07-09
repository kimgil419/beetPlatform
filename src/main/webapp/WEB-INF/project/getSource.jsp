<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드상세보기</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/mode/css/css.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/codemirror.min.css"></script>
<script src="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/codemirror.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/mode/xml/xml.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/mode/htmlmixed/htmlmixed.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/mode/css/css.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.0/holder.js"></script>


<!-- https://codepen.io/wolfgang1983/pen/mVmxpp -->
<script>
	$(document).ready(function() {
		
		
	    ////////////////////////////////// editor 옵션 퍼온것/////////////////////////
	    // tooltips on hover
	    $('[data-toggle=\'tooltip\']').tooltip({container: 'body', html: true});
	
	    // Makes tooltips work on ajax generated content
	    $(document).ajaxStop(function() {
	        $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	    });
	
	    $('[data-toggle=\'tooltip\']').on('remove', function() {
	        $(this).tooltip('destroy');
	    });
	
	
	    var editor = document.getElementById('text-editor');
	
	    $("#text-editor").each(function (i) {
	        
	        editor = CodeMirror.fromTextArea(this, {
	            lineNumbers: true,
	            mode: 'html'
	            
	        });
	
	        editor.on("change", function() {
	            document.getElementById('question-preview').innerHTML = editor.getValue('<br>')
	            .replace('<?','&lt;?')
	            .replace('?>', '?&gt;')
	            .replace('<script>', '&lt;script&gt;')
	            .replace('<script>', '&lt;/script&gt;')
	            .replace('<div>', '&lt;div&gt;')
	            .replace('</div>', '&lt;/div&gt;')
	            
	        });
	
	        //$('#hr').append('<hr />');
	
	        $('a[role="button"]').click(function(){
	
	            var val = $(this).data('val');
	            var string = editor.getSelection();
	              
	            switch(val){
	                
	                case 'bold': 
	                    editor.replaceSelection('<b>' + string + '</b>');
	                break;
	
	                case 'italic': 
	                    editor.replaceSelection('<i>' + string + '</i>');
	                break;
	
	                case 'quote': 
	                    editor.replaceSelection('<blockquote><p>' + string + '</p></blockquote>');
	                break;
	
	                case 'code': 
	                    editor.replaceSelection('<pre><code>' + string + '</code></pre>');
	                    
	                break;
	
	                case 'hr': 
	                    editor.replaceSelection('<hr/>');
	                    
	                break;
	            }
	
	        });
	
	        $(".dropdown-menu li a[class='btn-heading']").click(function(){
	            var val = $(this).data('val');
	            var string = editor.getSelection();
	
	            switch(val){
	                case 'h1': 
	                    editor.replaceSelection('<h1>' + string + '</h1>');
	                break;
	                case 'h2': 
	                    editor.replaceSelection('<h2>' + string + '</h2>');
	                break;
	                case 'h3': 
	                    editor.replaceSelection('<h3>' + string + '</h3>');
	                break;
	                case 'h4': 
	                    editor.replaceSelection('<h4>' + string + '</h4>');
	                break;
	                case 'h5': 
	                    editor.replaceSelection('<h5>' + string + '</h5>');
	                break;
	                case 'h6': 
	                    editor.replaceSelection('<h6>' + string + '</h6>');
	                break;
	            }
	        });
	    });
	});
</script>
<style>
	.container {
		margin-top: 2rem;
	}
	h1,	h2,	h3,	h4,	h5,	h6 {
		margin-top: 0;
	}
	blockquote {
	    background-color: #fff8dc;
	    border-left: 2px solid #ffeb8e;
	    padding: 10px;
	}
	.panel-default .panel-heading a {
		color: #000000;
	}
	.panel-default .panel-heading i {
		color: #000000;
	}
	#question-preview {
	    white-space:pre-line;
	}
	#question-preview pre code {
	    padding: 0;
	    white-space: inherit;
	}
	#question-preview pre {
	    background-color: #eee;
	    font-size: 13px;
	    border: none;
	    border-radius: 0;
	    max-height: 600px;
	    overflow: auto;
	    padding: 5px;
	    width: auto;
	}
	#question-preview code {
	    background-color: #eee;
	}
	#text-editor {
		min-height: 350px;
	}
</style>
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
	<div class="container">
		<h4>소스코드 상세보기</h4>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>No.</th>
					<td>${source.source_idx }</td>
					<th>담당자</th>
					<td>${source.user_name }</td>
				</tr>
				<tr>
					<th>기능</th>
					<td>${source.source_name }</td>
					<th>진행상황</th>
					<td>${source.source_progress }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container">

<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<div class="panel panel-default"  onLoad="text_editor();">
<div class="panel-heading">

<ul class="nav nav-pills" id="heading">
    <li><a role="button" data-val="bold" data-toggle="tooltip" data-placement="bottom" title="Bold"><i class="fa fa-bold"></i></a></li>
    <li><a role="button" data-val="italic" data-toggle="tooltip" data-placement="bottom" title="Italic"><i class="fa fa-italic"></i></a></li>
    <li><a role="button" data-val="link" disabled="disabled" data-toggle="tooltip" data-placement="bottom" title="link"><i class="fa fa-link"></i></a></li>
    <li><a role="button" data-val="quote" data-toggle="tooltip" data-placement="bottom" title="Quote"><i class="fa fa-quote-left"></i></a></li>
    <li><a role="button" data-val="code" data-toggle="tooltip" data-placement="bottom" title="Code">{ }</a></li>
    <li><a role="button" data-val="hr" data-toggle="tooltip" data-placement="bottom" title="hr"><i class="fa fa-minus"></i></a></li>
    <li class="dropdown" data-toggle="tooltip" data-placement="top" title="heading">
        <a class="dropdown-toggle" role="button" data-toggle="dropdown"><i class="fa fa-header"></i> <span class="caret"></span></a>
        <ul class="dropdown-menu"> 
            <li><a class="btn-heading" data-val="h1">H1</a></li> 
            <li><a class="btn-heading" data-val="h2">H2</a></li> 
            <li><a class="btn-heading" data-val="h3">H3</a></li> 
            <li><a class="btn-heading" data-val="h4">H4</a></li>
            <li><a class="btn-heading" data-val="h5">H5</a></li> 
            <li><a class="btn-heading" data-val="h6">H6</a></li>
        </ul>
    </li>
</ul>

</div>
<div class="panel-body">
<textarea id="text-editor" name="source_code" class="form-control" readonly="readonly">${source.source_code }</textarea>
</div>
</div>
</div>

</div>

<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<div id="question-preview"></div>
</div>

</div>

</div>

	</div>
	<div class="container">
		<div class="flex_div">
			<div id="flex_div_children1">
				<a href="modifySource.do?source_idx=${source.source_idx }"><input type="button" value="수정"></a>
				<a href="deleteSource.do?source_idx=${source.source_idx }&project_idx=${source.project_idx }"><input type="button" value="삭제"></a>
			</div>
			<div id="flex_div_children2">
				<a href="getProject.do?project_idx=${source.project_idx }"><input type="button" value="프로젝트"></a>
				<a href="getProjectList.do?currentPage=1&searchCondition=null&searchKeyword=null"><input type="button" value="목록"></a>
				<a href="getCommute.do"><input type="button" value="메인"></a>
			</div>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</div>
</body>
</html>