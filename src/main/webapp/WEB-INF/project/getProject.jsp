<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>프로젝트상세</title>
    <script src='/js/jquery-3.4.1.min.js'></script>
    <style>
        .flex_div {
            display: flex;
        }
        #flex_div_children1 {
            width: 50%;
        }
        #flex_div_children2 {
            width: 50%;
            display: flex;
            justify-content: flex-end;
        }
    </style>
</head>
<body>
<div id="page-wrapper">
    <jsp:include page="../menu.jsp"/>
    <div class="container" style="margin-top:30px;">
        <div>
            <div class="page-header">
                <h3>프로젝트 상세보기</h3>
            </div>
            <table class="table table-bordered">
                <tr>
                    <th>프로젝트번호</th>
                    <td>${project.project_idx }</td>
                    <th>계약업체</th>
                    <td>${project.project_contractor }</td>
                    <th>등록일</th>
                    <td>${project.project_reg_date }</td>
                </tr>
                <tr>
                    <th>프로젝트명</th>
                    <td>${project.project_name }</td>
                    <th>계약금액</th>
                    <td><fmt:formatNumber pattern="##,###,###,###" value="${project.project_contract_amount }" />원</td>
                    <th>계약기간</th>
                    <td>${project.project_start_date }&nbsp;&nbsp;~&nbsp;${project.project_end_date }</td>
                </tr>
                <tr>
                    <th>책임자</th>
                    <td>${project.user_name }</td>
                    <th>진행상황</th>
                    <td>${project.project_progress }</td>
                <tr>
            </table>
            <table class="table table-bordered">
                <tr>
                    <th>담당자</th>
                    <th>소스번호(삭제예정)</th>
                    <th>기능</th>
                    <th>진행상황</th>
                </tr>
                <c:forEach var="source" items="${sourceList }">
                    <tr>
                        <td>${source.user_name }</td>
                        <td>${source.source_idx }</td>
                        <td><a href="getSource.do?source_idx=${source.source_idx }">${source.source_name }</a></td>
                        <td>${source.source_progress }</td>
                    </tr>
                </c:forEach>
            </table>
            <div class="flex_div">
                <div id="flex_div_children1">
                    <a href="modifyProject.do?project_idx=${project.project_idx }"><input type="button" value="수정"></a>
                    <a href="deleteProject.do?project_idx=${project.project_idx }"><input type="button" value="삭제"></a>
                </div>
                <div id="flex_div_children2">
                    <a href="getProjectList.do?currentPage=${pages.currentPage }&searchCondition=${pages.searchCondition }&searchKeyword=${pages.searchKeyword }"><input
                            type="button" value="돌아가기"></a>
                    <a href="getProjectList.do?currentPage=1"><input type="button" value="목록"></a>
                    <!-- 					<a href="getProjectList.do?currentPage=1&searchCondition=null&searchKeyword=null"><input type="button" value="목록"></a> -->
                    <a href="getCommute.do"><input type="button" value="메인"></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>