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
	<div class="explan">
	<br><br><br>
	 <h2>입점절차</h2>
    <h6>등록비용없이, 쉽고 편리하게 입점하실 수 있어요</h6>
    <br><hr>
    <br><br>
    <h4>문의를 남겨 주시면, 담당자가 전화 드리고 가게 등록을 도와드릴게요.</h4>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <td>
                    뭐먹지 고객센터로 전화를 주시면
                    입점신청을 도와드립니다. 
                </td>
                <td rowspan="2">
                    담당자 전화
                    담당자가 사장님께 전화나 직접 방문을
                    통해 입점 절차를 도와드립니다.
                </td>
                <td rowspan="2">
                    뭐먹지 등록 완료
                    입점 계약서 작성을 마치면,
                    뭐먹지에 음식점이 등록됩니다.
                </td>
            </tr>
            <tr>
                    <td>
                        사장님 사이트에서 직접 작성하실
                        수 있습니다. 온라인 입점신청
                    </td>
                </tr>
        </tbody>
    </table>
    <div class="btns">
    <button type="button" class="btn btn-danger regist">입점신청하기</button>
    </div>
    <ul class="list-unstyled">
            <li class="media">
              <img src="${pageContext.request.contextPath}/resources/image/explan.jpg" class="mr-3" width="80" height="80">
              <div class="media-body">
                <h5 class="mt-0 mb-1">사장님이 준비하실 것</h5>
                        계약을 위해 사업자 등록증 사본과 음식 메뉴와 가격이 기입된 최신 전단지가 필요합니다.
              </div>
            </li>
            <li class="media my-4">
              <img src="${pageContext.request.contextPath}/resources/image/explan.jpg" class="mr-3" width="80" height="80">
              <div class="media-body">
                <h5 class="mt-0 mb-1">뭐먹지가 할 일</h5>
                        고객이 뭐먹지 앱에서 메뉴를 선택하고 주문할 수 있도록, 전단지의 메뉴와 가격을 입력해 드립니다.
                        또한 원하시는대로 배달가능지역을 설정해드립니다.</div>
            </li>
            <li class="media">
              <img src="${pageContext.request.contextPath}/resources/image/explan.jpg" class="mr-3" width="80" height="80">
              <div class="media-body">
                <h5 class="mt-0 mb-1">이제 뭐먹지에서 주문이 들어옵니다!</h5>
                        계약서 작성 후 약 2주가 지나면 사장님이 설정하신 배달 가능 지역에 있는 고객들에게 음식점이 노출됩니다.
                        다양한 접수 방식으로 뭐먹지에서 들어온 주문을 받고 배달하시면 됩니다.</div>
            </li>
          </ul>
          <br><br><br>
</div>
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>