<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>뭐먹지?</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/pkmadmin.css" rel="stylesheet">
    <script>
      $(function(){
        // top-menu 하이라이트 효과
        $(".top-menu ul li").click(function(){
          $(".top-menu ul li").removeClass("active");
          $(this).addClass("active");
        })

        // left-menu 하이라이트 효과
        $(".left ul li a").click(function(){
          $(".left ul li a").removeClass("on");
          $(this).addClass("on");
        })
        
        // 뭐먹지 바로가기 클릭
        $("#client-site").click(function(){
        	window.open("${pageContext.request.contextPath}/");
        })
        
      })
    </script>
</head>
<body>
    <header>
        <!--네비게이션 영역시작-->
        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="${pageContext.request.contextPath}/super_admin">
                <img alt="Brand" src="${pageContext.request.contextPath}/resources/image/logo.jpg">
              </a>
            </div>
            <div class="header-button"> 
              <span class="owner"><a href="#">*안녕하세요. 박근목 사장님!</a></span>
              <span class="loginTime"><a href="#">최종접속일자 : 2019.08.10 17:30</a></span>
              <a href="#" class="btn btn-light btn-sm">로그아웃</a>
              <a href="#" class="btn btn-light btn-sm" id="client-site">뭐먹지 바로가기</a>
            </div>
          </div>
        </nav>
        <!--네비게이션 영역 끝-->

        <!--상단메뉴 시작-->
        <div class="top-menu">
          <ul>
            <li ${url == '/super_admin/basic/terms' ? 'class="active"' : ''}><a href="${pageContext.request.contextPath}/super_admin/basic/terms">기본설정</a></li>
            <li ${url == '/super_admin/notice/list' ? 'class="active"' : ''}><a href="${pageContext.request.contextPath}/super_admin/notice/list?status=고객">공지사항</a></li>
            <li ${url == '/super_admin/notice/member/search' ? 'class="active"' : ''}><a href="${pageContext.request.contextPath}/super_admin/member/search">회원관리</a></li>
            <li><a href="#">매장관리</a></li>
            <li ${url == '/super_admin/menu/list' ? 'class="active"' : ''}><a href="${pageContext.request.contextPath}/super_admin/menu/list">메뉴관리</a></li>
            <li><a href="#">주문관리</a></li>
            <li ${url == '/super_admin/coupon/list' ? 'class="active"' : ''}><a href="${pageContext.request.contextPath}/super_admin/coupon/list">프로모션</a></li>
            <li ${url == '/super_admin/chart/order' ? 'class="active"' : ''}><a href="${pageContext.request.contextPath}/super_admin/chart/order">통계</a></li>
            <li><a href="#">정산관리</a></li>
            <li ${url == '/super_admin/review/list' ? 'class="active"' : ''}><a href="${pageContext.request.contextPath}/super_admin/review/list">리뷰관리</a></li>
            <li ${url == '/super_admin/ono/ono_list' ? 'class="active"' : ''}><a href="${pageContext.request.contextPath}/super_admin/ono/ono_list">고객센터</a></li>
          </ul>
        </div>
        <!--상단메뉴 끝-->
    </header>