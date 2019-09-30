<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/WEB-INF/views/template/admin/shop/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/template/admin/shop/left/left_shop.jsp"></jsp:include>    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<style>
		.regist {
			width: 70%;
			margin: auto;
		}
		.table-bordered > tbody > tr > th {
			border: solid 1px;
			background-color: #C7C3C5;
		}
	</style>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c2ba04f24dbd55e914c1d24e55dfaa7&libraries=services"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script>
        $(function(){
        	$("#sample6_detailAddress").on("focus , blur",function(){
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };  
   	           var map = new kakao.maps.Map(mapContainer, mapOption); 
   	           var geocoder = new kakao.maps.services.Geocoder();
   	           geocoder.addressSearch(adds, function(result, status) {
   	        	// 정상적으로 검색이 완료됐으면 
                   if (status === kakao.maps.services.Status.OK) {

                      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    $(".location_y").val(result[0].y);
                  	$(".location_x").val(result[0].x);
                  	console.log(result[0].x);
                      // 결과값으로 받은 위치를 마커로 표시합니다
                      var marker = new kakao.maps.Marker({
                          map: map,
                          position: coords
                      });
                   }
   	                   // 인포윈도우로 장소에 대한 설명을 표시합니다
   	           var infowindow = new kakao.maps.InfoWindow({
   	               content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
   	           });
   	           infowindow.open(map, marker);
   	
   	           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
   	           map.setCenter(coords);
               	});
    	    	})
            
         // 이미지 미리보기
			$("input[type=file]").change(function(e){
				var $this = $(this);
	            
	            if(this.files && this.files[0]){
	                //읽기 도구 생성
	                var reader = new FileReader();
	                
	                //읽기 완료시 할 작업을 예약 설정
	                reader.onload = function(data){//data : 파일 정보
	                    var img = $("<img/>").attr("src", data.target.result);
	                    $this.next().empty();
	                    $this.next().append(img);
	                };
	                	reader.readAsDataURL(this.files[0]);
	            }
	        })
	    	
	        var options = {
					toolbar:[
							{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
							'/',
							{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
							{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
						]
					};
			CKEDITOR.replace('content', options);
            
            
            
        });
        
        
    </script>
    <div class="wrapper mt-3">
    
	<form action="detail" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="${shop.no}">

	<!--메뉴기본정보 -->
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span class="header-title">사업자 정보</span>
      </div>
      
      <table class="table table-hamburg mt-3 menu-regist-table">
      	<tbody>
      		<tr>
      			<td width="20%" class="table-secondary text-center title">상&nbsp호</td>
      			<td class="text-left">
      				<input type="text" name="company_name" value="${shop.company_name }" class="form-control" placeholder="상호명을 입력하세요." required>
   				</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">사업자&nbsp번호</td>
      			<td class="text-left "><input type="text" name="company_code" value="${shop.company_code }" class="form-control" min="1" placeholder="가격을 입력하세요." required></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">사업주명</td>
      			<td class="text-left"><input type="text" name="ceo" value="${shop.ceo }" class="form-control"></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">사업주&nbsp전화번호</td>
      			<td class="text-left"><input type="text" name="ceo_phone" value="${shop.ceo_phone }" class="form-control"></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">은행명</td>
      			<td class="text-left"><input type="text" name="bank" value="${shop.bank }" class="form-control"></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">계좌번호</td>
      			<td><input type="text" name="account_number" value="${shop.account_number }" class="form-control"></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">예금주</td>
      			<td><input type="text" name="account_name" value="${shop.account_name }" class="form-control"></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">승인상태</td>
      			<td class="text-left">
      				<span class="text-left pl-2">
      					<select name="apply_status" class="form-control" required>
							<option ${shop.apply_status eq '승인완료'?'selected':'' }>승인완료</option>
							<option ${shop.apply_status eq '승인대기'?'selected':'' }>승인대기</option>
							<option ${shop.apply_status eq '승인거절'?'selected':'' }>승인거절</option>
						</select>
      				</span>
      			</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">계약상태</td>
      			<td class="text-left">
      				<span class="text-left pl-2">
      					<select name="contract_status" class="form-control" required>
							<option ${shop.contract_status eq '계약종료'?'selected':'' }>계약종료</option>
							<option ${shop.contract_status eq '계약중'?'selected':'' }>계약중</option>
						</select>
      				</span>
      			</td>
      		</tr>
      	</tbody>
      </table>
	
	<div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span class="header-title">매장 정보</span>
      </div>
      
      <table class="table table-hamburg mt-3 menu-regist-table">
      	<tbody>
      		<tr>
      			<td width="20%" class="table-secondary text-center title">카테고리</td>
      			<td class="text-left">
      				<select name="category" class="form-control" required>
      					<c:forEach var="food" items="${menu_list}">
      					
						<option value="${food.no}" ${food.name eq categoryDto.name?'selected':'' }>${food.name}</option>
						</c:forEach>
					</select>
   				</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">매장이미지</td>
      			<td class="text-left ">
      				<input type="file" name="img" class="form-control">
      				<span class="category-img ml-5">
      					<img class="shop-list-img" src="${pageContext.request.contextPath}/review/review_img?files_code=${shop.shop_img}">
      				</span>
      			</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">사업자등록증 사본</td>
      			<td><a href="${pageContext.request.contextPath}/super_admin/shop/download?files_code=${shop.business_file}" class="btn btn-primary text-white">다운로드</a></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">영업등록증 사본</td>
      			<td><a href="${pageContext.request.contextPath}/super_admin/shop/download?files_code=${shop.sale_file}" class="btn btn-primary text-white"">다운로드</a></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">매장명</td>
      			<td class="text-left">
      				<input  type="text" name="shop_name" value="${shop.shop_name }" class="form-control">
      			</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">매장전화번호</td>
      			<td class="text-left"><input type="text" name="shop_phone" value="${shop.shop_phone }" class="form-control"></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">매장주소</td>
      			<td><input type="text" id="sample6_postcode" placeholder="우편번호" name="zip_code" value="${shop.zip_code }" class="form-control">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-info mt-2 mb-2"><br>
					<input type="text" id="sample6_address" placeholder="주소" name="basic_addr" value="${shop.basic_addr }" class="form-control"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detail_addr" value="${shop.detail_addr }" class="form-control">
					<input type="hidden" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
 					<input class="location_y" type="hidden" name="location_y" value="${shop.location_y }"> 
 					<input class="location_x" type="hidden" name="location_x" value="${shop.location_x }"> 
				</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">매장설명</td>
      			<td>
      				<textarea rows="15" name="content" class="form-control" placeholder="매장소개 내용을 입력하세요.">${shop.content}</textarea>
      			</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">최소주문금액</td>
      			<td><input type="text" name="min_price" value="${shop.min_price }" class="form-control"></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">최소주문시간</td>
      			<td><input type="text" name="min_time" value="${shop.min_time }" class="form-control"></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">배달비용</td>
      			<td><input type="text" name="delivery_price" value="${shop.delivery_price }" class="form-control"></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center title">영업시간</td>
      			<td><input class="testss"  type="time" name="start_time" placeholder="시작" value="${shop.start_time }">
      			-
				<input type="time" name="finish_time" placeholder="종료" value="${shop.finish_time }"></td>
      		</tr>
      		<tr>
      			<td colspan="2" class="text-center"><input type="submit" value="저장하기" class="form-class btn btn-info text-center"></td>
      		</tr>
      	</tbody>
      </table>
	</form>
	<div id="map" style="width:1px;height:1px;"></div>
	</div><br><br><br><br>
	
    	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
    <jsp:include page="/WEB-INF/views/template/admin/shop/footer.jsp"></jsp:include>