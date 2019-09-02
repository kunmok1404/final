<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_review.jsp"></jsp:include>

<script>
$(function(){
// 	$("select").change(function(){
// 		$("select option:selected").each(function(){
// 			$('form').submit();
// 		});
// 	});

	$("input[type=button]").click(function(){
		$('form').submit();
	});

// 	$("input[type=button]").click(function(){
// 		var no = ${orderNo};
// 		var status = $("select[name=order_status]").val("${orders.order_status}");
		
// 		$.ajax({
// 			type : "post",
// 			url : "${pageContext.request.contextPath}/super_admin/order/detail",
// 			data : {
// 				no : no,
// 				status : status			
// 			},
			
// 		})
// 	})
	
	//처음에 주문상태 선택시키는 코드
	$("select[name=order_status]").val("${orders.order_status}");
	
	
});
</script>

<div class="container">
	<h2>주문 정보</h2>
	<form action="detail" method="post">
	<input type="hidden" name="no" value="${orderNo}">
	<div class="offset-md-2 col-md-8">
		<table class="table table-hambuger">
			<thead>
				<tr>
					<th>주문번호</th>
					<th colspan="3">${orderNo}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>주문 메뉴</td>
					<td colspan="3">
						<c:forEach var="order_list" items="${orderDetail}">
						<table class="table">
								<tr>
									<td>${order_list.menu_name}</td>
									<td>X ${order_list.menu_amount}</td>
									<td>${order_list.menu_price}원</td>
								</tr>
								<c:choose>
									<c:when test="${order_list.sub_name !=null}">
									<tr> 
										<td>${order_list.sub_name}</td>
										<td>X ${order_list.sub_amount}</td>
										<td>+ ${order_list.sub_price}원</td>	
									</tr>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
						</table>
					</c:forEach>
					</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td>${shop_del.delivery_price}</td>
					<td>결제금액</td>
					<td>${orders.total_price - orders.discount_price -shop_del.delivery_price}원</td>
				</tr>
				<tr>
					<td>할인금액</td>
					<td>${orders.discount_price}</td>
					<td>총 결제 금액</td>
					<td>${orders.total_price}</td>
				</tr>
					
				<tr>
					<td>결제방법</td>
					<td>${orders.pay_method}</td>
					<td>주문상태</td>
					<td>
						<select name="order_status">
  							<option>접수대기</option>
  							<option>조리중</option>
  							<option>주문확인</option>
 							<option>배달완료</option>
 						</select>
 						<input type="button" value="변경하기"> 
					</td>
				</tr>
			</tbody>
		</table>
		
	</div>
		<h2>주문자 정보</h2>
	<div class="offset-md-2 col-md-8">
		<table class="table table-hambuger">
			<tr>
				<td>주문자</td>
				<td  colspan="10%">${orderMember.id}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${orderMember.detail_addr}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${orderMember.phone}</td>
			</tr>
			<tr>
				<td>요청사항</td>
				<td>${orders.request}</td>
			</tr>
		</table>
	</div>
	<div align="center">
		<button>닫 기</button>	
	</div>
	</form>
</div>