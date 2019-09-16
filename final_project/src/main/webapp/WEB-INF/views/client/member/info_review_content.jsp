<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>

   <!--리뷰 상세화면 시작-->
    <div class="wrapper">

	  <br>
      <div class="row">
        <div class="col-md-12 myInfo-title">
          <div id="myInfo-wrapper">
            <div class="myInfo-line"></div>
          </div>
          <span class="font-weight-bold">후기상세화면</span>
        </div>
      </div><hr class="review-top">

      <div class="row">
        <div class="col-md-12">
          <table class="table table-hamburg">
            <tbody>
              <tr>
                <td class="review-title" rowspan="2">매&nbsp장</td>
                <td class="review-content">
                  <img class="shop-list-img" src="${pageContext.request.contextPath}/review/review_img?files_code=${shopDto.shop_img}">
                </td>
              </tr>
              <tr>
              	<td class="shop-name-title"><span class="font-weight-bold align-middle shop-name-title pl-5">${shopDto.shop_name}</span></td>
              </tr>
              <tr>
                <td class="review-title">메&nbsp뉴</td>
                <td class="review-content">
                  <table class="table table-borderless">
	                  <tbody>
	                  	 <c:forEach var="order_menu" items="${order_detail_list}">
                            <tr>
                                <td class="Detail-menu">
                                    <span>${order_menu.menu_name} x ${order_menu.menu_amount}</span>
                                </td>
                                <td class="Detail-menu-price">
                                    <span>${order_menu.menu_price}원</span>
                                </td>
                            </tr>
                        </c:forEach>
	                  </tbody>
	              </table>
                </td>
              </tr>
              <tr>
                <td class="review-text review-title">별&nbsp점</td>
                <td class="review-content">
                  <span>${reviewDto.score}</span>
                </td>
              </tr>
              <tr>
                <td class="review-text review-title">조회수</td>
                <td class="review-content">
                  <span>${reviewDto.read}</span>
                </td>
              </tr>
              <tr>
                <td class="review-text review-title">작성일</td>
                <td class="review-content">
                  <span>${reviewDto.regist_date}</span>
                </td>
              </tr>
              <tr>
                <td class="review-text review-title">제&nbsp목</td>
                <td class="review-content">
                  	<span>${reviewDto.title}</span>
                </td>
              </tr>
              <tr>
                <td class="review-title" rowspan="3">내&nbsp용</td>
                <td class="review-content pl-4">
					<span>${reviewDto.content}</span>
                </td>
              </tr>
              <tr>
                <td>
                	<c:forEach var="imgDto" items="${img_list}">
                	<c:if test="${imgDto.files_no > 0}">
					<img class="review-img" src="${pageContext.request.contextPath}/review/review_img?files_code=${imgDto.files_no}">
                	</c:if>
                	</c:forEach>
                </td>
              </tr>
            </tbody>
          </table>
          <br><br>
          <div class="text-center">
<%--           	<a href="${pageContext.request.contextPath}/review/edit?review_code=${reviewDto.no}" class="btn btn-lg btn-danger">수정하기</a> --%>
          	<a href="${pageContext.request.contextPath}/review/list" class="btn btn-info btn-lg ml-5">목 록</a>
          </div>
        </div>
      </div>

    </div><br><br><br><br><br>
    <!--리뷰상세화면 끝-->