<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--음식 카테고리-->
    <div class="food-category">
      <div class="container">
        <div class="col-md-12">
          <ul class="food-list">
            <li><img src="${pageContext.request.contextPath}/resources/image/food.png"></li>
            <li><a href="${pageContext.request.contextPath}/shop/list?cat_no=0">전체보기</a></li>
            <c:forEach var="catDto" items="${cat_list}">
            <li class="${catDto.no eq cat_no?'on':''}">
            	<a href="${pageContext.request.contextPath}/shop/list?cat_no=${catDto.no}">${catDto.name}</a>
            </li>
            </c:forEach>
          </ul>
        </div>
      </div>
    </div>