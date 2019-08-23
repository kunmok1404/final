<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/template/admin/left/left_notice.jsp"></jsp:include>    
	<style>
		.regist {
			width: 70%;
			margin: auto;
		}
		.table-bordered > tbody > tr > th {
			border: solid 1px;
			background-color: #C7C3C5;
		
		}
	</style>
	<script >
	$(function() {
		$(".testss").click(function() {
			console.log(typeof $(".testss").val());
		});
	});
	
	</script>
	<div class="regist">
	<form action="shop_info" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="${shop.no }">
	<h3>사업자 정보</h3>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<th style="width: 150px">상호</th>
				<td><input type="text" name="company_name" value="${shop.company_name }"></td>
			</tr>
			<tr>
				<th>사업자번호</th>
				<td><input type="text" name="company_code" value="${shop.company_code }"></td>
			</tr>
			<tr>
				<th>사업주명</th>
				<td><input type="text" name="ceo" value="${shop.ceo }"></td>
			</tr>
			<tr>
				<th>사업주전화번호</th>
				<td><input type="text" name="ceo_phone" value="${shop.ceo_phone }"></td>
			</tr>
			<tr>
				<th>은행명</th>
				<td><input type="text" name="bank" value="${shop.bank }"></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td><input type="text" name="account_number" value="${shop.account_number }"></td>
			</tr>
			<tr>
				<th>예금주</th>
				<td><input type="text" name="account_name" value="${shop.account_name }"></td>
			</tr>
		</tbody>
	</table>
	<br><br><br><br><br><br>
	
	
	<h3>매장 정보</h3>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<th style="width: 150px">카테고리</th>
				<td><input type="text" name="category" value="${shop.category }"></td>
			</tr>
			<tr>
				<th>매장명</th>
				<td><input  type="text" name="shop_name" value="${shop.shop_name }"></td>
			</tr>
			<tr>
				<th>매장전화번호</th>
				<td><input type="text" name="shop_phone" value="${shop.shop_phone }"></td>
			</tr>
			<tr>
				<th>매장주소</th>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호" name="zip_code">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소"><br>
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="basic_addr"><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="detail_addr">
				</td>
			</tr>
			<tr>
				<th>매장설명</th>
				<td><input type="text" name="content" value="${shop.content }"></td>
			</tr>
			<tr>
				<th>최소주문금액</th>
				<td><input type="text" name="min_price" value="${shop.min_price }"></td>
			</tr>
			<tr>
				<th>최소주문시간</th>
				<td><input type="text" name="min_time" value="${shop.min_time }"></td>
			</tr>
			<tr>
				<th>배달비용</th>
				<td><input type="text" name="delivery_price" value="${shop.delivery_price }"></td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td><input class="testss"  type="time" name="start_time" placeholder="시작" value="${shop.start_time }">
				-
				<input type="time" name="finish_time" placeholder="종료" value="${shop.finish_time }">
			</tr>
		</tbody>
	</table>	
		
		<br>
		<br>
		<br>

		<input type="submit" value="신정하기">
	</form>
	</div>
    
    <jsp:include page="/WEB-INF/views/template/admin/footer.jsp"></jsp:include>