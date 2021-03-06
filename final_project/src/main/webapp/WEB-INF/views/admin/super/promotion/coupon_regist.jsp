<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_promotion.jsp"></jsp:include>

<style>
	th {
	 background-color: #ccffff;
	}
</style>
<script type="text/javascript">
$(function() {
	
	$(".way").click(function(){
		if ($(this).val()=="hand") {
			$(".auto").hide();			
		}else {
			$(".auto").show();	
		}
	})
	$(".pri").click(function(){
		if ($(this).val()=="pur") {		
			$(".en1").show();	
		}else {
			$(".en1").hide();			
		}
	})
});
</script>
	
	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	 	<form method="post">
	 	<table border="1" class="table table-bordered">
	 		<tr>
	 			<th>쿠폰명</th>
	 			<td ><input type="text" style="width: 100%" name="name"></td>
	 		</tr>
	 		<tr>
	 		
	 			<th>구분</th>
	 			<td>
	 				<input type="radio" value="hand" name="issue_type" class="way" checked>수동발급
	 				<input type="radio" value="auto" name="issue_type" class="way">자동발급
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>혜택 구분</th>
	 			<td>
	 				<input type="radio" value="pur" name="discount_type" class="pri" checked>할인률
	 				<input type="radio" value="won" name="discount_type" class="pri">할인금액
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>혜택 설정</th>
	 			<td>
	 				<span class="en1"><input type="text" name="discount_price">%</span>
	 				<span class="en2"><span class="en1">최대</span><input type="text" name="max_price">원</span>
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>사용기간</th>
	 			<td><span class="en2">쿠폰발급일로부터 <input type="number" name="period">사용 가능 기간</span></td>
	 		</tr>
	 		<tr class="auto" style="display: none">
	 			<th>자동 발급 종류</th>
	 			<td>
	 				<input type="radio"  name="auto_type" value="now" checked>회원가입 시<br>
	 				<input type="radio"  name="auto_type" value="week">첫구매 시<br>
	 				<input type="radio"  name="auto_type" value="month">구매 시 <br>
	 				<input type="radio"  name="auto_type" value="vip">회원 등급 쿠폰<br>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>
	 				<c:forEach var="grade" items="${grade }">
	 				<input type="checkbox"  name="grade_type" value="${grade.grade }">${grade.name }<br>
	 				</c:forEach>
	 				<input type="checkbox"  name="grade_type" value="4">모든등급 <br>
	 			</td>
	 		</tr>	
	 		<tfoot>
	 			<tr>
	 				<th colspan="2"><input type="submit" value="발급"></th>
	 			</tr>
	 		</tfoot>
	 	</table>
	 	</form>
	</div>
	<!-- 전체 끝 -->







<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>