<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
      })
    </script>
</head>
<body>
    <header>
        <!--네비게이션 영역시작-->
        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="#">
                <img alt="Brand" src="${pageContext.request.contextPath}/resources/image/logo.jpg">
              </a>
            </div>
            <div class="header-button"> 
              <span class="owner"><a href="#">*안녕하세요. 박근목 사장님!</a></span>
              <span class="loginTime"><a href="#">최종접속일자 : 2019.08.10 17:30</a></span>
              <a href="#" class="btn btn-light btn-sm">로그아웃</a>
              <a href="#" class="btn btn-light btn-sm">뭐먹지 바로가기</a>
            </div>
          </div>
        </nav>
        <!--네비게이션 영역 끝-->

        <!--상단메뉴 시작-->
        <div class="top-menu">
          <ul>
            <li class="ml-5"><a href="#">공지사항</a></li>
            <li><a href="#">매장관리</a></li>
            <li><a href="#">메뉴관리</a></li>
            <li><a href="#">주문관리</a></li>
            <li><a href="#">통계</a></li>
            <li><a href="#">리뷰관리</a></li>
            <li><a href="#">고객센터</a></li>
          </ul>
        </div>
        <!--상단메뉴 끝-->
    </header>