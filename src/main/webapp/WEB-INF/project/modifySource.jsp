<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드수정</title>
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
	switch ("${source.source_progress }") {
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
});
	
	//////////////////////////////////editor 옵션 퍼온것/////////////////////////
$(document).ready(function() {	
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

h1,
h2,
h3,
h4,
h5,
h6 {
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
</head>
<body>
<div id="page-wrapper">
<jsp:include page="../menu.jsp"/>
	<form action="updateSource.do">
		<div class="container">
			<h4>코드수정</h4>
			<table class="table table-bordered">
				<tr>
					<td>No.</td>
					<td><input type="text" name="source_idx" value="${source.source_idx }" readonly="readonly"></td>
					<td>작성자</td>
					<td><input type="button" id="pop" name="search_user_id" value="찾기" onclick="search()">
					<input type="text" name="user_id" value="${source.user_id }">찾기로수정해서쓰게
					<input type="text" name="source_idx" value="${source.user_name }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>기능</td>
					<td><input type="text" name="source_name" value="${source.source_name }"></td>
					<th>진행상황</th>
					<td>
						<select id="progress_select" name="source_progress">
							<option value="예정">예정</option>
							<option value="진행">진행</option>
							<option value="완료">완료</option>
							<option value="보류">보류</option>
							<option value="폐기">폐기</option>
						</select>
					</td>
				</tr>
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
    <!-- <li><a role="button" data-val="link" disabled="disabled" data-toggle="tooltip" data-placement="bottom" title="link"><i class="fa fa-link"></i></a></li> -->
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
<textarea id="text-editor" name="source_code" class="form-control">${source.source_code }</textarea>
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


		
		<div class="container">
			<input type="submit" value="수정하기">
		</div>
	</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</div>
</body>
</html>