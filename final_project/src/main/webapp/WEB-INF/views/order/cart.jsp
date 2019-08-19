<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<script>
	$(function(){
			$(".up").click(function(){
				var amount = parseInt($(".amount").text());	
				console.log(amount);
				if(amount < 9){
					amount++;
					$(this).next(".amount").text(amount);
				}		
				else{
					alert("10개 이상은 구매하실수 없습니다");
					$(this).next(".amount").text(1);					
				}
			});
			$(".dw").click(function(){
				var amount2 = parseInt($(".amount").text());	
				if(amount2>1){
					amount2--;
					$(this).prev(".amount").text(amount2);					
				}
				else{
					alert("정확한 값을 입력해 주세요");
					$(this).prev(".amount").text(1);					
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
							<tr>${shopDto.company_name}</tr>
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
<form action="cart" method="post">
	<div class="container">
		<div class="offset-md-2 col-md-8">
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>전체선택</th>
						<th>메뉴</th>
						<th>수량</th>
						<th style="text-align: right">상품금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cart" items="${cartDto}">
						<tr>
							<td><input type="checkbox"></td>
							<td width="150"><img src="http://placehold.it/100x100"></td>
							<td width="380">${cart.menu_name}<c:if
									test="${cart.sub_price!=0}">
									<br>
									<span style="font: small-caption;">${cart.sub_type}</span>
									<br>
									<span style="font: small-caption;">${cart.sub_name}${cart.sub_amount}개</span>
								</c:if>
							</td>
							<td><c:choose>
									<c:when test="${cart.sub_name==null}">
										<div class="wrap">
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
								</c:choose></td>
							<td style="text-align: right">${cart.menu_price + cart.sub_price}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="left">
				<span>최소 주문금액 ${shopDto.min_price}원</span>
			</div>
			<div align="right">
				합계:<span>0</span>원
			</div>
		</div>
	</div>
	<hr>
	<div align="center">
		<input class="btn btn-primary" type="submit" value="주문하기">
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>