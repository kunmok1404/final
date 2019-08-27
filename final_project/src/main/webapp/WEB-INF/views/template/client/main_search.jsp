<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 메인화면 상단 검색영역 -->
    
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
                 
            });
          
        		$(".border").click(function(){
        			
        			location.href = "shop/list?cat_no="+$(this).attr("data-food");
        		});
        });
    </script> 
    
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
<br><br><br><br>
</div>