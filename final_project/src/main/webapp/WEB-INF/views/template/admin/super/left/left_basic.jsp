<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--left 메뉴 시작-->
  <div class="left">
    <ul>
      <li><a href="${pageContext.request.contextPath}/super_admin/basic/terms" ${url == '/shop_admin/basic/terms' ? 'class="on"' : ''}>약관관리</a></li>
      <li><a href="${pageContext.request.contextPath}/super_admin/basic/food_category" ${url == '/shop_admin/basic/food_category' ? 'class="on"' : ''}>음식카테고리</a></li>
    </ul>
  </div>  
  <!--left 메뉴 끝--> 