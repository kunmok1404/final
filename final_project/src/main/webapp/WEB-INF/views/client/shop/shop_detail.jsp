<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/category/food_category.jsp"></jsp:include>
<style>
.like {
	text-align: right;
}
</style>
<script>
	$(function(){
		// 메뉴토글
		$(".menu-content").hide();
        $(".menu-toggle").click(function(){
        	$(this).next().toggle();
        })
        
        // 첫번째 토글 열기
        $(".menu-toggle").first().click();
        
        // 메뉴클릭시 서브메뉴 호출
        $(".border-bottom").click(function(){
        	var menu_no = $(this).attr("data-menu"); // 메뉴번호
        	// ajax통신
        	$.ajax({
    			url:"${pageContext.request.contextPath}/shop/sub_menu",
    			data : {
    				menu_no : menu_no,
    			},
    			success:function(response){
    				console.log(response);
    				$(".modal-body").empty();
    				$(".modal-body").append(response);
    			}
    		});
        });
        function on(){
        	var img = document.querySelector(".like > img");
            img.src = "${pageContext.request.contextPath}/resources/image/like_on.png";
            img.width="20"; 
            img.height="20";
            $(".like_val").val("on");
        };
        function off(){
            var img = document.querySelector(".like > img");
            img.src = "${pageContext.request.contextPath}/resources/image/like_off.png";
            img.width="20"; 
            img.height="20";
            $(".like_val").val("off");
        };
        $(".like").click(function() {
			if ($(".like_val").val()=="on") {
				 off();
				 $.ajax({
					 	type : 'POST',
		    			url:"${pageContext.request.contextPath}/member/like",
		    			data : {
		    				"member_code" : member_code,
		    				"shop_code" : shopDto.no,
		    			}
				 }
			}else {
				on();
				$.ajax({
					type : 'POST',
	    			url:"${pageContext.request.contextPath}/member/unlike",
	    			data : {
	    				"member_code" : member_code,
	    				"shop_code" : shopDto.no,
	    			}
				}
			}
		});
        
	});
</script>
<!--매장상세-->
    <div class="shop">
      <div class="container">
        <!--매장 정보-->
        <div class="shop-info offset-2 col-8">
          <table>
            <tbody>
              <tr>
                <td class="shop-detail-img">
                    <img src="https://placeimg.com/100/100/any">
                </td>
                <td class="shop-detail-info">
                  <table>
                    <tbody>
                      <tr>
                        <td class="shop-detail-name">${shopDto.shop_name}</td>
                      </tr>
                      <tr>
                        <td class="shop-detail-score">
                        	평점 4.8
                        	<div id="line-shop">
				              <div class="line"></div>
				            </div>
                        </td>
                        <td class="shop-detail-review">리뷰43
                        	<div id="line-shop">
				              <div class="line"></div>
				            </div>
				        </td>
				        <td ><div class="like">
				        	<input type="hidden" value="off" class="like_val">
				        	<img  src="${pageContext.request.contextPath}/resources/image/like_off.png" width="20" height="20">
				        	</div>
				        </td>
                      </tr>
                      <tr>
                        <td class="shop-detail-minPrice">최소주문금액 : ${shopDto.min_price}원</td>
                        <td class="shop-detail-delTime">배달시간 : ${shopDto.min_time}분</td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>  
            </tbody>  
          </table>
        </div>
        
        <!--메뉴정보-->
        <div class="menu-detail offset-2 col-8">
          <!--메뉴 탭-->
          <ul class="nav nav-tabs">
            <li class="nav-item border border-bottom-0">
              <a class="nav-link active" data-toggle="tab" href="#qwe">메뉴</a>
            </li>
            <li class="nav-item border border-bottom-0">
              <a class="nav-link" data-toggle="tab" href="#asd">클린리뷰3</a>
            </li>
            <li class="nav-item border border-bottom-0">
              <a class="nav-link" data-toggle="tab" href="#zxc">정보</a>
            </li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane fade show active" id="qwe">
              <div class="menu">
                <!--메뉴카테고리-->
                <c:forEach var="menu_category" items="${map}">
                <div class="menu-toggle">
                  ${menu_category.key}
                </div>
                 	<!--메뉴내용-->
                	<c:forEach var="menu" items="${menu_category.value}">
	                <table class="table menu-content">
	                  <tbody>
	                    <tr class="border-bottom" data-toggle="modal" data-target="#myModal" data-menu="${menu.no}">
	                      <td>
	                        <div class="menu-name">
	                          ${menu.name}${menu.no}
	                        </div>
	                        <div class="menu-price">
	                          ${menu.price}
	                        </div>
	                      </td>
	                      <td class="menu-img">
	                          <img src="https://placeimg.com/100/100/any">
	                      </td>
	                    </tr>
	                  </tbody>
	                </table>
	                </c:forEach>
                </c:forEach>
                
              </div>
            </div>
            
            <!-- 리뷰탭 -->
            <div class="tab-pane fade" id="asd">
            
              <div class="review">
                <div class="review-info">
                  <div class="review-id">
                    <span>CutyBoy님</span>
                    <div id="line-shop">
		              <div class="line"></div>
		            </div>
                    <span>4.5점</span>
                    <div id="line-shop">
		              <div class="line"></div>
		            </div>
                    <span>2019.08.01</span>
                  </div>
                  <div class="review-menu">
                    후라이드1(무1,콜라1 추가)/간장후라이드2(생맥주1 추가)
                  </div>
                </div>
                <div class="review-img">
                  <img src="https://placeimg.com/300/200/any">
                  <img src="https://placeimg.com/300/200/any">
                </div>
                <div class="review-content">
                  맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.
                  맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.
                  맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.
                  맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.
                </div>
              </div>
              
              <div class="review">
                <div class="review-info">
                  <div class="review-id">
                    <span>CutyBoy님</span>
                    <div id="line-shop">
		              <div class="line"></div>
		            </div>
                    <span>4.5점</span>
                    <div id="line-shop">
		              <div class="line"></div>
		            </div>
                    <span>2019.08.01</span>
                  </div>
                  <div class="review-menu">
                    후라이드1(무1,콜라1 추가)/간장후라이드2(생맥주1 추가)
                  </div>
                </div>
                <div class="review-img">
                  <img src="https://placeimg.com/300/200/any">
                  <img src="https://placeimg.com/300/200/any">
                </div>
                <div class="review-content">
                  맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.
                  맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.
                  맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.
                  맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.맛있는데 배송느림.
                </div>
              </div>
              
            </div>
            
            <!-- 정보탭 -->
            <div class="tab-pane fade" id="zxc">
              <div class="info">
                정보
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
      
    <!-- 모달 -->
    <div class="modal" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- 모달 헤더 -->
          <div class="modal-header">
            <h4 class="modal-title">메뉴 상세</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <!-- 모달 바디 -->
          <div class="modal-body">
            
          </div>
    
        </div>
      </div>
    </div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>