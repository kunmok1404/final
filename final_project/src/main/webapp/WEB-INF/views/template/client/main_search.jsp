<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c2ba04f24dbd55e914c1d24e55dfaa7&libraries=services"></script>
    <script src="Scripts/jquery.session.js"></script>
    <!-- 메인화면 상단 검색영역 -->
    <script>
        $(function(){
           $(".asda").change(function(){	
        	   console.log($("input[name=keyword]").val());
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
            geocoder.addressSearch($(".asda").val(), function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                 if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var ydg = result[0].y;
                	var xdg = result[0].x;
                	var sel = sessionStorage.getItem('ydg');
                	if (sel == null) {
                	sessionStorage.setItem("ydg", ydg);
                	sessionStorage.setItem("xdg", xdg);	
                	console.log(sessionStorage.getItem("ydg"));
                	console.log(sessionStorage.getItem("xdg"));
					}else {
						sessionStorage.removeItem("ydg");
						sessionStorage.removeItem("xdg");
                		sessionStorage.setItem("ydg", ydg);
                		sessionStorage.setItem("xdg", xdg);
                    	console.log(sessionStorage.getItem("ydg"));
                    	console.log(sessionStorage.getItem
                    			("xdg"));
					} 
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
          
        		$(".food_category").click(function(){
        			location.href = "shop/list?cat_no="+$(this).attr("data-food");
        		});
        		
        });
    </script> 
    
    <div class="iim">
<div id="map" style="width:1px;height:1px;"></div>
	
	<form action="${pageContext.request.contextPath}/search">
	<div class="search_top">
		<div class="where-addr">
				"어디로 <span>배달해</span> 드릴까요?"
		</div>
		<div class="where-text">배달받으실 동 이름으로 검색해 주세요</div>
		<div class="search-btn">
			<c:choose>
				<c:when test="${!empty param.keyword}">
		    		<input type="text" list="addr" name="keyword" value="${param.keyword}" class="form-control-sm asda" placeholder="ex)충선로 24번길"><button class="btn btn-success search">전송</button>
				</c:when>
				<c:otherwise>
					<input type="text" list="addr" name="keyword" class="form-control-sm asda" placeholder="ex)충선로 24번길"><button class="btn btn-success search">전송</button>
				</c:otherwise>
			</c:choose>
			
			<datalist id="addr">
			
				<c:forEach var="list" items="${shop_list}">
					<option value="${list.basic_addr}  ${list.detail_addr}" >
				</c:forEach>
			</datalist>
		</div>
	</div>
	</form>
<br><br><br><br>
</div>