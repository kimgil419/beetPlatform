<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>
        .blog-header {
            line-height: 1;
            border-bottom: 1px solid #e5e5e5;
        }
        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: nowrap;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: 4px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
        .nav-scroller .nav-link {
            padding-top: .75rem;
            padding-bottom: .75rem;
            font-size: .875rem;
        }

        nav>a {
            margin-right: 15px;
            font-size: 16px;
        }


    </style>
</head>
<body>

<div class="container" style="max-width: 1240px;">
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <!-- Logo -->
            <div class="logo" style="float:left;">
                <a href="getCommute.do"><img src="image/logo.png" height="81px" alt=""></a>
            </div>
            <div style="clear: both;"></div>
            <!-- commute -->
            <form action="commute.do" method="post">
            
            <div style="float: right; margin-top: 15px;">

                <ul class="list-group" style="border:none;float:right;">
                    <li class="list-group-item" style="border:none;">
                    <input type="text" name="user_id" value=" ${userInfo.user_id } " readonly="readonly"

                                                                            style="width:80px;">
                        <input
                                type="text" name="user_name" value=" ${userInfo.user_name } 님 "
                                readonly="readonly" style="width:80px;">

                        <c:if test="${ccc == 'x' }">
                            <input type="button" value="출근" onclick="in_commute(this.form)">
                        </c:if>


                        <c:if
                                test="${ getCommute.user_id !='' and not empty getCommute.user_id }">
                            <input type="button" value="퇴근" onclick="out_commute(this.form)">
                        </c:if>
                    </li>
                </ul>
            </div>

            </form>
            <div style="clear: both;"></div>

        </div>
    </header>
    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-between" style="float: right;">
            <a class="p-2 text-muted" href="getApprovalList.do">전자결재</a>
            <a class="p-2 text-muted" href="getCommuteList.do">출결관리</a>
            <a class="p-2 text-muted" href="getProjectList.do?currentPage=1">프로젝트 관리</a>
            <a class="p-2 text-muted" href="getBoardList.do?curPage=1&li=original">사내게시판</a>
            <a class="p-2 text-muted" href="dpgetBoardList.do?curPage=1&li=original">부서게시판</a>
            <a class="p-2 text-muted"
            ${((userInfo.dept=='인사' && userInfo.user_position=='부장')
                    || (userInfo.dept=='인사' && userInfo.user_position=='대표이사')
                    || (userInfo.dept=='인사' && userInfo.user_position=='대리')
                    || (userInfo.dept=='인사' && userInfo.user_position=='과장')
                    || (userInfo.dept=='인사' && userInfo.user_position=='차장')) ? '' : 'hidden'}
               href="finsertUser.do"> 사원등록</a></li>
            <a class="p-2 text-muted" href="getMeetingRoomList.do">회의실 예약</a>
            <a class="p-2 text-muted" href="showEmployee.do">사원검색</a>
            <a class="p-2 text-muted" href="showEachEmployee.do">마이페이지</a>
        </nav>
    </div>

</div>
</body>
<script>
function in_commute(frm) {
	var result = confirm('출근 하시겠습니까?');

	if (result) {
		frm.action = "insertCommute.do"
		frm.submit();
	} else { //no
	}
};

function out_commute(frm) {
	var result = confirm('퇴근 하시겠습니까?');

	if (result) {
		frm.action = "updateCommute.do"
		frm.submit();
	} else { //no
	}
};
</script>
</html>