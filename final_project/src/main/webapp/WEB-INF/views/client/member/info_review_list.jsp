<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/client/info_top_menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>
<!--주문내역 contents-->
    <div class="wrapper">
      <div class="row">
        <div class="col-md-12 myInfo-title">
          <div id="myInfo-wrapper">
            <div class="myInfo-line"></div>
          </div>
          <span>리뷰관리</span>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-md-12">
          <table class="table table-bordered text-center myInfo-table">
            <thead>
              <tr>
                <td style="width: 5%">번호</td>
                <td style="width: 25%">매장</td>
                <td style="width: 35%">제목</td>
                <td style="width: 10%">별점</td>
                <td style="width: 15%">작성일</td>
                <td style="width: 10%">조회수</td>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="review_list" items="${list}">
              <tr>
                <td width="5%">${review_list.no}</td>
                <td width="25%">
<!--                 <img src="https://placeimg.com/100/100/any"> -->
                ${review_list.shop_name}
                </td>
                <td width="30%"><a href="${pageContext.request.contextPath}/review/content?review_code=${review_list.no}">리뷰작성</a></td>
                <td width="10%">${review_list.score}</td>
                <td width="20%">${review_list.regist_date}</td>
                <td width="10%">${review_list.read}</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>