<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/client/info_top_menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>

   <!--리뷰 상세화면 시작-->
    <div class="wrapper">

      <div class="row">
        <div class="col-md-12 myInfo-title">
          <div id="myInfo-wrapper">
            <div class="myInfo-line"></div>
          </div>
          <span>후기상세화면</span>
        </div>
      </div><hr class="review-top">

      <div class="row">
        <div class="col-md-12">
          <table class="table table-hamburg">
            <tbody>
              <tr>
                <td class="review-title">매장</td>
                <td class="review-content">
                  <img src="https://placeimg.com/100/100/any">
                  <span>${shopDto.shop_name}</span>
                </td>
              </tr>
              <tr>
                <td class="review-title">메뉴</td>
                <td class="review-content">
                  <table class="table table-borderless">
	                  <tbody>
	                  	 <c:forEach var="order_distinct" items="${order_distinct}">
	                      <tr>
	                          <td class="Detail-menu">
	                              <span>${order_distinct.menu_name} x ${order_distinct.menu_amount}</span>
	                          </td>
	                          <td class="Detail-menu-price">
	                              <span>${order_distinct.menu_price}원</span>
	                          </td>
	                      </tr>
	                      </c:forEach>
	                      
						  <c:set var="loop1Flag" value="true"></c:set>
						  <c:forEach var="order_detail" items="${order_detail_list}">	
	                      <tr>
	                          <td class="Detail-menu-title">
	                          	 <c:if test="${loop1Flag && order_detail.sub_type eq '필수'}">
                                 	<span>[${order_detail.title}]</span>
                                	<c:set var="loop1Flag" value="false" />
   	                             </c:if>
	                          </td>
	                      </tr>
	                      </c:forEach>
	                      
	                      <c:forEach var="order_detail" items="${order_detail_list}">
	                       <c:if test="${order_detail.sub_type eq '필수'}">
	                        <tr>
	                            <td class="Detail-subMenu-name">
	                                <span>-${order_detail.sub_name} :</span>
	                            </td>
	                            <td class="Detail-subMenu-price">
	                                <span>+${order_detail.sub_price}원</span>
	                            </td>
	                        </tr>
	                       </c:if>
	                      </c:forEach>
	                      
	                      <c:set var="loop1Flag" value="true"></c:set>
						  <c:forEach var="order_detail" items="${order_detail_list}">	
	                      <tr>
                     	     <td class="Detail-menu-title">
                      	       <c:if test="${loop1Flag && order_detail.sub_type eq '선택'}">
                               <span>[${order_detail.title}]</span>
                               <c:set var="loop1Flag" value="false" />
	    	 			       </c:if>
                             </td>
	                       </tr>
	                      </c:forEach>
	                      
	                      <c:forEach var="order_detail" items="${order_detail_list}">
	                       <c:if test="${order_detail.sub_type eq '선택'}">
	                        <tr>
	                            <td class="Detail-subMenu-name">
	                                <span>-${order_detail.sub_name} :</span>
	                            </td>
	                            <td class="Detail-subMenu-price">
	                                <span>+${order_detail.sub_price}원</span>
	                            </td>
	                        </tr>
	                       </c:if>
	                      </c:forEach>
	                      
	                  </tbody>
	              </table>
                </td>
              </tr>
              <tr>
                <td class="review-text">별점</td>
                <td class="review-content">
                  <span>${reviewDto.score}</span>
                </td>
              </tr>
              <tr>
                <td class="review-text">조회수</td>
                <td class="review-content">
                  <span>${reviewDto.read}</span>
                </td>
              </tr>
              <tr>
                <td class="review-text">작성일</td>
                <td class="review-content">
                  <span>${reviewDto.regist_date}</span>
                </td>
              </tr>
              <tr>
                <td class="review-text">제목</td>
                <td class="review-content">
                  	<span>${reviewDto.title}</span>
                </td>
              </tr>
              <tr>
                <td class="review-title" rowspan="3">내용</td>
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
          <div class="text-center">
          	<a href="${pageContext.request.contextPath}/review/edit?review_code=${reviewDto.no}" class="btn btn-danger">수정하기</a>
          	<a href="${pageContext.request.contextPath}/review/list" class="btn btn-info">목록</a>
          </div>
        </div>
      </div>

    </div>
    <!--리뷰상세화면 끝-->