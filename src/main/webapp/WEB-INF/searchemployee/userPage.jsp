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
                        $("#forerror").css({"font-size": "14px", "color": "red"}).text("잘못된 비밀번호입니다.");
                        $("input[name='changepassword']").attr('disabled', true);

                    } else {
                        $("input[name='originalpassword']").css("border", "solid 2px green");
                        $("#forerror").text("");
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
<body>
<div id="page-wrapper">
    <jsp:include page="menu.jsp"/>


<div style="width:20%">
    <img src="/image/mr1.jpg">
</div>
<div class="form-group" style="width:80% ">
    이름: ${list.user_name} <br/>
    부서: ${list.dept} <br/>
    직급: ${list.user_position} <br/>
    이메일: ${list.user_email} <br/>
    입사일: ${list.firstjoin} <br/>
    핸드폰번호: ${list.phone}
    <fieldset>
        <legend>비밀변호 변경</legend>
        <form>
            기존비밀번호: <input type="text" name="originalpassword">
            <span id="forerror"></span>
            <br/>
            변경비밀번호: <input type="text" name = "passwordwannachange">
            <input type="button" value="변경" name="changepassword" disabled>
        </form>
    </fieldset>
</div>
</div>
</body>
</html>
