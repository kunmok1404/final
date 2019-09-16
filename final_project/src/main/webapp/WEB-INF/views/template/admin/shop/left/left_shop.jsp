<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--left 메뉴 시작-->
  <div class="left">
    <ul>
      <li><a href="${pageContext.request.contextPath}/shop_admin/shop/detail" ${url == '/shop_admin/shop/detail' ? 'class="on"' : ''}>매장정보</a></li>
    </ul>
  </div>  
  <!--left 메뉴 끝--> 