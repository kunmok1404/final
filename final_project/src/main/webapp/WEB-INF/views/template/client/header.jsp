<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/pkmClient.css" rel="stylesheet">

</head>
<body>
    <header>
        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="#">
                <img alt="Brand" src="${pageContext.request.contextPath}/resources/image/logo.jpg">
              </a>
            </div>
            <ul class="nav-list">
              <li>
                <a href="#" class="mr-2">회원가입</a>
                <div id="line-wrapper">
                  <div class="line"></div>
                </div>
              </li>
              <li>
                <a href="#" class="mr-2">로그인</a>
                <div id="line-wrapper">
                  <div class="line"></div>
                </div>
              </li>
              <li>
                <a href="#" class="mr-2">나의정보</a>
                <div id="line-wrapper">
                  <div class="line"></div>
                </div>
              </li>
              <li>
                <a href="#" class="mr-2">고객센터</a>
              </li>
              <li><img src="${pageContext.request.contextPath}/resources/image/shopping-cart.png"></li>
            </ul>
          </div>
        </nav>
    </header>