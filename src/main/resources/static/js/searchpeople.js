function searchpeople(){
    employeelist.forEach(function (item) {
        var img = item.user_picture;
        var string =
            "<tr>" +
            "<td scopr='col'>" +
            `<img style="width:30px;height:40px;" src="image/${img}" alt="프로필 사진">` +
            "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.user_name + "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.dept + "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.user_position + "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.firstjoin + "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.user_email + "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.cphone + "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.phone + "</td>" +
            "</tr>";
        list.push(string);
    })

    $('#pagination-bar').pagination({
        dataSource: list,
        pageSize: 10,
        autoHidePrevious: true,
        autoHideNext: true,
        callback: function (data) {
            var userData = data;
            var listdata = '<table class="table table-hover"><tr>' +
                '<th scope="col" style="text-align: center;">사진</th>' +
                '<th scope="col" style="text-align: center;">이름</th>' +
                '<th scope="col" style="text-align: center;">부서</th>' +
                '<th scope="col" style="text-align: center;">직급</th>' +
                '<th scope="col" style="text-align: center;">입사일</th>' +
                '<th scope="col" style="text-align: center;">이메일</th>' +
                '<th scope="col" style="text-align: center;">핸드폰번호</th>' +
                '<th scope="col" style="text-align: center;">내선번호</th>' +
                '</tr>';
            userData.map((item)=>{
                listdata += item;
            });
            listdata += '</table>';
            $("#here").html(listdata);
        }
    });
}