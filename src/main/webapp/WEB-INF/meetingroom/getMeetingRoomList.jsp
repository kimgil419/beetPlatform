<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='en'>

<head>
    <meta charset='utf-8'/>
</head>
<script src='/js/jquery-3.4.1.min.js'></script>
<link href='/library/fullcalendar/packages/core/main.css' rel='stylesheet'/>
<link href='/library/fullcalendar/packages/daygrid/main.css' rel='stylesheet'/>
<link href='/library/fullcalendar/packages/timegrid/main.css' rel='stylesheet'/>
<link href='/library/fullcalendar/packages/list/main.css' rel='stylesheet'/>
<script src='/library/fullcalendar/packages/core/main.js'></script>
<script src='/library/fullcalendar/packages/interaction/main.js'></script>
<script src='/library/fullcalendar/packages/daygrid/main.js'></script>
<script src='/library/fullcalendar/packages/timegrid/main.js'></script>
<script src='/library/fullcalendar/packages/list/main.js'></script>
<link href="/library/chenfengyuan/datepicker/dist/datepicker.css" rel="stylesheet">
<script src="/library/chenfengyuan/datepicker/dist/datepicker.js"></script>
<script src='/js/calendar.js'></script>
<script src='/library/timepicker/dist/wickedpicker.min.js'></script>
<link href='/library/timepicker/dist/wickedpicker.min.css' rel='stylesheet'/>
<script src="/js/clickedRoom.js"></script>
<script src="/js/booklist.js"></script>
<script>

    var list = ${meetingRoomList};
    var currentDate = new Date();
    var calendarEl;
    var calendar;
    var allList = ${allList};
    var userDept = `${userDept}`;


    function addList() {

        for (var i = 0; i < allList.length; i++) {
            if ($("#datepicker").val() == allList[i].book_date) {
                if (!($("#timePicker2").val() <= allList[i].start || $("#timePicker1").val() >= allList[i].end)) {
                    alert("시간이 중복됩니다.");
                    return false;
                }
            }
        }

        if ($("#timePicker1").val() >= $("#timePicker2").val()) {
            alert("시간 설정을 다시 해주세요.")
            $("#timePicker2").focus();
            return false;
        }

        if ($("input[name=title]").val() == "") {
            alert("예약 목적을 입력해주세요.")
            $("input[name=title]").focus();
            return false;
        }

        saveajax();

    }

    $(function () {

        $("#i1").on("click", function () {
            $("#room_num").val("room1")
            room_num = $("#room_num").val();
            clicked(room_num);
        })
        $("#i2").on("click", function () {
            $("#room_num").val("room2")
            room_num = $("#room_num").val();
            clicked(room_num);
        })
        $("#i3").on("click", function () {
            $("#room_num").val("room3")
            room_num = $("#room_num").val();
            clicked(room_num);
        })
        $("#i4").on("click", function () {
            $("#room_num").val("room4")
            room_num = $("#room_num").val();
            clicked(room_num);
        })

        $('#timePicker1').wickedpicker({
            timeSeparator: ':',
            now: "9:00:00",
            twentyFour: true,
            minutesInterval: 30,
            title: "시간선택"
        });

        $('#timePicker2').wickedpicker({
            timeSeparator: ':',
            now: "10:00:00",
            twentyFour: true,
            minutesInterval: 30,
            title: "시간선택"
        });

        $("#datepicker").datepicker({
            autoPick: true,
            autoHide: true,
            format: 'yyyy-mm-dd',
            startDate: new Date()
        });

        initCalendar();

        if (userDept === '인사') {
            bookList(allList);
        }

        $(document).on("click", '.deletebutton', function () {
            $.ajax({
                url: "deleteRoom.do",
                method: "post",
                data: {
                    "idx": $(this).closest('tr').children('td').eq(0).text(),
                    "room_num": $(this).closest('tr').children('td').eq(1).text()
                },
                datatype: "json",
                success: function (data) {
                    list = data.meetingroom;
                    allList = JSON.parse(data.allList);
                    clicked("room1");

                    $("#table").empty();
                    if (userDept === '인사') {
                        bookList(allList);
                    }
                }
            })
        })

    })

</script>
<style>
    html, body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px;
    }

    #calendar {
        max-width: 900px;
        margin: 40px auto;
    }
</style>
<body>
<div id="leftcontainer" style="float:left">
    예약하실 회의실을 선택해주세요.
    <br/>
    <div style="">
        <img src="/image/mr1.jpg" id="i1"></a>
        <img src="/image/mr2.jpg" id="i2"></a><br/>
        <img src="/image/mr3.jpg" id="i3"></a>
        <img src="/image/mr4.jpg" id="i4"></a>
    </div>
    <div>
        <form id="bookdata" method="post" action="/saveMeetingRoom.do">
            회의실 : <select name="room_num" id="room_num">
            <option value="room1">Room A</option>
            <option value="room2">Room B</option>
            <option value="room3">Room C</option>
            <option value="room4">Room D</option>
        </select><br/>
            날짜 : <input type="text" id="datepicker" name="book_date"/><br/>
            시간 : <input type="text" id="timePicker1" name="start"/> ~ <input type="text" id="timePicker2"
                                                                             name="end"/><br/>
            목적 : <input type="text" name="title" placeholder="회의실 대여 목적을 입력해주세요."/><br/>
            <input type=button value="예약" onclick="addList()"/>

        </form>
    </div>
</div>
<div id="calendar" style="margin:30px;width:700px;float:left"></div>
<div id="booklist"></div>


<table id="table" style="border:solid black 1px"/>


</body>

</html>
