<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/client/info_top_menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>
		<div class="wrapper mt-3">
<table class="table table-hamburg table-hover">
  <tr class="table-primary text-center">
  	<th>매장이미지</th>
    <th>매장명</th>
    <th>평점</th>
    <th>찜한 날짜</th>
  </tr>
<c:forEach var="shop" items="${shop }">
  <tr class="table text-center">
  	<td>
  	<img class="review-img" src="${pageContext.request.contextPath}/member/shop_img?files_code=${shop.shop_img}">
  	</td>
   	<td>${shop.shop_name }</td>
   	<td>${shop.score }</td>
   	<c:forEach var="list" items="${list }">
   	<c:if test="${shop.no == list.shop_code }">
   	<td>${list.regist_date}</td>
   	</c:if>
   	</c:forEach>
  </tr>
</c:forEach>
</table>
</div>