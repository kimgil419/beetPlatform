function bookList(allList) {

    var allList = allList;
    var string1 =
        "<tr>" +
        "<th>예약번호</th>" +
        "<th>회의실번호</th>" +
        "<th>시작시간</th>" +
        "<th>종료시간</th>" +
        "<th>부서</th>" +
        "<th>예약일</th>" +
        "<th>이름</th>" +
        "<th>목적</th>" +
        "<th>삭제</th>" +
        "</tr>";
    $("#table").append(string1);

    allList.forEach(function (item) {
        var string2 =
            "<tr>" +
            "<td >" + item.idx + "</td>" +
            "<td>" + item.room_num + "</td>" +
            "<td>" + item.start + "</td>" +
            "<td>" + item.end + "</td>" +
            "<td>" + item.dept + "</td>" +
            "<td>" + item.book_date + "</td>" +
            "<td>" + item.user_name + "</td>" +
            "<td>" + item.title + "</td>" +
            "<td><button class='deletebutton'>삭제</td>" +
            "</tr>";
        $("#table").append(string2);

    })

}