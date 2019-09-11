<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--left 메뉴 시작-->
  <div class="left">
    <ul>
      <li><a href="${pageContext.request.contextPath}/super_admin/review/list" ${url == '/shop_admin/review/list' ? 'class="on"' : ''}>리뷰목록</a></li>
    </ul>
  </div>  
  <!--left 메뉴 끝--> 