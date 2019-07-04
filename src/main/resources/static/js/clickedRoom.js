function clicked(room_num) {

        $.ajax({
            url: "/selectroom.do",
            data: "room_num=" + room_num,
            datatype: "json",
            success: function (data) {
                list = JSON.parse(data.meetingroom);
                allList = JSON.parse(data.allList);

                $("#calendar").empty();
                calendar = new FullCalendar.Calendar(calendarEl, {
                    plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
                    locale: 'ko',
                    defaultView: 'timeGridWeek',
                    defaultDate: currentDate,
                    minTime: "08:00:00",
                    maxTime: "20:00:00",
                    height: 600,
                    width: 300,
                    buttonText: {
                        today: '오늘',
                        timeGridDay: '오늘',
                        timeGridWeek: '이번주'
                    },
                    views:{
                        listDay: { buttonText: '금일' },
                        listWeek: { buttonText: '이번주' },
                    },
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'listDay,timeGridWeek,timeGridDay'
                    },
                    events: list
                });
                calendar.render();
            }
        })
}