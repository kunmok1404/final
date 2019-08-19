<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<div>
	<h2>매장 정보 출력[마크],이름,별점,리뷰갯수</h2>
</div>
<form action="cart">
	<div class="container">
		<div class="offset-md-2 col-md-8">
			<table class="table">
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
			<hr>
		</div>
	</div>
	<div align="center">
		<input class="btn btn-primary" type="submit" value="주문하기">
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>