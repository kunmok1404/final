<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
    <!--나의정보 left메뉴-->
    <div class="myInfo-box">
      <div class="myInfo-left">
        <header class="my-Info">나의 정보</header>
        <div ${url == '/member/info_order_list' ? 'class="on"' : ''}>
          <span><a href="${pageContext.request.contextPath}/member/info_order_list">주문내역</a></span>
        </div>
        <div ${url == '/review/list' ? 'class="on"' : ''}>
          <span><a href="${pageContext.request.contextPath}/review/list">리뷰관리</a></span>
        </div>
        <div ${url == '/coupon/list' ? 'class="on"' : ''}>
          <span><a href="${pageContext.request.contextPath}/coupon/list">나의쿠폰</a></span>
        </div>
        <div ${url == '/point/list' ? 'class="on"' : ''}>
          <span><a href="${pageContext.request.contextPath}/point/list">포인트</a></span>
        </div>
        <div ${url == '/member/myshop' ? 'class="on"' : ''}>
          <span><a href="${pageContext.request.contextPath}/member/myshop">찜한매장</a></span>
        </div>
        <div ${url == '/member/info_check' ? 'class="on"' : ''}>
          <span><a href="${pageContext.request.contextPath}/member/info_check">개인정보수정</a></span>
        </div>
      </div>
    </div>