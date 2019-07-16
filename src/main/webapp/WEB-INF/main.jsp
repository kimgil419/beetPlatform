<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인화면</title>
   
    <script>

    </script>
    <style>
        .video-item img {
            max-width: 64px;
        }

        .video-detail .details {
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }


        .list-group-item {
            cursor: pointer;

        }

        .list-group-item:hover {
            background-color: #eee;
        }


        ul {
            float: right;
        }

        .notie {
            background-color: #808080;
        }

        #root {
            position: absolute;
            right: 0;

        }
    </style>
<body>

<div id="page-wrapper">
    <jsp:include page="menu.jsp"/>
    <div class="container" style="margin-top: 30px;">
        <!-- 유튜브 -->
        
        <div id="root" class="col-md-8"></div>
        <script src="/js/youtube-bundle.js"></script>

       
        <div class="row">
            <!-- 전자결재 -->
            <div class="col-md-6">
                <table class="table table-hover">
                    <tr>
                        <th colspan="7">직렬결재서류</th>
                    </tr>
                    <tr>
                        <th width="100">제목</th>
                        <th width="90">등록일</th>
                    </tr>
                    <c:forEach var="approval" items="${approvalListSerial}">
                            <tr>
                               
                                <td><a href="getApproval.do?a_num=${approval.a_num }">
                                        ${approval.a_title } </a></td>
                               
                                <td>${approval.regdate}</td>
                            </tr>
						</c:forEach>
                </table>


                <table class="table table-hover">
                    <tr>

                        <th colspan="7">병렬결재서류</th>
                    </tr>
                    <tr>
                        <th width="100">제목</th>
                        <th width="90">등록일</th>
                    </tr>
                    <c:forEach var="approval" items="${approvalListParallel}">          
                            <tr>
                                
                                <td><a href="getApproval.do?a_num=${approval.a_num }">
                                        ${approval.a_title } </a></td>
                              
                                <td>${approval.regdate}</td>
                            </tr>
                      
                    </c:forEach>
                </table>


            </div>


            <!-- 게시판 -->
            <div class="col-md-6">
                <form name="frm" method="post"
                      action="getBoardList.do?curPage=1&li=original">

                    <table class="table table-hover">
                        <tr>

                            <th colspan="3">사내전체게시판</th>
                            <th><input type="submit" value="더보기" onclick="send_go()"></th>
                        </tr>
                        <tr>

                            <th width="150">제목</th>

                            <th width="100">등록일</th>

                        </tr>


                        <c:forEach var="board" items="${BdList }">
                            <tr>

                                <td class=${(board.t_noti == 'Y') ? 'notie' : '' }><a
                                        href="getBoardInsert.do?seq=${board.seq }&curPage=1">
                                        ${board.t_title } </a></td>
                               
                                <td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.t_regdate }</td>
                                
                            </tr>
                        </c:forEach>


                    </table>
                </form>
                <form name="frmmm" method="post"
                      action="dpgetBoardList.do?curPage=1&li=original">
                    <table class="table table-hover">
                        <thead>
                        <tr>

                            <th colspan="3">부서게시판</th>
                            <th><input type="submit" value="더보기"></th>
                        </tr>
                        <tr>

                            <th width="150">제목</th>

                            <th width="100">등록일</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="board" items="${DpboardList }">
                            <tr>

                                <td class=${(board.t_noti == 'Y') ? 'notie' : '' }><img
                                        class="fancy"
                                        style="display: ${(board.t_password == null) ? 'none':'' };"
                                        src="image/icon_secret.gif" alt="titleImage"><a
                                        href="dpgetBoardInsert.do?seq=${board.seq }&curPage=1&t_password=${board.t_password}">
                                        ${board.t_title } </a></td>
                                
                                <td class=${(board.t_noti == 'Y') ? 'notie' : '' }>${board.t_regdate }</td>
                                
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </form>

            </div>

        </div>

    </div>

</div>
</body>
<script>
    $(document).ready(function () {

        // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
        var floatPosition = parseInt($("#root").css('top'));
        // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

        $(window).scroll(function () {
            // 현재 스크롤 위치를 가져온다.
            var scrollTop = $(window).scrollTop();
            var newPosition = scrollTop + floatPosition + "px";

            /* 애니메이션 없이 바로 따라감
             $("#floatMenu").css('top', newPosition);
             */

            $("#root").stop().animate({
                "top": newPosition
            }, 500);

        }).scroll();

    });
</script>
</html>