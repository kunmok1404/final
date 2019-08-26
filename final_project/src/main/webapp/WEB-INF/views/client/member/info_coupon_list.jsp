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
          <span>나의 쿠폰</span>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-md-12">
          <table class="table table-hamburg text-center myInfo-table">
            <thead>
              <tr class="">
                <td style="width: 30%">쿠폰명</td>
                <td style="width: 20%">조건</td>
                <td style="width: 20%">사용기한</td>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="couponDto" items="${coupon_list}">
              <tr>
                <td>${couponDto.name}</td>
                <c:choose>
                	<c:when test="${couponDto.discount_type eq '할인금액'}">
                	<td style="color:blue;">전&nbsp메뉴&nbsp${couponDto.discount_price}원&nbsp할인</td>
                	</c:when>
                	<c:otherwise>
                	<td style="color:blue;">
                		전&nbsp메뉴&nbsp${couponDto.discount_price}%&nbsp할인(최대${couponDto.max_price}원)
                	</td>
                	</c:otherwise>
                </c:choose>
                <td>${couponDto.start_date}<br>~&nbsp${couponDto.finish_date}</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>