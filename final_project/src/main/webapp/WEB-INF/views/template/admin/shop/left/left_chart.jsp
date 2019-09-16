<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--left 메뉴 시작-->
  <div class="left">
    <ul>
      <li><a href="${pageContext.request.contextPath}/shop_admin/chart/order" ${url == '/shop_admin/chart/order' ? 'class="on"' : ''}>매출 분석</a></li>
      <li><a href="${pageContext.request.contextPath}/shop_admin/chart/sale" ${url == '/shop_admin/chart/sale' ? 'class="on"' : ''}>주문 분석</a></li>
    </ul>
  </div>  
  <!--left 메뉴 끝--> 