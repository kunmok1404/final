<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		//수량 조절하면서 상품금액 변경
		$(".up").click(function(){
			var amount = parseInt($("#change-number").val());
			if(amount < 9){		
				amount++;
				$(this).prev("#change-number").val(amount);
			}		
			else{
				alert("10개 이상 주문할 수 없습니다.");
				$(this).prev("#change-number").val(1);					
			}
		})
		
		$(".dw").click(function(){
			var amount2 = parseInt($("#change-number").val());
			if(amount2>1){	
				amount2--;
				$(this).next("#change-number").val(amount2);					
			}
			else{
				alert("1개 이상 선택해 주세요.");
				$(this).next("#change-number").val(1);					
			}
		});
		// 체크를 하면 바뀌면 order를 갱신
// 		$("input[type=radio], input[type=checkbox]").click(function(){
// 			var no = $(this).attr("data-no");
// 			order[no] = parseInt($(this).val());
// 		})
		
		// 계산하기
		// 객체 생성
		var order = {
				menu_total:0,
				sub_total:0,
				total:0
		}; 
		console.log("order",order);
		
		// 수량 조절시 계산
		$(".up-down").on("click",function(){ 
			var origin = parseInt($(".origin-price").val()); // 메뉴가격
			var num = parseInt($("#change-number").val()); // 수량
			order.menu_total = origin * num;  // 메뉴 총 가격 = 가격 x 수량
			
			// 체크된 것들 가격 계산
			$("input[type=radio], input[type=checkbox]").each(function(){
				if($(this).prop("checked")){
					var price = parseInt($(this).attr("data-price")); //서브메뉴 가격
					order.sub_total += price; // 서브메뉴들 더하기
				}
			})
			// 총 주문금액 = 메뉴 총가격 + 서브메뉴 가격
			order.total = order.menu_total + order.sub_total;
			$(".total-price").text(order.total);
			$("input[name=menu_price]").val(order.total);
			order.sub_total=0;
			order.menu_total =0;
		})
		
		// 체크박스, 라디오 클릭시 계산함수 호출
		
		// 체크박스 부분만
		$("input[type=checkbox]").change(function(){
			var price = parseInt($(this).attr("data-price"));
			console.log($(this).prop("checked"));
			if(!$(this).prop("checked")) price *= -1;
			order.total += price;
			console.log(order);
		});
		
// 		$("input[type=radio], input[type=checkbox]").on("click",function(){
// 			$("input[type=radio], input[type=checkbox]").each(function(){
// 				console.log(this, $(this).prop("checked"));
// 				if($(this).prop("checked")){
// 					var price = parseInt($(this).attr("data-price")); //서브메뉴 가격
// 					order.sub_total += price; // 서브메뉴들 더하기
					
// 					// 메뉴 가격구하기
// 					var origin = parseInt($(".origin-price").val()); // 메뉴가격
// 					var num = parseInt($("#change-number").val()); // 수량
// 					order.menu_total = origin * num;  // 메뉴 총 가격 = 가격 x 수량
					
// 					// 총 주문금액 = 메뉴 총가격 + 서브메뉴 가격
// 					order.total = order.menu_total + order.sub_total;
// 					console.log(order);
// 					$(".total-price").text(order.total);
// 					$("input[name=total_price]").val(order.total);
// 					order.sub_total=0;
// 					order.menu_total =0;
									
// 				}
// 			})
// 			console.log("------------------- end -------------------------");
// 		})
	$("#go_cart").click(function(e){
		e.preventDefault();
		var location = "${pageContext.request.contextPath}/order/cart";
		$("form").attr("action", location);
		$("form").submit();
	})
	
	$("#go_order").click(function(e){
		e.preventDefault();
		var location = "${pageContext.request.contextPath}/order/direct_order";
		$("form").attr("action", location);
		$("form").submit();
	})
	
	}
)

	
</script>

    <div class="modal-img">
        <img src="https://placeimg.com/466/250/any">
    </div>
    <div class="modal-menuName border-bottom">
      <h4>${menuDto.name}</h4>
    </div>
    <form method="post">
    <input type="hidden" name="menu_name" value="${menuDto.name}">
    <input type="hidden" name="title" value="${menuDto.menu_category}">
    <div class="modal-choiceNeed mt-3">
      <!-- 필수 title 시작-->
      <c:set var="loop1Flag" value="true"></c:set>
      <c:forEach var="subMenu" items="${list}">	
      	  <c:if test="${loop1Flag && subMenu.type eq '필수'}">
	      	<h5 class="modal-title1">${subMenu.title}</h5>
	      	<c:set var="loop1Flag" value="false" />
	      </c:if>
	  </c:forEach>
	  <!-- 필수 title 끝 -->
  	  <!-- 필수 영역 시작-->
      <table>
        <tbody>
        
          <c:forEach var="subMenu" items="${list}" varStatus="status">
          <tr>
          	<c:if test="${subMenu.type eq '필수'}">
            	<td><input name="list[${status.index}].sub_title" type="radio" value="${subMenu.name}">${subMenu.name}</td>
            	<input type="hidden" name="list[${status.index}].sub_price" value="${subMenu.price}">
            	<c:choose>
            		<c:when test="${subMenu.price eq '0'}">      	
	            		<td>추가금액없음</td>          	
	            	</c:when>
	            	<c:otherwise>
	            		<td>+${subMenu.price}원</td>
	            	</c:otherwise>
            	</c:choose>
            </c:if>
          </tr>
          </c:forEach>
        </tbody>
        <!-- 필수 영역 끝-->
      </table>
    </div><hr>
    
    <div class="modal-choiceFree">
      <!-- 선택 title 시작-->
      <c:set var="loop1Flag" value="true"></c:set>
      <c:forEach var="subMenu" items="${list}">	
      	  <c:if test="${loop1Flag && subMenu.type eq '선택'}">
	      	<h5 class="modal-title2">${subMenu.title}</h5>
	      	<c:set var="loop1Flag" value="false" />
	      </c:if>
	  </c:forEach>
	  <!-- 선택 title 끝 -->
	  <!-- 선택 영역 시작-->
      <table>
        <tbody>
        	<c:forEach var="subMenu" items="${list}" varStatus="status2">
	        	<c:if test="${subMenu.type eq '선택'}">
		            <tr>
		              <td><input type="checkbox" name="list[${status2.index}].sub_title" value="${subMenu.price}" data-price="${subMenu.price}">${subMenu.name}</td>
		              <c:choose>
	            		<c:when test="${subMenu.price eq '0'}">      	
		            		<td>추가금액없음</td>          	
		            	</c:when>
		            	<c:otherwise>
		            		<td>+${subMenu.price}원</td>
		            	</c:otherwise>
	            	  </c:choose>
		            </tr>
	            </c:if>
            </c:forEach>
          </tbody>
      </table>
      <!-- 선택 영역 끝-->
    </div><hr>
    <div>
      <span class="modal-number">수량</span>
      <span class="wrap">
		<button type="button" class="dw up-down">-</button>
				<input type="text" min="1" value="1" name="menu_amount" id="change-number" readonly>
		<button type="button" class="up up-down">+</button>
		</span>
		<input type="hidden" class="origin-price" value="${menuDto.price}">
      
    </div><hr>
    <div class="modal-totalPrice">
      <span>총 주문금액</span>
      <span class="total-price">
      	<input type="hidden" name="menu_price">
      	${menuDto.price}
      </span>원
    </div>
    <div>
      <input type="submit" class="btn" id="go_cart" value="장바구니 추가">
      <input type="submit" class="btn" id="go_order" value="주문하기">
    </div>          
    </form>