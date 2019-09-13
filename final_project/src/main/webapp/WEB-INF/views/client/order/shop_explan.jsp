<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<script>
	$(function() {		
	$(".regist").click(function() {
		$(location).attr("href", "${pageContext.request.contextPath}/shop/shop_regist");
	});
	});
</script>
	
	<div class="regist-wrapper mt-5">
	
	  <!--메뉴기본정보 -->
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span class="explan-title">입점절차</span>
      </div><br>
	  <h5 class="text-secondary">등록비용없이, 쉽고 편리하게 입점하실 수 있어요.</h5><hr>
	  <br><br>
	  
	  <h4>문의를 남겨 주시면, 담당자가 전화 드리고 가게 등록을 도와드릴게요.</h4>
	  <img class="shop-apply-img mt-2" src="${pageContext.request.contextPath}/resources/image/shop_regist.png">
	  <div class="shop_apply_btn text-center mt-3">
	  	<button type="button" class="btn btn-lg btn-danger regist">입점&nbsp신청하기</button>
	  </div><br>
	  
	  <table class="table table-borderless apply-check-title mt-5">
	  	<tbody>
	  		<tr>
	  			<td><img src="${pageContext.request.contextPath}/resources/image/check-mark.png"></td>
	  			<td>
	  				<h4 class="text-danger">사장님이 준비하실 것</h4>
	  				<h5 class="text-secondary">계약을 위해 사업자 등록증 사본과 음식메뉴와 가격이 기입된 최신 전단지가 필요합니다.</h5>
	  			</td>
	  		</tr>
	  	</tbody>
	  </table><br><hr>
	  
	  <table class="table table-borderless apply-check-title mt-5">
	  	<tbody>
	  		<tr>
	  			<td><img src="${pageContext.request.contextPath}/resources/image/check-mark.png"></td>
	  			<td>
	  				<h4 class="text-danger">뭐먹지가 할 일</h4>
	  				<h5 class="text-secondary">고객이 뭐먹지 사이트에서 메뉴를 선택하고 주문할 수 있도록,
	  				전단지의 메뉴와 가격을 입력해 드립니다.<br>	또한 원하시는대로, 배달 가능지역을 설정해드립니다.</h5>
	  			</td>
	  		</tr>
	  	</tbody>
	  </table><br><hr>
	  
	  <table class="table table-borderless apply-check-title mt-5">
	  	<tbody>
	  		<tr>
	  			<td><img src="${pageContext.request.contextPath}/resources/image/check-mark.png"></td>
	  			<td>
	  				<h4 class="text-danger">이제 뭐먹지에서 주문이 들어옵니다.</h4>
	  				<h5 class="text-secondary">계약서 작성후 약 2주가 지나면 사장님이 설정하신 배달 가능 지역에 있는 고객들에게 
	  				음식점이 노출됩니다.<br>	뭐먹지에 들어온 주문을 받고 배달하시면 됩니다.</h5>
	  			</td>
	  		</tr>
	  	</tbody>
	  </table><br><br>
	  
	</div>
	
          
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>