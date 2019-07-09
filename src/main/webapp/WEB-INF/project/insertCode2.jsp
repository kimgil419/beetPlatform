<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function () {
	  
    var readOnlyCodeMirror = CodeMirror.fromTextArea(document.getElementById('codesnippet_readonly'), {
        mode: "javascript",
        theme: "default",
        lineNumbers: true,
        readOnly: true
    });  
  
    var editableCodeMirror = CodeMirror.fromTextArea(document.getElementById('codesnippet_editable'), {
        mode: "javascript",
        theme: "default",
        lineNumbers: true
    });

};

</script>
</head>
<body>
  <h1>Using CodeMirror (readonly and editable code)</h1>
  
<p><a href="http://codemirror.net/mode/javascript/index.html">http://codemirror.net/mode/javascript/index.html</a></p>

    <link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">
    <script src="http://codemirror.net/lib/codemirror.js"></script>
    <script src="http://codemirror.net/addon/edit/matchbrackets.js"></script>
    <script src="http://codemirror.net/addon/edit/continuecomment.js"></script>
    <script src="http://codemirror.net/mode/javascript/javascript.js"></script>

    <h2>Readonly</h2>        
       
<div>
  <textarea rows="4" cols="50" id="codesnippet_readonly" name="codesnippet_readonly">
// Demo code (the actual new parser character stream implementation)

<body>
  </textarea>
</div>

<div>
    
    <h2>Editable</h2>
    
<textarea rows="4" cols="50" name="codesnippet_editable" id="codesnippet_editable">
// Demo code (the actual new parser character stream implementation)

<body>

</body>
</textarea>

</div>
</body>
</html>