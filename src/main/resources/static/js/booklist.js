function bookList(allList) {

    var allList = allList;
    var string1 =
        "<tr>" +
        "<th scope='col'>예약번호</th>" +
        "<th scope='col'>회의실번호</th>" +
        "<th scope='col'>시작시간</th>" +
        "<th scope='col'>종료시간</th>" +
        "<th scope='col'>부서</th>" +
        "<th scope='col'>예약일</th>" +
        "<th scope='col'>이름</th>" +
        "<th scope='col'>목적</th>" +
        "<th scope='col'>삭제</th>" +
        "</tr>";
    $("#table").append(string1);

    allList.forEach(function (item) {
        var string2 =
            "<tr scope='row'>" +
            "<td>" + item.idx + "</td>" +
            "<td>" + item.room_num + "</td>" +
            "<td>" + item.start + "</td>" +
            "<td>" + item.end + "</td>" +
            "<td>" + item.dept + "</td>" +
            "<td>" + item.book_date + "</td>" +
            "<td>" + item.user_name + "</td>" +
            "<td>" + item.title + "</td>" +
            "<td><button class='deletebutton'><i class='fas fa-trash-alt'></i></td>" +
            "</tr>";
        $("#table").append(string2);

    })

}