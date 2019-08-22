<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
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
	
	<div class="regist">
	<form action="order_regist" method="post" enctype="multipart/form-data">
	
	<h3>사업자 정보</h3>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<th style="width: 150px">상호</th>
				<td><input type="text" name="company_name"></td>
			</tr>
			<tr>
				<th>사업자번호</th>
				<td><input type="text" name="company_code"></td>
			</tr>
			<tr>
				<th>사업주명</th>
				<td><input type="text" name="ceo"></td>
			</tr>
			<tr>
				<th>사업주전화번호</th>
				<td><input type="text" name="ceo_phone"></td>
			</tr>
			<tr>
				<th>은행명</th>
				<td><input type="text" name="bank"></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td><input type="text" name="account_number"></td>
			</tr>
			<tr>
				<th>예금주</th>
				<td><input type="text" name="account_name"></td>
			</tr>
			<tr>
				<th>사업자등록증사본</th>
				<td><input type="file" name="business_regist"><br></td>
			</tr>
			<tr>
				<th>영업등록증사본</th>
				<td><input type="file" name="sale_regist"></td>
			</tr>
		</tbody>
	</table>
	<br><br><br><br><br><br>
	
	
	<h3>매장 정보</h3>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<th style="width: 150px">카테고리</th>
				<td><input type="text" name="category"></td>
			</tr>
			<tr>
				<th>매장명</th>
				<td><input type="text" name="shop_name"></td>
			</tr>
			<tr>
				<th>매장전화번호</th>
				<td><input type="text" name="shop_phone"></td>
			</tr>
			<tr>
				<th>매장주소</th>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소"><br>
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소"><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<th>매장설명</th>
				<td><input type="text" name="content"></td>
			</tr>
			<tr>
				<th>최소주문금액</th>
				<td><input type="text" name="min_price"></td>
			</tr>
			<tr>
				<th>최소주문시간</th>
				<td><input type="text" name="min_time"></td>
			</tr>
			<tr>
				<th>배달비용</th>
				<td><input type="text" name="delivery_price"></td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td><input type="date" name="start_time" placeholder="시작">
				-
				<input type="date" name="finish_time" placeholder="종료">
			</tr>
		</tbody>
	</table>	
		
		<br>
		<br>
		<br>

		<input type="submit" value="신정하기">
	</form>
	</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>