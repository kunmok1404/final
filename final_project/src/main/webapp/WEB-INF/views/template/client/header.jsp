<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
    <script src="https://cdn.tiny.cloud/1/6ftday8a7jg29iewicngy31mxruhwuo468au005jb6npig7g/tinymce/5/tinymce.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/pkmClient.css" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c2ba04f24dbd55e914c1d24e55dfaa7&libraries=services"></script>
</head>

<style>
        *{
            /* 테두리를 너비에 포함시켜라 */
            box-sizing: border-box;
        }
        .card-body{
            list-style: none;
            padding:5px;
            margin: auto;
        }
        .card-body > li{
            padding: 5px;
            float:left;
            width:20%;
            margin: 0.5%;
       
        }
        .card-body > li > img{
            width:60%;
            top:25%;
            left:50%;
            margin-left:40%;
            margin-top:15%;
            
        }
        .card-body > li > h4{
            width:60%;
        }

        .card-body::after{
            content:"";
            display:block;
            clear:both;
        }

        @media screen and (max-width:768px){
            .gallary > li{
                width:33.3333%;
            }
        }

        @media screen and (max-width:580px){
            .card-body > li{
                width:50%;
            }
        }
        .card {
            margin: auto;
            width: 70%;
            border: none;
        }

        .iim {
        background-image:url("${pageContext.request.contextPath}/resources/image/main1-1.jpg");
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        }
        .iim > .adre{
            margin: auto;
            margin-left:40%;
            left:50%;
           
        }
          .addd > .addr{  
           color: white;
           display: inline-block;
        }
           .addd > .adrr{
           color: yellow;
           display: inline-block;
        }
           .addd{
          margin: auto;
          margin-left:35%;
          left:50%;
            
        }
           .adr{
           margin: auto;
           margin-left:40%;
           left:50%;
           color: white;
            
        }
        .card-body > li:hover {
			background-color: gray;
			
		}
		.explan{
			width:70%;
			margin: auto;
		}
		.btns {
          margin-left: 50%;
        }
       
    </style>

<body>
   <header>
       <nav class="navbar navbar-default">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="${pageContext.request.contextPath}">
                <img alt="Brand" src="${pageContext.request.contextPath}/resources/image/logo.jpg">
              </a>
            </div>

            
          <!-- 로그인 여부에 따라 메뉴를 구분하여 출력-->
          <c:set var="login" value="${not empty sessionScope.member_code}"></c:set>
          <c:choose>
          	<c:when test="${login}">
	            <ul class="nav-list">
	              <li>
	                <a href="${pageContext.request.contextPath}/member/logout" class="mr-2">로그아웃</a>
	                <div id="line-wrapper">
	                  <div class="line"></div>
	                </div>
	              </li>
	              <li>
	                <a href="${pageContext.request.contextPath}/member/info_order_list" class="mr-2">나의정보</a>
	                <div id="line-wrapper">
	                  <div class="line"></div>
	                </div>
	              </li>
	              <li>
	                <a href="${pageContext.request.contextPath}/notice/list" class="mr-2"" class="mr-2">고객센터</a>
	              </li>
	              <li>
	              	 <a href="${pageContext.request.contextPath}/order/mycart">
	              <img src="${pageContext.request.contextPath}/resources/image/shopping-cart.png">
	             	 </a>
				  </li>
	            </ul>          	
          	</c:when>
          	<c:otherwise>
          	<ul class="nav-list">
	              <li>
	                <a href="${pageContext.request.contextPath}/member/regist" class="mr-2">회원가입</a>
	                <div id="line-wrapper">
	                  <div class="line"></div>
	                </div>
	              </li>
	              <li>
	                <a href="${pageContext.request.contextPath}/member/login" class="mr-2">로그인</a>
	                <div id="line-wrapper">
	                  <div class="line"></div>
	                </div>
	              </li>
	              <li>
	                <a href="${pageContext.request.contextPath}/member/info_order_list" class="mr-2">나의정보</a>
	                <div id="line-wrapper">
	                  <div class="line"></div>
	                </div>
	              </li>
	              <li>
	                <a href="${pageContext.request.contextPath}/notice/list" class="mr-2"" class="mr-2">고객센터</a>
	              </li>
	              <li>
	              	<a href="${pageContext.request.contextPath}/order/mycart">
	            	  <img src="${pageContext.request.contextPath}/resources/image/shopping-cart.png">
	              	</a>
	              </li>
	            </ul>
          	</c:otherwise>
          </c:choose>
          </div>
        </nav>
    </header>

