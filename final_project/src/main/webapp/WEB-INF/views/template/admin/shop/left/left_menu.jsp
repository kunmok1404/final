<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${requestScope['javax.servlet.forward.servlet_path']}"/>

  <!--left 메뉴 시작-->
  <div class="left">
    <ul>
      <li><a href="${pageContext.request.contextPath}/shop_admin/menu/list" ${url == '/shop_admin/menu/list' ? 'class="on"' : ''}>메뉴목록</a></li>
      <li><a href="${pageContext.request.contextPath}/shop_admin/menu/regist" ${url == '/shop_admin/menu/regist' ? 'class="on"' : ''}>메뉴등록</a></li>
      <li><a href="${pageContext.request.contextPath}/shop_admin/menu/category" ${url == '/shop_admin/menu/category' ? 'class="on"' : ''}>메뉴카테고리</a></li>
    </ul>
  </div>  
  <!--left 메뉴 끝-->  