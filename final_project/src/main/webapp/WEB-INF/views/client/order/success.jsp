<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<div class="container">
	<div class="offset-md-2 col-md-8">
		<div align="center">
			<h3>주문확인서</h3>
		</div>
		<hr>
		<div align="left">
			<h4>주문 정보</h4>
		</div>
		<div>
			<h4>매장</h4>
			<img src="http://placehold.it/80x80">
			<h4>${shop_info.company_name}</h4>
		</div>
		<br>
		<div>
			<h4>주문상태</h4>
			${orders.order_status}
		</div>
		<br>
			<h4>주문일시</h4>
			${orders.order_date}
		<hr>
		<div align="left">
			<h3>주문 내역</h3>
		</div>
		<hr>
		<table class="table">
			<tbody>
				<c:forEach var="order_detail" items="${order_detail}">
					<tr>
						<td>${order_detail.menu_name} x ${order_detail.menu_amount}</td>
						<td>${order_detail.menu_price} 원</td>
					</tr>
					<tr>	
						<td colspan="2">
						<c:forEach var="order_sub" items="${order_sub_detail}">
							<c:if test="${order_detail.no eq order_sub.no}">
									-${order_sub.sub_type}<br>
									-${order_sub.sub_title}<br>
									-${order_sub.sub_name} x ${order_sub.sub_amount} 개
									${order_sub.sub_price} 원<br>
							</c:if>
						</c:forEach>
								</td>
					</tr>			
				</c:forEach>
					<tr>
						<td>주문합계</td>
						<td>${orders.total_price}원</td>
					</tr>
					
					<tr>
						<td>배달요금</td>
						<td>${shop_info.delivery_price}원</td>
					</tr>
					<tr>
						<td><font color="red">결제금액</font></td>
						<td>${orders.total_price + shop_info.delivery_price}원</td>
					</tr>
					<tr>
						<td>결제방식</td>
						<td>${orders.pay_method}</td>
					</tr>
			</tbody>
		</table>
		<hr>
		<table>
			<thead>
				<tr>
					<td rowspan="2" align="left">주문자 정보</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>연락처</td>
					<td>${memberDto.phone}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${memberDto.basic_addr}<br>
						${memberDto.detail_addr}
					</td>
				</tr>
				<tr>
					<td>요청사항</td>
					<td>${orders.request}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>