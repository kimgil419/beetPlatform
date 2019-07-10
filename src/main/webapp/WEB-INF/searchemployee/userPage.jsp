<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Mypage</title>
</head>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script>

    $(function () {

        $("input[name='originalpassword']").on("focusout", function () {

            var user_password = $("input[name='originalpassword']").val();

            $.ajax({
                url: "checkpassword.do",
                method: "post",
                data: "user_password=" + user_password,
                datatype: "json",
                success: function (data) {
                    if (data == null) {
                        $("input[name='originalpassword']").css("border", "solid 2px red");
                        $("#forerror").css({"font-size": "12px", "color": "red"}).text("잘못된 비밀번호입니다.");
                        $("input[name='changepassword']").attr('disabled', true);

                    } else {
                        $("input[name='originalpassword']").css("border", "solid 2px green");
                        $("#forerror").css({"font-size": "12px", "color": "green"}).text("변경할 비밀번호를 입력하세요.");
                        $("input[name='changepassword']").attr('disabled', false);
                    }
                }
            })
        })

        $("input[name='changepassword']").on("click", function () {

            var user_password = $("input[name='passwordwannachange']").val();

            if(user_password == ""){
                alert("비밀번호를 입력해주세요.");
                user_password.focus();
                return false;
            }

            $.ajax({
                url: "changepassword.do",
                method: "post",
                data: "user_password=" + user_password ,
                datatype: "text",
                success: function () {
                    alert("정상 변경되었습니다");
                    location.reload();
                }

            })
        })

    })

</script>
<style>
.container {
    font-size: 16px;
}
</style>
<body>
<div id="page-wrapper">
    <jsp:include page="../menu.jsp"/>

<div class="container">
<div style="float:left;">
    <img class="img-fluid float-left" src="image/${list.user_picture}" alt="프로필 사진">

</div>
<div style="margin-left:50px;float:left;">
    <ul class="list-group">
        이름
    <li class="list-group-item">${list.user_name}</li>
        <br/>
        부서
    <li class="list-group-item">${list.dept} </li>
        <br/>
        직급
    <li class="list-group-item">${list.user_position}</li>
        <br/>
        이메일
    <li class="list-group-item">${list.user_email} </li>
        <br/>
        입사일
    <li class="list-group-item">${list.firstjoin} </li>
        <br/>
        핸드폰번호
    <li class="list-group-item">${list.phone}</li>
        <br/>
        비밀번호 변경
        <li class="list-group-item">
        <form style="margin-bottom: 7px;">
            기존 비밀번호<br/>
            <input type="text" name="originalpassword" style="margin-top:7px;">
            <div id="forerror"></div>
            <br/>
            변경 비밀번호<br/>
            <input type="text" name = "passwordwannachange">
            <input type="button" value="변경" name="changepassword" disabled>
        </form>
        </li>

    </ul>
</div>
</div>
</div>
</body>
</html>
