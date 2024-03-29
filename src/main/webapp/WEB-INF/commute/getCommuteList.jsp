<%@page import="com.beetoffice.approval.ApprovalDAO" %>
<%@page import="com.beetoffice.approval.ApprovalVO" %>
<%@page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <script src='/js/jquery-3.4.1.min.js'></script>
   


    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
    <style>
        /* Default */
        input[type=text], input[type=password] {
            font-family: "Malgun Gothic", "맑은 고딕", Dotum, "돋움", Arial, sans-serif
        }

        * {
            margin: 0;
            padding: 0;
            font-family: "Malgun Gothic", "맑은 고딕", Dotum, "돋움", Arial, sans-serif
        }

        body {
            font-size: 12px;
            color: #555;
            background: transparent;
            -webkit-user-select: none;
            -moz-user-select: none;
            -webkit-text-size-adjust: none;
            -moz-text-size-adjust: none;
            -ms-text-size-adjust: none
        }

        ol, ul {
            list-style: none
        }

        table {
            table-layout: fixed;
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0
        }

        caption {
            overflow: hidden;
            width: 0;
            height: 0;
            font-size: 0;
            line-height: 0;
            text-indent: -999em
        }

        img, fieldset {
            border: 0
        }

        legend {
            height: 0;
            visibility: hidden
        }

        em, address {
            font-style: normal
        }

        img {
            border: 0 none;
            vertical-align: middle
        }

        a {
            color: #555;
            text-decoration: none
        }

        input, select {
            margin: 0;
            padding: 0;
            vertical-align: middle
        }

        button {
            margin: 0;
            padding: 0;
            font-family: inherit;
            border: 0 none;
            background: transparent;
            cursor: pointer
        }

        button::-moz-focus-inner {
            border: 0;
            padding: 0
        }

        header, footer, aside, nav, section, article {
            display: block
        }

        .clearfix {
            *zoom: 1
        }

        .clearfix:after {
            content: "";
            display: block;
            clear: both;
            overflow: hidden
        }

        /* Search */
        .searchBox {
            border: none
        }

        .searchBox tbody th {
            padding: 20px 10px 20px 35px;
            font-size: 14px;
            font-weight: bold;
            text-align: left;
            vertical-align: top;
            border: none;
            background: #e6e6e6
        }

        .searchBox tbody td {
            padding: 12px 10px 12px 25px;
            border: none;
            background-color: #efefef
        }

        .searchDate {
            overflow: hidden;
            margin-bottom: 10px;
            *zoom: 1
        }

        .searchDate:after {
            display: block;
            clear: both;
            content: ''
        }

        .searchDate li {
            position: relative;
            float: left;
            margin: 0 7px 0 0
        }

        .searchDate li .chkbox2 {
            display: block;
            text-align: center
        }

        .searchDate li .chkbox2 input {
            position: absolute;
            z-index: -1
        }

        .searchDate li .chkbox2 label {
            display: block;
            width: 72px;
            height: 26px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            text-align: center;
            line-height: 25px;
            text-decoration: none;
            cursor: pointer;
            background: #a5b0b6
        }

        .searchDate li .chkbox2.on label {
            background: #ec6a6a
        }

        .demi {
            display: inline-block;
            margin: 0 1px;
            vertical-align: middle
        }

        .inpType {
            padding-left: 6px;
            height: 24px;
            line-height: 24px;
            border: 1px solid #dbdbdb
        }

        .btncalendar {
            display: inline-block;
            width: 22px;
            height: 22px;
            background: url(images/btn_calendar.gif) center center no-repeat;
            text-indent: -999em
        }


    </style>

    <script>
   

        $(function () {
        	$(".chkbox2").click(function() {
        		document.sub1.submit();
    		});
            $.datepicker.setDefaults($.datepicker.regional['ko']);              
            $(".datepicker").datepicker({
                showButtonPanel: true,
                dateFormat: "yy-mm-dd",
                onClose: function (selectedDate) {
                    var eleId = $(this).attr("id");
                    var optionName = "";
                    if (eleId.indexOf("StartDate") > 0) {
                        eleId = eleId.replace("StartDate", "EndDate");
                        optionName = "minDate";
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate";
                    }
                    $("#" + eleId).datepicker("option", optionName, selectedDate);
                    $(".searchDate").find(".chkbox2").removeClass("on");
                }          
            });      

            $(".dateclick").dateclick();    
            $(".searchDate").schDate();        

        });
        jQuery.fn.schDate = function () {
            var $obj = $(this);
            var $chk = $obj.find("input[type=radio]");
            $chk.click(function () {
                $('input:not(:checked)').parent(".chkbox2").removeClass("on");
                $('input:checked').parent(".chkbox2").addClass("on");
            });
        };

     
        jQuery.fn.dateclick = function () {
            var $obj = $(this);
            $obj.click(function () {
                $(this).parent().find("input").focus();
            });
        }

        function setSearchDate(start) {
            var num = start.substring(0, 1);
            var str = start.substring(1, 2);
            var today = new Date();
         
            var endDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchEndDate').val(endDate);

            if (str == 'd') {
                today.setDate(today.getDate() - num);
            } else if (str == 'w') {
                today.setDate(today.getDate() - (num * 7));
            } else if (str == 'm') {
                today.setMonth(today.getMonth() - num);
                today.setDate(today.getDate() + 1);
            }

            var startDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchStartDate').val(startDate);

           
            $("#searchEndDate").datepicker("option", "minDate", startDate);

         
            $("#searchStartDate").datepicker("option", "maxDate", endDate);

        }            

    </script>

