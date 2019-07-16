<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        .content {
        	width: 160px;
        	text-overflow:ellipsis; overflow:hidden; white-space:nowrap;
        	word-wrap: normal !important;
    display: block;
        }
        .element-tbody {
        	line-height: 19px;
        }
        
    </style>
<body>
<div id="page-wrapper">
    <jsp:include page="menu.jsp"/>
    <div class="container" style="margin-top: 30px;">
        <!-- 유튜브 -->
        <div id="root" class="col-md-8"></div>
        <script src="/js/youtube-bundle.js"></script>
        <div class="row col-md-9">
            <div class="col-md-4">
            	<h5>
					<a href="#"><i class="fas fa-search-plus"></i></a>
					<small class="text-muted">직렬결재</small>
				</h5>
                <table class="table table-hover">
                	<thead>
	                    <tr class="element-thead">
	                        <th class="table-subject">제목</th>
	                        <th class="table-regdate">등록일</th>
	                    </tr>
					</thead>
					<tbody>
	                    <c:forEach var="approval" items="${approvalListSerial}">
	                    	<fmt:parseDate value="${approval.regdate }" var="dateFmt" pattern="yyyy-MM-ddHH:mm:ss" />
                            <tr class="element-tbody">
                                <td class="content"><a href="getApproval.do?a_num=${approval.a_num }">${approval.a_title } </a></td>
                                <td class="regdate"><fmt:formatDate value="${dateFmt }" pattern="yy/MM/dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
                </table>
			</div>
			<div class="col-md-4">
				<h5>
					<a href="#"><i class="fas fa-search-plus"></i></a>
					<small class="text-muted">병렬결재</small>
				</h5>
                <table class="table table-hover">
                	<thead>
	                    <tr class="element-thead">
	                        <th class="table-subject">제목</th>
	                        <th class="table-regdate">등록일</th>
	                    </tr>
					</thead>
                	<tbody>
	                    <c:forEach var="approval" items="${approvalListParallel}">
	                    	<fmt:parseDate value="${approval.regdate }" var="dateFmt" pattern="yyyy-MM-ddHH:mm:ss" />        
                            <tr>
                                <td class="content"><a href="getApproval.do?a_num=${approval.a_num }">${approval.a_title } </a></td>
                                <td class="regdate"><fmt:formatDate value="${dateFmt }" pattern="yy/MM/dd" /></td>
                            </tr>
	                    </c:forEach>
                	</tbody>
                </table>
			</div>             
			<div class="col-md-4">
				<h5>
					<a href="#"><i class="fas fa-search-plus"></i></a>
					<small class="text-muted">사내게시판</small>
				</h5>
				<table class="table table-hover">
					<thead>
	                    <tr class="element-thead">
	                        <th class="table-subject">제목</th>
	                        <th class="table-regdate">등록일</th>
	                    </tr>
					</thead>
					<tbody>
	                    <c:forEach var="board" items="${BdList }">
	                    	<fmt:parseDate value="${board.t_regdate }" var="dateFmt" pattern="yyyy-MM-ddHH:mm:ss" />
	                        <tr class="element-tbody">
	                            <td class="${(board.t_noti == 'Y') ? 'notie' : '' } content"">
	                            	<a href="getBoardInsert.do?seq=${board.seq }&curPage=1">${board.t_title }</a></td>
	                            <td class="${(board.t_noti == 'Y') ? 'notie' : '' } regdate"><fmt:formatDate value="${dateFmt }" pattern="yy/MM/dd" /></td>
	                        </tr>
	                    </c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-4">
				<h5>
					<a href="#"><i class="fas fa-search-plus"></i></a>
					<small class="text-muted">부서게시판</small>
				</h5>
				<table class="table table-hover">
					<thead>
						<thead>
	                    <tr class="element-thead">
	                        <th class="table-subject">제목</th>
	                        <th class="table-regdate">등록일</th>
	                    </tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${DpboardList }">
							<fmt:parseDate value="${board.t_regdate }" var="dateFmt" pattern="yyyy-MM-ddHH:mm:ss" />
	                    	<tr class="element-tbody">
	                        	<td class="${(board.t_noti == 'Y') ? 'notie' : '' } content">
	                        		<img class="fancy" style="display: ${(board.t_password == null) ? 'none':'' };" src="image/icon_secret.gif" alt="titleImage"><a
	                                       href="dpgetBoardInsert.do?seq=${board.seq }&curPage=1&t_password=${board.t_password}">
	                                       ${board.t_title } </a>
								</td>
								<td class="${(board.t_noti == 'Y') ? 'notie' : '' } regdate"><fmt:formatDate value="${dateFmt }" pattern="yy/MM/dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
	        <div class="col-md-4">
	        	<h5>
					<a href="getProjectList.do"><i class="fas fa-search-plus"></i></a>
					<small class="text-muted">프로젝트</small>
				</h5>
				<table class="table table-hover">
					<thead>
	                    <tr class="element-thead">
	                        <th class="table-subject">제목</th>
	                        <th class="table-regdate">등록일</th>
	                    </tr>
					</thead>
					<tbody>
						<c:forEach var="project" items="${projectList }">
							<fmt:parseDate value="${project.project_reg_date }" var="dateFmt" pattern="yyyy-MM-ddHH:mm:ss" />
							<tr class="element-tbody">
								<td class="content"><a href="getProject.do?project_idx=${project.project_idx }">${project.project_name }</a></td>
								<td class="regdate"><fmt:formatDate value="${dateFmt }" pattern="yy/MM/dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>        
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