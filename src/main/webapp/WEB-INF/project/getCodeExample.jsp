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
<textarea rows="40" cols="150" id="editor" name="code" readonly="readonly">${code }</textarea>
</div>
</body>
</html>
