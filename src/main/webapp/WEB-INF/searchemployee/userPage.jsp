<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Mypage</title>
</head>
<script src="js/jquery-3.4.1.min.js"></script>
<script>

    $(function () {

        $("input[name='originalpassword']").on("focusout", function () {

            var user_password = $("input[name='originalpassword']").val();

            console.log(user_password);
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
                        $("input[name='passwordwannachange']").focus();
                        $("input[name='changepassword']").attr('disabled', false);
                    }
                }
            })
        })

        $("input[name='changepassword']").on("click", function () {

            if($("input[name='changepassword']").val() == ""){
                return false;
            }

            var user_password = $("input[name='passwordwannachange']").val();

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


<div style="width:20%">
    <img src="/image/mr1.jpg">
</div>
<div style="width:80%">
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

</body>
</html>
