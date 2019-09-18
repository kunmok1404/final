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
        $(".shop_detail_info").click(function(){
        	var menu_code = $(this).attr("data-menu"); // 메뉴번호
        	var shop_code = $(".shop_no").val();
        	// ajax통신
        	$.ajax({
    			url:"${pageContext.request.contextPath}/shop/sub_menu",
    			data : {
    				menu_code : menu_code,
    				shop_code : shop_code
    			},
    			success:function(response){
    				$(".modal-body").empty();
    				$(".modal-body").append(response);
    			}
    		});
        });
        //세션에 저장된 member_code 불러오기
        var member_code = "<%=session.getAttribute("member_code") %>";
        
        // shop_code 불러오기
        var shop_code = $(".shop_no").val();
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
		    			url:"${pageContext.request.contextPath}/member/unlike",
		    			data : {
		    				"member_code" : member_code,
		    				"shop_code" : shop_code
		    			}
				 });
			}else {
				on();
				$.ajax({
	    			url:"${pageContext.request.contextPath}/member/like",
	    			data : {
	    				"member_code" : member_code,
	    				"shop_code" : shop_code
	    			}
				});
			}
		});
        
        $(".modal").last().remove();        
	});
</script>
<!--매장상세-->
    <div class="shop">
      <div class="container">
        <!--매장 정보-->
        <div class="shop-info offset-2 col-8">
          <table class="table table-borderless">
            <tbody>
              <tr>
                <td>
			       <img class="shop-list-img" src="${pageContext.request.contextPath}/review/review_img?files_code=${shopDto.shop_img}">
                </td>
                <td class="shop-detail-info">
                  <table>
                    <tbody>
                      <tr>
                        <td class="shop-name">${shopDto.shop_name}
                        <input class="shop_no" type="hidden" value="${shopDto.no}">
                        </td>
                      </tr>
                      <tr style="height:50px;">
                        <td class="text-danger font-weight-bold"	>
                        	평점 ${shopVO.score}
                        	<div id="line-shop" class="ml-4">
				              <div class="line"></div>
				            </div>
                        </td>
                        <td class="shop-review text-info font-weight-bold">리뷰&nbsp${shopVO.review}</td>
				        <td >
				        	<div class="like">
					        	<input type="hidden" value="off" class="like_val">
					        	<img  src="${pageContext.request.contextPath}/resources/image/like_off.png" width="30" height="30">
				        	</div>
				        </td>
                      </tr>
                      <tr style="height:50px;">
                        <td class="shop-detail-minPrice font-weight-bold">최소주문금액 : ${shopDto.min_price}원</td>
                        <td colspan="2" class="shop-detail-delTime font-weight-bold" style="padding-left:10%" width="65%">예상배달시간 : ${shopDto.min_time}</td>
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
              <a class="nav-link active tab-text" data-toggle="tab" href="#qwe">메&nbsp뉴</a>
            </li>
            <li class="nav-item border border-bottom-0">
              <a class="nav-link tab-text" data-toggle="tab" href="#asd">후&nbsp기(${shopVO.review})</a>
            </li>
            <li class="nav-item border border-bottom-0">
              <a class="nav-link tab-text" data-toggle="tab" href="#zxc">정&nbsp보</a>
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
	                <table class="table menu-content">
	                  <tbody>
                	<c:forEach var="menu" items="${menu_category.value}">
	                    <tr class="border-bottom shop_detail_info" data-toggle="modal" data-target="#myModal" data-menu="${menu.no}">
	                    <tr class="border-bottom" data-toggle="modal" data-target="#myModal" data-menu="${menu.no}">
	                      <td width="70%">
	                      	<input type="hidden" name="shop_code" value="${menu.shop_code}">
	                        <div class="menu-name">
	                          ${menu.name}
	                        </div>
	                        <div class="menu-price">
	                          ${menu.price}원
	                        </div>
	                      </td>
	                      <td>
	                          <img class="menu-img float-right" src="${pageContext.request.contextPath}/review/review_img?files_code=${menu.basic_img}">
	                      </td>
	                    </tr>
	                </c:forEach>
	                  </tbody>
	                </table>
                </c:forEach>
                
              </div>
            </div>
            
            <!-- 리뷰탭 -->
            <div class="tab-pane fade" id="asd">
            	
              <c:forEach var="review" items="${review_map}">
              <c:if test="${not empty review or review ne null}">
              <div class="review">
                <div class="review-info">
                  <div class="review-id font-weight-bold">
                    <span>${review.key.member_id}님</span>
                    <div id="line-shop">
		              <div class="line"></div>
		            </div>
                    <span>${review.key.score}점</span>
                    <div id="line-shop">
		              <div class="line"></div>
		            </div>
                    <span>${review.key.regist_date}</span>
                  </div>
                  <div class="review-menu font-weight-bold">
                    ${review.key.review_menu}
                  </div>
                </div>
                <div class="review-content">
                  ${review.key.content}
                </div>
                <div class="review-img">
                  <c:forEach var="reviewImg" items="${review.value}">
                  <img src="${pageContext.request.contextPath}/review/review_img?files_code=${reviewImg.files_no}">
                  </c:forEach>
                </div>
              </div>
              </c:if>
              </c:forEach>
              
            </div>
            
            <!-- 정보탭 -->
            <div class="tab-pane fade" id="zxc">
              <div class="info">
                ${shopDto.content}
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