<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--left 메뉴 시작-->
  <div class="left">
    <ul>
      <li><a href="${pageContext.request.contextPath}/super_admin/menu/list" ${url == '/shop_admin/menu/list' ? 'class="on"' : ''}>메뉴 목록</a></li>
    </ul>
  </div>  
  <!--left 메뉴 끝--> 