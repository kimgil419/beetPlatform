<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset='utf-8'/>
</head>
<style>
    .form-control {
        width: 120px;
        text-align: center;
    }

    .imgcontainer {
        position: relative;
    }

    .d-block {
        width: 250px;
        height: 200px;
    }

    .overlay {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        height: 100%;
        width: 100%;
        opacity: 0;
        transition: .5s ease;
        background-color: #4e555b;
    }

    .imgcontainer:hover .overlay {
        opacity: 1;
    }

    .text {
        color: white;
        font-size: 20px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
    }

    .deletebutton:hover {
        cursor: pointer;
    }

    .fc-content {
        text-align: center;
    }

    .fc-content>.fc-time {
        display: none;
    }
    .fc-event-dot {
        margin-top: 5px;
    }
    svg {
        margin-top: 3px;
    }
</style>
<body>
<div id="page-wrapper">
    <jsp:include page="../menu.jsp"/>
    <div id="root" class="container" style="margin-top:30px;padding-left: 0px;padding-right: 0px;max-width: 1240px;">
    </div>
</div>
<script src="/js/meetingRoom-bundle.js"></script>
</body>
</html>