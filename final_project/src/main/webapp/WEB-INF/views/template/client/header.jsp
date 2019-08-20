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
    <style>
        *{
            /* 테두리를 너비에 포함시켜라 */
            box-sizing: border-box;
        }
        .gallary{
            list-style: none;
            padding:5px;
        }
        .gallary > li{
            border:1px dotted black;
            padding: 5px;
            float:left;
            width:25%;
        }
        .gallary > li > img{
            width:60%;
            top:25%;
            left:50%;
            margin-left:40%;
            margin-top:15%;
            
        }
        .gallary > li > h4{
            width:60%;
        }

        .gallary::after{
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
            .gallary > li{
                width:50%;
            }
        }
        .wih {
            margin: auto;
            width: 70%;
        }

        .iim {
        background-image:url("${pageContext.request.contextPath}/resources/image/food.png");
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
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c2ba04f24dbd55e914c1d24e55dfaa7&libraries=services"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script>
        $(function(){
            $(".adre").click(function(){
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };  

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption); 

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch($(".adre").val(), function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                 if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					var ydg = result[0].y;
					var xdg = result[0].x;
					$(".ygd").val(ydg);
					$(".xgd").val(xdg);
                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                } 
            });    
                 /* ${"#hid"}.hide(); */
            });
        });
    </script> 
     <link href="${pageContext.request.contextPath}/resources/css/kayClient.css" rel="stylesheet">
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
<div class="iim">

	<div class="addd">
	<h1 class="addr">"어디로</h1>
	<h1 class="adrr"> 배달해 </h1>
	<h1 class="addr">드릴까요?"</h1>
	</div>
	<h6 class="adr">배달받으실 동 이름으로 검색새 주세요</h6>

<div class="adre">
    <input type="text" ><button>전송</button>
</div>

<div id="map" style="width:1px;height:1px;"></div>

<input class="ygd" type="hidden" name="ygd">
<input class="xgd" type="hidden" name="xgd">
<br><br><br><br><br><br>
</div>

