<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>dsdsad</title>
</head>
<script src='/js/jquery-3.4.1.min.js'></script>
<script src="/js/pagination.min.js"></script>
<link href="css/pagination.css" rel='stylesheet'/>
<script src="/js/searchpeople.js"></script>
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js" data-auto-replace-svg="nest"></script>


<style>

    .table {
        font-size: 14px;
    }

    input:focus {
        border: solid 1px lightskyblue;
        border-radius: 1px;
    }

    #pagination-bar{
        align-content: center;
    }

    td {
        text-align: center;
    }
</style>
<script>

    var employeelist = ${list};
    var list = [];


    $(function () {

        searchpeople();

        $("#searchbar").keydown(function (key) {
            if (key.keyCode == 13) {
                key.preventDefault();
                searchkeyword();
            }
        })

    });


    function searchkeyword() {

        var keyword = $("#searchbar").val();

        $.ajax({
            url: "searchEmployee.do",
            method: "post",
            data: "keyword=" + keyword,
            datatype: "json",
            success: function (data) {
                employeelist = data;
                list = [];

                searchpeople();
            }
        })
    }

</script>

<body>
<div id="page-wrapper">
    <jsp:include page="../menu.jsp"/>
    <div class="container" style="margin-top:30px;max-width: 1240px">
        <div style="float:right;">
            <input type="text" name="search" id="searchbar" style="border:none; width:130px;" placeholder="search keyword...">
            <div style="padding-top:4px;display:inline-block;" onclick="searchkeyword()"><span><i class="fas fa-search" style="color: lightgrey;"></i></span></div>
        </div>
        <div style="clear:both"></div>
        <br/>
        <div id="here"></div>
        <div id="pagination-bar" style="margin-left:540px;"></div>
    </div>
</div>
</body>
</html>