</head>
<body>


<div id="page-wrapper">
    <jsp:include page="../menu.jsp"></jsp:include>
    <div class="container" style="margin-top:30px;">
        <form action="getCommuteList.do" method="POST" name="sub1">
        

            <!-- search -->
            <table class="searchBox">
                <caption>조회</caption>
                <colgroup>
                    <col width="123px">
                    <col width="*">
                </colgroup>
                <tbody>
                <tr>
                    <th>조회기간</th>
                    <td>
                        <ul class="searchDate">
                        
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                                    <label for="dateType1">당일</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType2" onclick="setSearchDate('3d')"/>
                                    <label for="dateType2">3일</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
                                    <label for="dateType3">1주</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType4" onclick="setSearchDate('2w')"/>
                                    <label for="dateType4">2주</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                                    <label for="dateType5">1개월</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                                    <label for="dateType6">3개월</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
                                    <label for="dateType7">6개월</label>
                                </span>
                            </li>
                        </ul>

                        <div class="clearfix">
                            <!-- 시작일 -->
                            <span class="dset">
                                <input type="text" class="datepicker inpType" name="in_time1" id="searchStartDate">
                                <a href="#none" class="btncalendar dateclick">달력</a>
                            </span>
                            <span class="demi">~</span>
                            <!-- 종료일 -->
                            <span class="dset">
                                <input type="text" class="datepicker inpType" name="in_time2" id="searchEndDate">
                                <a href="#none" class="btncalendar dateclick">달력</a>
                            </span>
                        </div>
                    </td>
                </tr>
                <tbody>
            </table>
            <table class="border-none">
                <tr>
                    <td>

                        <select name="searchCondition">
                            <option value="" selected disabled>검색옵션</option>
                            <c:forEach var="option" items="${conditionMap}">
                            <option value="${option.value}">${option.key}
                                </c:forEach>
                        </select>

                        <input type="text" name="searchKeyword">
                        <input type="submit" value="검색">
                    </td>
                </tr>
            </table>
        </form>

        <!-- 데이타 표시 -->
        <table class="table table-hover">
            <tr>
                <th width="100">사번</th>
                <th width="100">이름</th>
                <th width="200">출근</th>
                <th width="200">퇴근</th>
                <th width="50">직급</th>
                <th width="50">부서</th>
                <th width="50">직무</th>
            </tr>

            <c:forEach var="commute" items="${commuteList}">

                <tr>
                    <td class="center"> ${commute.user_id } </td>
                    <td class="center">${commute.user_name}</td>
                    <td class="center">${commute.in_time }</td>
                    <td class="center">${commute.out_time }</td>
                    <td class="center">${commute.user_position }</td>
                    <td class="center">${commute.dept }</td>
                    <td class="center">${commute.job_id }</td>
                </tr>

            </c:forEach>
        </table>
        <br>

        <c:if test="${ commute.in_time > today}">
            <input type="button" value="출근" onclick="in(this.form)">
        </c:if>
        <p><a href="getCommute.do">메인메뉴이동</a></p>
    </div>
</div>
</body>
</html>