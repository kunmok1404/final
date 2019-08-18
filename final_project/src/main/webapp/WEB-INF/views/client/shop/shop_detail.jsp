<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/category/food_category.jsp"></jsp:include>

<script>
	$(function(){
		// 메뉴토글
		$(".menu-content").hide();
        $(".menu-toggle").click(function(){
        	$(this).next().toggle();
        })
        
	})
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
                        <td class="shop-detail-review">리뷰43</td>
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
                <c:forEach var="menuView" items="${menu_list}">
                <div class="menu-toggle">
                  ${menuView.menu_category}
                </div>
                <!--메뉴내용-->
                <table class="table menu-content">
                  <tbody>
                    <tr class="border-bottom" data-toggle="modal" data-target="#myModal">
                      <td>
                        <div class="menu-name">
                          ${menuView.menu_name}
                        </div>
                        <div class="menu-price">
                          ${menuView.menu_price}
                        </div>
                      </td>
                      <td class="menu-img">
                          <img src="https://placeimg.com/100/100/any">
                      </td>
                    </tr>
                  </tbody>
                </table>
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
            <div class="modal-img">
                <img src="https://placeimg.com/466/250/any">
            </div>
            <div class="modal-menuName border-bottom">
              <h4>후라이드+양념치킨</h4>
            </div>
            <form action="#">
            <div class="modal-choiceNeed mt-3">
              <h5>소스선택(필수)</h5>
              <table>
                <tbody>
                  <tr>
                    <td><input name="need" type="radio" checked>후라이드+후라이드</td>
                    <td>추가비용없음</td>
                  </tr>
                  <tr>
                    <td><input name="need" type="radio">후라이드+양념</td>
                    <td>+1000</td>
                  </tr>
                  <tr>
                    <td><input name="need" type="radio">후라이드+간장</td>
                    <td>+2000</td>
                  </tr>
                </tbody>
              </table>
            </div><hr>
            <div class="modal-choiceFree">
              <h5>추가(선택)</h5>
              <table>
                <tbody>
                    <tr>
                      <td><input type="checkbox">치킨무</td>
                      <td>+500</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox">콜라</td>
                      <td>+1000</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox">양념소스</td>
                      <td>+500</td>
                    </tr>
                  </tbody>
              </table>
            </div><hr>
            <div class="modal-number">
              <span>수량</span>
              <input type="number" value="1" class="text-center">
            </div><hr>
            <div class="modal-totalPrice">
              <span>총 주문금액</span>
              <span>21500원</span>
            </div>
            <div>
              <input type="submit" class="btn" id="go_cart" value="장바구니 추가">
              <input type="submit" class="btn" id="go_order" value="주문하기">
            </div>          
            </form>
          </div>
    
        </div>
      </div>
    </div>









<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>