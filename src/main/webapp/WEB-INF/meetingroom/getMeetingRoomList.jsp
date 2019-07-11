<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
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
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js" data-auto-replace-svg="nest"></script>

<script>

    var list = ${meetingRoomList};
    var currentDate = new Date();
    var calendarEl;
    var calendar;
    var allList = ${allList};
    var userDept = `${userDept}`;


    function addList() {

        const useDate = new Date();
        const nowTime = useDate.getHours() + ":" + useDate.getMinutes();

        if($("#timePicker1").val() < nowTime){
            alert("시작시간이 현재보다 이른 시간입니다.");
            return false;
        }

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

                    $("#booktable").empty();
                    if (userDept === '인사') {
                        bookList(allList);
                    }
                }
            })
        })

    })

</script>
<style>

    tr {
        text-align: center;
    }

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

    table {
        font-size: 0.85rem;
    }

    input {
        font-size: 0.85rem;
    }

</style>
<body>
<div id="page-wrapper">
    <jsp:include page="../menu.jsp"/>
    <div class="container" style="margin-top:30px;padding-left: 0px;padding-right: 0px;max-width: 1240px;">
        <div style="float:left;">
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-calendar-alt"></i> <b>회의실 예약</b>
                <br/>
                <div style="margin-left:15px;">
                    <div class="imgcontainer" style="float: left;margin: 5px;">
                        <img src="/image/mr1.jpg" id="i1" class="mx-auto d-block"></a>
                        <div class="overlay">
                            <div class="text">Room1</div>
                        </div>
                    </div>
                    <div class="imgcontainer" style="display:inline-block;margin: 5px;">
                        <img src="/image/mr2.jpg" id="i2" class="mx-auto d-block" style=""></a>
                        <div class="overlay">
                            <div class="text">Room2</div>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                    <div class="imgcontainer" style="float: left;margin: 5px;">
                        <img src="/image/mr3.jpg" id="i3" class="mx-auto d-block"></a>
                        <div class="overlay">
                            <div class="text">Room3</div>
                        </div>
                    </div>

                    <div class="imgcontainer" style="display:inline-block;margin: 5px;">
                        <img src="/image/mr4.jpg" id="i4" class="mx-auto d-block"></a>
                        <div class="overlay">
                            <div class="text">Room4</div>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
            <div>
                <form id="bookdata" method="post" action="/saveMeetingRoom.do">
                    <div style="margin-left:20px;float:left">
                        <label style="font-size: 0.85rem">회의실 : </label><select name="room_num" id="room_num" class="form-control" style="font-size: 0.85rem;">
                        <option value="room1">Room A</option>
                        <option value="room2">Room B</option>
                        <option value="room3">Room C</option>
                        <option value="room4">Room D</option>
                    </select>
                    </div>
                    <div style="margin-left:30px;float:left;width:100px;">
                        <label style="font-size: 0.85rem">날짜 : </label><input type="text" id="datepicker" class="form-control"
                                                   name="book_date" style="font-size: 0.85rem;"/><br/>
                        <label style="font-size: 0.85rem">시작시간 : </label><input type="text" id="timePicker1" class="form-control"
                                                     name="start" style="font-size: 0.85rem;"/><br/>
                        <label style="font-size: 0.85rem">종료시간 :
                        </label><input type="text" id="timePicker2" class="form-control" name="end" style="font-size: 0.85rem;"/>
                    </div>
                    <div style="margin-left:30px;float:left">
                        <label style="font-size: 0.85rem">목적 : </label><input type="text" name="title" class="form-control"
                                                   style="width:250px;font-size: 0.85rem"
                                                   placeholder="회의실 대여 목적을 입력해주세요."/><br/>
                        <input type=button value="예약" style="float:right;" onclick="addList()"/>
                        <div style="clear: both;"></div>
                    </div>
                </form>
            </div>
        </div>
        <div style="float:left;">
            <div>
                <div id="calendar" style="margin:30px;width:630px;"></div>
                <div id="booklist"> <table id="booktable" class="table table-hover" style="margin-left:20px;width:650px"/></div>

            </div>
        </div>
    </div>
</div>
</body>
</html>