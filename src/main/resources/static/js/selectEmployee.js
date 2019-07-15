function selectEmployee(){
    employeeList.forEach(function (item) {
        var img = item.user_picture;
        var string =
            "<tr>" +
            "<td scope='col'>" +
            `<img style="width:30px;height:40px;" src="image/${img}" alt="프로필 사진">` +
            "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.user_name + "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.dept + "</td>" +
            "<td scope='col' style='padding-top:20px;'>" + item.user_position + "</td>" +
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
                '</tr>';
            userData.map((item)=>{
                listdata += item;
            });
            listdata += '</table>';
            $("#here").html(listdata);
        }
    });
}