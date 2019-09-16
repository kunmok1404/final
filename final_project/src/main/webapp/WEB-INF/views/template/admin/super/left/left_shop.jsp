<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--left 메뉴 시작-->
  <div class="left">
    <ul>
      <li><a href="${pageContext.request.contextPath}/super_admin/shop/list" ${url == '/shop_admin/shop/list' ? 'class="on"' : ''}>매장목록</a></li>
      <li><a href="#">승인대기중(00)</a></li>
    </ul>
  </div>  
  <!--left 메뉴 끝--> 