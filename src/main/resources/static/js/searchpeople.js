function searchpeople(){
    employeelist.forEach(function (item) {
        var string =
            "<tr>" +
            "<td>" + item.user_name + "</td>" +
            "<td>" + item.dept + "</td>" +
            "<td>" + item.user_position + "</td>" +
            "<td>" + item.firstjoin + "</td>" +
            "<td>" + item.user_email + "</td>" +
            "<td>" + item.cphone + "</td>" +
            "<td>" + item.phone + "</td>" +
            "</tr>";
        list.push(string);
    })

    $('#pagination-bar').pagination({
        dataSource: list,
        pageSize: 10,
        autoHidePrevious: true,
        autoHideNext: true,
        callback: function (data, pagination) {
            var html = template(data);
            $('#pagination-data-container').html(html);
        }
    });
}