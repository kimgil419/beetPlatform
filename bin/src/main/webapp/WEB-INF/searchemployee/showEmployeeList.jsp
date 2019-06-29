<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>dsdsad</title>
</head>
<script src='js/jquery-3.4.0.js'></script>
<script src="js/pagination.min.js"></script>
<link href="css/pagination.css" rel='stylesheet'/>
<style>
    ul, li {
        list-style: none;
    }

    #wrapper {
        width: 900px;
        margin: 20px auto;
    }

    #pagination-data-container {
        margin-top: 5px;
    }

    #pagination-data-container ul {
        padding: 0;
        margin: 0;
    }

    #pagination-data-container li {
        margin-bottom: 5px;
        padding: 5px 10px;
        background: #eee;
        color: #666;
        width: 800px;
    }
</style>
<script>

    var employeelist = ${list};
    var list = [];

    function template(data) {
        var html = '<ul>';
        $.each(data, function (index, item) {
            html += '<li>' + item + '</li>';
        });
        html += '</ul>';
        return html;
    }

    $(function () {

        employeelist.forEach(function (item) {
            var string =
                "<tr>" +
                "<td>" + item.user_name + "</td>" +
                "<td>" + item.dept + "</td>" +
                "<td>" + item.user_position + "</td>" +
                "<td>" + item.firstjoin + "</td>" +
                "<td>" + item.email + "</td>" +
                "<td>" + item.cphone + "</td>" +
                "<td>" + item.phone + "</td>" +
                "</tr>";
            list.push(string);
        })


        $(function () {

            $('#pagination-bar').pagination({
                dataSource: list,
                pageSize: 10,
                autoHidePrevious: true,
                autoHideNext: true,
                callback: function (data, pagination) {
                    var html = template(data);
                    $('#pagination-data-container').html(html);
                }
            });

            $("#searchbar").keydown(function (key) {

                if (key.keyCode == 13) {
                    key.preventDefault();
                    searchkeyword();

                }
            })
        });
    })

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

                employeelist.forEach(function (item) {
                    var string =
                        "<tr>" +
                        "<td>" + item.user_name + "</td>" +
                        "<td>" + item.dept + "</td>" +
                        "<td>" + item.user_position + "</td>" +
                        "<td>" + item.firstjoin + "</td>" +
                        "<td>" + item.email + "</td>" +
                        "<td>" + item.cphone + "</td>" +
                        "<td>" + item.phone + "</td>" +
                        "</tr>";
                    list.push(string);
                })

                $('#pagination-bar').pagination({
                    dataSource: list,
                    pageSize: 10,
                    autoHidePrevious: true,
                    autoHideNext: true,
                    callback: function (data, pagination) {
                        var html = template(data);
                        $('#pagination-data-container').html(html);
                    }
                });
            }
        })

    }

</script>

<body>

<form>
    <input type="text" name="search" id="searchbar"/>
    <input type="button" value="검색" onclick="searchkeyword()"/>
</form>
<div>
    <table>
        <tr>
            <th>이름</th>
            <th>부서</th>
            <th>직급</th>
            <th>입사일</th>
            <th>이메일</th>
            <th>핸드폰번호</th>
            <th>내선번호</th>
        </tr>
    </table>
</div>
<div id="wrapper">
</div>
<div id="pagination-data-container"></div>
<div id="pagination-bar"></div>
</body>

</html>