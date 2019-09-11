<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<script>
	$(function(){	
		var total_price = 0;
		var menu_price = 0;
		var sub_price = 0;
		
		$(".price").each(function(){
			menu_price += parseInt($(this).text());
		});
		$(".sub_price").each(function(){
			   sub_price += parseInt(this.value);
		});
		$(".subtr").each(function(){
			var menu_pri = parseInt($(this).find(".price").text());
			var subtotal = 0;
			$(this).find(".sub_price").each(function(){
				subtotal += parseInt($(this).val());
			});
				$(this).find(".price").text(menu_pri+subtotal);
		});
		$("#alltotal").text(menu_price+sub_price);
		$("#total_price").val(menu_price+sub_price);
		
		
		//수량 조절
			$(".up").click(function(){				
				var price = parseInt($(this).parent().parent().find(".priceb").val());
				//이 항목의 추가메뉴 가격 값		
				var subp = 0;	
				$(this).parent().parent().parent().find(".sub_price").each(function(){
					subp += parseInt($(this).val());
				});
				var amount = parseInt($(this).parent().find($(".amount")).text());
					if(amount < 9){
						amount++;
						$(this).next(".amount").text(amount);
						$(this).prev(".mp").val(amount);
						}		
					else{
						alert("10개 이상은 구매하실수 없습니다");
						$(this).next(".amount").text(1);
					}			
					var main = (price * amount) + subp;
					$(this).parent().parent().next().children(".price").text(main);
					$(this).parent().parent().find(".mp2").val(main);
					
					var alltotal = parseInt($("#alltotal").text());
					$("#alltotal").text(alltotal+price);
					$("#total_price").val(alltotal+price);
					
			});		
			$(".dw").click(function(){									
				var price = parseInt($(this).parent().parent().find(".priceb").val());
				console.log(price);	
				var subp = 0;	
				$(this).parent().parent().parent().find(".sub_price").each(function(){
					subp += parseInt($(this).val());
				});		
				var amount = parseInt($(this).parent().find($(".amount")).text());
				if(amount>1){	
					amount--;
					$(this).prev(".amount").text(amount);
					$(this).parent().find(".mp").val(amount);
				}
				else{
					alert("정확한 값을 입력해 주세요");
					$(this).prev(".amount").text(1);					
				}
				var main = (price * amount) + subp;
				$(this).parent().parent().next().children(".price").text(main);
				$(this).parent().parent().find(".mp2").val(main);
				
				var alltotal = parseInt($("#alltotal").text());
				console.log(alltotal);
				$("#alltotal").text(alltotal-price);
				$("#total_price").val(alltotal-price);
			});
			
			
				
			//체크박스 선택
			$("#allCheck").click(function(){
				if($("#allCheck").prop("checked")){
					$("input[type=checkbox]").prop("checked",true);
				}
				else{
					$("input[type=checkbox]").prop("checked",false);
				}
			});		
			$("form").submit(function(e){
				var result = $("#allCheck").prop("checked");
				if(result){
					alert("넘어갑니다");
				}
				else{
					e.preventDefault();
					alert("상품을 전부 선택 후 주문해주세요");					
				}
			});
			
			$(".cartdelete").click(function(){
				var no = $(this).val();
				alert("삭제하겠습니다");
				$.ajax({
					type : 'post',
					url : 'cart_delete',
					data: {no:no},
					});
						location.reload();
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
						<th style="text-align:center" colspan="2">상품금액</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cart" items="${cartDto}" varStatus="status1">
						<tr class = "subtr">
							<td><input type="checkbox" class="okcheck"></td>
							<td width="150"><img src="http://placehold.it/100x100">
							</td>
							<td width="380">
							<h2>${cart.menu_name}</h2>
							필수<br>
							${cart.menu_name}  ${cart.menu_price}원
							<hr>
							선택<br>
							<c:forEach var="cartsub" items="${cart.list}" varStatus="status2">
									<input type="hidden" name="main[${status1.index}].list[${status2.index}].no" value="${cartsub.no}">
									<input type="hidden" name="main[${status1.index}].list[${status2.index}].sub_type" value="${cartsub.sub_type}">
									<input type="hidden" name="main[${status1.index}].list[${status2.index}].sub_title" value="${cartsub.sub_title}">
									<input type="hidden" name="main[${status1.index}].list[${status2.index}].sub_name" value="${cartsub.sub_name}">
									<input type="hidden" class="sub_price" name="main[${status1.index}].list[${status2.index}].sub_price" value="${cartsub.sub_price*cartsub.sub_amount}">
									<input type="hidden" name="main[${status1.index}].list[${status2.index}].sub_amount" value="${cartsub.sub_amount}">					
								<c:if test="${cartsub.sub_type=='선택'}">
									${cartsub.sub_name} x ${cartsub.sub_amount} 개  ${cartsub.sub_price * cartsub.sub_amount}원<br>
								</c:if>
							</c:forEach>
							<hr>
							추가<br>
							<c:forEach var="cartsub" items="${cart.list}">
									<c:if test="${cartsub.sub_type=='추가'}">
									${cartsub.sub_name} x ${cartsub.sub_amount} 개  ${cartsub.sub_price * cartsub.sub_amount}원<br>
									</c:if>
							</c:forEach>
							<!-- 주문 상세에 들어갈 정보 -->
							<input type="hidden" name="main[${status1.index}].no" value="${cart.no}">
							<input type="hidden" name="main[${status1.index}].menu_name" value="${cart.menu_name}">
							<input type="hidden" name="main[${status1.index}].title" value="${cart.title}">
							</td>
							<td id = "pri">
								<div class="wrap">
									<input type="hidden" class="mp" name="main[${status1.index}].menu_amount" value="${cart.menu_amount}">
									<button type="button" class="up">+</button>
										<span class="amount">
										${cart.menu_amount}
										</span>											
									<button type="button" class="dw">-</button>
								</div>
								<input type="hidden" value="${cart.menu_price}" class="priceb" readonly>
								<input type="hidden" class="mp2" value="${cart.menu_price}" name="main[${status1.index}].menu_price">		
							</td>
							<!--갯수에 맞춘 금액,  -->
							<td style="text-align: right">
								<span class="price">${cart.menu_price}</span>				
							</td>
							<td>
								<button type="button" class="cartdelete" value="${cart.no}">삭제</button>
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
				<input type="hidden" id="total_price" name="total_price" value="0">
			</div>
		</div>
	</div>
	<hr>
	<div align="center">
		<input class="btn btn-primary" class="okbtn" type="submit" value="주문하기">
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>