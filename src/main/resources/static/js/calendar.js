function initCalendar(){

  calendarEl = document.getElementById('calendar');
calendar = new FullCalendar.Calendar(calendarEl, {
  plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
  locale: 'ko',
  defaultView: 'timeGridWeek',
  defaultDate: currentDate,
  weekends: false,
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
    listWeek: { buttonText: '이번주' }
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

function saveajax() {
  $.ajax({
    url : "saveMeetingRoom.do",
    method : "post",
    data : {
      "room_num" : $("#room_num").val(),
      "book_date" : $("input[name=book_date]").val(),
      "start" : $("input[name=start]").val(),
      "end" : $("input[name=end]").val(),
      "title" : $("input[name=title]").val()
    },
    datatype : "json",
    success : function (data) {
      list = data.meetingroom;
      allList = JSON.parse(data.allList);
      $("input[name=title]").val("");
      clicked($("#room_num").val());
      $("#booklist").empty();
      console.log("세이브으응");
      console.log(allList);
      bookList(allList);
    }
  })

}

function deleteajax() {

}
