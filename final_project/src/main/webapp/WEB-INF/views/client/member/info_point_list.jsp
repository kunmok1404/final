<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/client/info_top_menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>

<!--포인트 목록-->
    <div class="wrapper">
      <div class="row">
        <div class="col-md-12 myInfo-title">
          <div id="myInfo-wrapper">
            <div class="myInfo-line"></div>
          </div>
          <span>포인트관리</span>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-md-12">
          <table class="table table-hamburg text-center myInfo-table">
            <thead>
              <tr class="">
                <td style="width: 30%">내용</td>
                <td style="width: 20%">포인트</td>
                <td style="width: 20%">사용여부</td>
                <td style="width: 20%">일자</td>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="pointDto" items="${point_list}">
              <tr>
                <td>${pointDto.content}</td>
                <c:choose>
                	<c:when test="${pointDto.use_yn eq '적립'}">
                	<td style="color:blue;">+${pointDto.point}</td>
                	</c:when>
                	<c:otherwise>
                	<td style="color:red;">-${pointDto.point}</td>
                	</c:otherwise>
                </c:choose>
                <c:choose>
                	<c:when test="${pointDto.use_yn eq '적립'}">
                	<td style="color:blue;">${pointDto.use_yn}</td>
                	</c:when>
                	<c:otherwise>
                	<td style="color:red;">${pointDto.use_yn}</td>
                	</c:otherwise>
                </c:choose>
                <td>${pointDto.when}</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>