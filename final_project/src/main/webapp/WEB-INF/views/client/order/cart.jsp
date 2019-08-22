<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<script>
	function fn_sum(){
			 var alltotal = 0;
		$(".search tr").each(function() {
	         var price = parseInt($(this).find(".price").text());   
	         alltotal += price;
	      });	
	         $("#alltotal").text(alltotal);
	};
	function fn_clear(){
		var clear = 0;
		$("#alltotal").text(clear);
	}

	$(function(){		
		//수량 조절하면서 상품금액 변경
			$(".up").click(function(){
						
				var parent = $(this).parent();
				var parent2 = $(this).parent().parent().parent();
				var parent3 = $(this).parent().parent();
				var alltotal = parseInt($("#alltotal").text());
				
				var amount = parseInt(parent.find($(".amount")).text());

				var price = parseInt(parent2.find($(".price")).text());
				var priceb = parseInt(parent2.find($(".priceb")).val());
				
					if(amount < 9){		
						amount++;
						$(this).next(".amount").text(amount);
						var total = amount*priceb;
						$(parent2.find($(".price")).text(total));
						
						$(parent2.find($(".mp")).val(amount));
						$(parent3.find($(".mp2")).val(total));
						$("")
					}		
					else{
						alert("10개 이상은 구매하실수 없습니다");
						$(this).next(".amount").text(1);					
					}
						var ftotal = alltotal +total;
						$("#alltotal").text(ftotal);							

			
			});
			
			$(".dw").click(function(){
				
				var parent = $(this).parent();
				var parent2 = $(this).parent().parent().parent();
				var parent3 = $(this).parent().parent();
				
				var amount2 = parseInt(parent.find($(".amount")).text());

				var price = parseInt(parent2.find($(".price")).text());
				var priceb = parseInt(parent2.find($(".priceb")).val());
				if(amount2>1){	
					amount2--;
					$(this).prev(".amount").text(amount2);	
					var total = amount2*priceb;
					$(parent2.find($(".mp")).val(amount2));
					$(parent3.find($(".mp2")).val(total));
				}
				else{
					alert("정확한 값을 입력해 주세요");
					$(this).prev(".amount").text(1);					
				}
				var total = amount2*priceb;
				$(parent2.find($(".price")).text(total));
				
			});
			
// 			$(".okcheck").click(function(){
// 				var alltotal = parseInt($("#alltotal").text());
// 				var parent = $(this).parent().parent();
// 				if($(this).prop("checked")){
// 					var price = parseInt(parent.find($(".price")).text());
// 					$("#alltotal").text(alltotal+price);			
// 				}
// 					else
// 				{
// 					var price = parseInt(parent.find($(".price")).text());
// 					$("#alltotal").text(alltotal-price);
// 				}
// 			});
			
			
			
			//체크박스 선택
			$("#allCheck").click(function(){
				if($("#allCheck").prop("checked")){
					$("input[type=checkbox]").prop("checked",true);
					fn_sum();
				}
				else{
					$("input[type=checkbox]").prop("checked",false);
					fn_clear();
				}
			});	
			
			
			$("form").submit(function(e){
				var result = $(".okcheck").prop("checked");
				if(result){
					alert("넘어갑니다");
				}
				else{
					e.preventDefault();
					alert("상품 선택 후 주문해주세요");					
				}
			});
			
	});
	
</script>
<div class="container">
	<div class="offset-md-2 col-md-8">
		<table style="border-style: solid">
			<thead>
				<tr>
					<td><img src="http://placehold.it/80x80"></td>
					<td>
						<table class="table">
							<tr>
							<td>${shopDto.company_name}</td>
							</tr>
							<tr>
								<td>평점</td>
								<td>리뷰갯수</td>
							</tr>
							<tr>
								<td>배달비: ${shopDto.delivery_price}</td>
							</tr>
						</table>
					</td>
				</tr>
			</thead>
		</table>
	</div>
</div>
<form action="orderinput" method="post">
	<div class="container">
		<div class="offset-md-2 col-md-8">
			<table class="table" id="ta">
				<thead>
					<tr>
						<th><input type="checkbox" id="allCheck"></th>
						<th>전체선택</th>
						<th>메뉴</th>
						<th>수량</th>
						<th style="text-align: right">상품금액</th>
					</tr>
				</thead>
				<tbody class="search">
					<c:forEach var="cart" items="${cartDto}" varStatus="status">
						<tr>
							<td><input type="checkbox" class="okcheck"></td>
							<td width="150"><img src="http://placehold.it/100x100"></td>
							<td width="380">
							${cart.menu_name}
							<!-- 주문 상세에 들어갈 정보 -->
							<input type="hidden" name="list[${status.index}].no" value="${cart.no}">
							<input type="hidden" name="list[${status.index}].menu_name" value="${cart.menu_name}">
							<input type="hidden" name="list[${status.index}].sub_type" value="${cart.sub_type}">
							<input type="hidden" name="list[${status.index}].sub_name" value="${cart.sub_name}">
								<c:if test="${cart.sub_price!=0}">
									<br>
									<span style="font: small-caption;">${cart.sub_type}</span>
									<br>
									<span style="font: small-caption;">${cart.sub_name}${cart.sub_amount}개</span>
								</c:if>
							</td>
							<td>
								<c:choose>
									<c:when test="${cart.sub_name==null}">
										<div class="wrap">
											<input type="hidden" class="mp" name="list[${status.index}].menu_amount" value="${cart.menu_amount}">
											<button type="button" class="up">+</button>
												<span class="amount">
												${cart.menu_amount}
												</span> 
											<button type="button" class="dw">-</button>
										</div>
									</c:when>
									<c:otherwise>
										${cart.menu_amount}
									</c:otherwise>
								</c:choose>
								<input type="hidden" value="${cart.menu_price}" class="priceb" readonly>
								<input type="hidden" class="mp2" value="${cart.menu_price}" name="list[${status.index}].menu_price">	
								<input type="hidden" value="${cart.sub_price}" name="list[${status.index}].sub_price">	
							</td>
							<!--갯수에 맞춘 금액,  -->
							<td class="price" style="text-align: right">
							${cart.menu_price + cart.sub_price}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="left">
				<span>최소 주문금액 ${shopDto.min_price}원</span>
			</div>
			<div align="right">
				합계:<span id="alltotal">0</span> 원
				<input type="hidden" name="total_price" value="50000">
			</div>
		</div>
	</div>
	<hr>
	<div align="center">
		<input class="btn btn-primary" class="okbtn" type="submit" value="주문하기">
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>