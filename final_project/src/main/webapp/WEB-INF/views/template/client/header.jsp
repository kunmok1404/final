<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
                <a href="${pageContext.request.contextPath}/member/regist" class="mr-2">회원가입</a>
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