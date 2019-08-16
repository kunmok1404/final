<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
    
<div align="center">
	<h2>주문서</h2>
</div>
<div align="left">
	<h3>배달정보</h3>
</div>
<hr>
<form action="order">
<div class="panel-body">
<label for ="address">
	<h3>주소</h3>
</label>
<button>기본주소로 설정</button>
<button>새 주소</button>
<div>
	<input type="text" name="address" readonly="readonly" placeholder="배달주소" disabled="disabled"><br>
	<input type="text" name="address_detail" readonly="readonly" disabled="disabled"><br>
	<input type="text" name="address_detail2" placeholder="상세 주소">
</div>
<div>
	<label for ="phone">
		<h3>연락처</h3>
	</label>
	<input type="text" name="phone" placeholder="전화번호를 입력해주세요.">
</div>
</div>
<hr>
<div>
	<label for="request">
		<h3>요청 사항</h3>
	</label>
<textarea rows="3" maxlength="100" cols="50" placeholder="주문시 요청사항이 있으시면 남겨주세요" class="request"></textarea>
</div>
<hr>
<div align="left">
	<h2>주문정보</h2>
</div>
<hr>
<div>
	<h2>매장 정보 출력[마크],이름,별점,리뷰갯수</h2>
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
			<tr>
				<td><input type="checkbox"></td>
				<td>이미지</td>
				<td>상품명</td>
				<td>수량</td>
				<td>xxx원</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">최소 주문금액:xx원 이상</td>
				<td>합계:xxx원</td>
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
				<td>xxx원</td>
				<td>xxx원</td>
				<td>xxx원</td>
				<td>xxx원</td>
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
<h3>현장결제</h3>
	<button>신용카드</button>
	<button>현금</button>
<br>
<h3>미리 결제</h3>
	<button>카카오페이</button>
	<button>신용카드</button>
<hr>
<div>
	<input type="checkbox"><h4>개인정보 수집 및 이용동의(필수)</h4><a href="#">(내용보기)</a>
</div>
<br>
<div>
	<input type="checkbox"><h4>개인정보 제3자 제공 동의(필수)</h4><a href="#">(내용보기)</a>
</div>
<br>
<input type="submit" value="주문완료">
</form>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>