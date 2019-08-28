<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<script>



//카드 결제시 수정되는 값
function change_pay_c(){
	document.querySelector("form").action='order';
	document.querySelector(".pay_method").value='credit';
}
//현금 결제시 수정되는 값
function change_pay_m(){
	document.querySelector("form").action='order';
	document.querySelector(".pay_method").value='money';
}
//카카오페이 결제시 변경되는 값
function change_pay_kakao(){
	document.querySelector("form").action='kakao';
	document.querySelector(".pay_method").value='kakao_pay';
}
//신용카드 결제시 변경되는 값
function change_pay_credit(){
	document.querySelector("form").action='online_credit';
	document.querySelector(".pay_method").value='card';
}
</script>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<div class="container">
<div align="center">
	<h2>주문서</h2>
</div>
<div align="left">
	<h3>배달정보</h3>
</div>
<hr>
<form id="form" action="kakao" method="post">
<input type="hidden" id="item_name" name="item_name" value="치킨">
<input type="hidden" id="amount" name="total_amount" value="${total_price + shopDto.delivery_price}">
<input type="hidden" id="partner" name="partner_user_id" value="${shopDto.company_name}">	
	<div class="panel-body">
		<label for="address">
			<h3>주소</h3>
		</label>
		<button>기본주소로 설정</button>
		<button>새 주소</button>
		<div>
			<input type="text" readonly="readonly" value="${memberDto.post}" disabled><br>
			<input type="text" readonly="readonly" value="${memberDto.basic_addr}" disabled><br>
			<input type="text" placeholder="상세 주소" value="${memberDto.detail_addr}">
		</div>
		<div>
			<label for="phone">
				<h3>연락처</h3>
			</label> <input type="text" placeholder="전화번호를 입력해주세요." value="${memberDto.phone}">
		</div>
	</div>
	<hr>
	<div>
		<label for="request">
			요청 사항
		</label>
		<textarea name="request" rows="3" maxlength="100" cols="50"
			placeholder="주문시 요청사항이 있으시면 남겨주세요" class="request"></textarea>
	</div>
	<hr>
	<div align="left">
		<h2>주문정보</h2>
	</div>
	<hr>
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
	<hr>
	<div>
		<table>
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>전체선택</th>
					<th>메뉴</th>
					<th>수량</th>
					<th>상품금액</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="cart" items="${cartList}" varStatus="status">
				<tr>
					<td><input type="checkbox"></td>
					<td>
						<input type="hidden" name="list[${status.index}].title" value="${cart.title}">
						<input type="hidden" name="list[${status.index}].menu_name" value="${cart.menu_name}">
						<input type="hidden" name="list[${status.index}].menu_amount" value="${cart.menu_amount}">
						<input type="hidden" name="list[${status.index}].menu_price" value="${cart.menu_price}">
						<input type="hidden" name="list[${status.index}].sub_name" value="${cart.sub_name}">
						<input type="hidden" name="list[${status.index}].sub_amount" value="${cart.sub_amount}">
						<input type="hidden" name="list[${status.index}].sub_type" value="${cart.sub_type}">
						<input type="hidden" name="list[${status.index}].sub_price" value="${cart.sub_price}">
					<img src="http://placehold.it/100x100"></td>
					<td>
					${cart.menu_name}<c:if test="${cart.sub_price!=0}">
							<br>
							<span style="font: small-caption;">${cart.sub_type}</span>
							<br>
							<span style="font: small-caption;">${cart.sub_name}${cart.sub_amount}개</span>
						</c:if></td>
					<td>${cart.menu_amount}</td>
					<td>${cart.menu_price}원</td>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">최소 주문금액:${shopDto.min_price}원 이상</td>
					<td>합계:${total_price}원</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<hr>
	<div align="left">
		<h3>결제 정보</h3>
	</div>
	<hr>
	<div>
		<table>
			<thead>
				<tr>
					<th>합계</th>
					<th>할인 금액</th>
					<th>배송비</th>
					<th>최종결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${total_price}원</td>
					<td>5000원<input type="hidden" name="discount_price" value="5000"></td>
					<td>${shopDto.delivery_price}원</td>
					<td>${total_price + shopDto.delivery_price}원
					<input type="hidden" name="total-price" value="${total_price + shopDto.delivery_price}"></td>
				</tr>
			</tbody>

			<tfoot>
				<tr>
					<th>쿠폰</th>
					<th>?장보유</th>
				</tr>
				<tr>
					<th>포인트</th>
					<th>xx원사용가능</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<hr>
	<!-- 토글로 이미지 변경하여 표시 -->
	<input type="hidden" class="pay_method" name="pay_method" value="pay">
	<h3>현장결제</h3>
	<button type="button" id="credit" onclick="change_pay_c();">신용카드</button>
	<button type="button" id="money" onclick="change_pay_m();">현금</button>
	<br>
	<h3>미리 결제</h3>
	<button type="button" id="kakaopay" onclick="change_pay_kakao();">카카오페이</button>
	<button type="button" id="credit_card" onclick="change_pay_credit();">신용카드</button>
	<hr>
	<div>
		<input type="checkbox">
		<h4>개인정보 수집 및 이용동의(필수)</h4>
		<a href="#">(내용보기)</a>
	</div>
	<br>
	<div>
		<input type="checkbox">
		<h4>개인정보 제3자 제공 동의(필수)</h4>
		<a href="#">(내용보기)</a>
	</div>
	<br> <input type="submit" value="주문완료">
</form>
</div>
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>