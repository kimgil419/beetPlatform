<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인화면</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
    <script>
        function in_commute(frm) {
            var result = confirm('출근 하시겠습니까?');

            if (result) {
                frm.action = "insertCommute.do"
                frm.submit();
            } else { //no
            }
        };

        function out_commute(frm) {
            var result = confirm('퇴근 하시겠습니까?');

            if (result) {
                frm.action = "updateCommute.do"
                frm.submit();
            } else { //no
            }
        };
    </script>
    <style>
        .video-item img {
            max-width: 64px;
        }

        .video-detail .details {
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .list-group-item {
            cursor: pointer;
        }

        .list-group-item:hover {
            background-color: #eee;
        }

        F
    </style>
<body>
<div id="page-wrapper">
    <jsp:include page="menu.jsp"/>
    <div id="root"></div>
</div>

<script src="/js/youtube-bundle.js"></script>
</body>
</html>