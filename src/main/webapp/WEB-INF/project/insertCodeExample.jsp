<html lang="UTF-8">
<head>
<title>CodeMirror in Action</title>

<script src="js/vendor/jquery-1.9.1.js"></script>

<!-- More examples at http://codemirror.net/demo/ -->

<!-- add basic CodeMirror functionality -->
<script src="js/vendor/codemirror-4.1/lib/codemirror.js" type="text/javascript" charset="utf-8"></script>
<script src="js/vendor/codemirror-4.1/addon/selection/active-line.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="js/vendor/codemirror-4.1/lib/codemirror.css" />

<!-- add Javascript-mode dependencies -->
<script src="js/vendor/codemirror-4.1/mode/javascript/javascript.js" type="text/javascript" charset="utf-8"></script>

<!-- add PHP-mode dependencies (replace dependency loading by require.js!) -->
<script src="js/vendor/codemirror-4.1/mode/xml/xml.js" type="text/javascript" charset="utf-8"></script>
<script src="js/vendor/codemirror-4.1/mode/htmlmixed/htmlmixed.js" type="text/javascript" charset="utf-8"></script>
<script src="js/vendor/codemirror-4.1/mode/clike/clike.js" type="text/javascript" charset="utf-8"></script>
<script src="js/vendor/codemirror-4.1/mode/php/php.js" type="text/javascript" charset="utf-8"></script>

<!-- add SPARQL-mode dependencies -->
<script src="js/vendor/codemirror-4.1/mode/sparql/sparql.js" type="text/javascript" charset="utf-8"></script>
<script>
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
<style type="text/css" media="screen">
    
    #container {
        padding: 15px;
    }
    h5 {
        margin: 7px 0px;
    }
    #editor1-pane, 
    #editor2-pane {
        position:relative;
        display: block;
        width: 600px;
        height: 200px;
        border: solid 1px #bbb;
    }
    
    #editor1, 
    #editor2 {
        font-size: 9pt;
    }
    #editor1 .CodeMirror {
        height: 198px;
    }
    
    #editor2 .CodeMirror {
        height: 198px; 
    }
</style>
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
<script>
var textarea = document.getElementById('editor');
var editor = CodeMirror.fromTextArea(textarea, {
    lineNumbers: true,
    lineWrapping: true,
    theme: "eclipse",
    val: textarea.value
});
</script>
<div>
<form action="getCode.do" method="post">
<textarea rows="40" cols="150" id="editor" name="code"></textarea>
<input type="submit">
</form>
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
</body>
</html>
