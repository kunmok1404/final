<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_promotion.jsp"></jsp:include>
<script type="text/javascript">
$(function() {
	$(".stop").click(function() {
	var no = $(this).parent().siblings(".no").children().val();
	$.ajax({
		url:"${pageContext.request.contextPath}/super_admin/coupon/stop",
		data : {
			no : no,
		},
		success:function(response){
			alert("발급 중지 되었습니다.");
		}
	})
})
	$(".all").click(function() {
	var coupon_code = $(this).parent().siblings(".no").children().val();
	$.ajax({
		url:"${pageContext.request.contextPath}/super_admin/coupon/all",
		data : {
			coupon_code : coupon_code,
		},
		success:function(response){
			alert("전체 발급 되었습니다.");
		}
	})
})
})
</script>
	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>쿠폰 목록</span>
      </div>
     
	  <!-- 검색목록창 시작 -->
	  <div class="search-wrapper">
	  	<form action="" method="post">
	  	<table class="table table-sm">
	  		<tbody>
	  			<tr>
	  				<td width="10%" class="table-active">발급방식</td>
	  				<td width="40%">
	  					<select name="apply_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">자동발급</option>
	  						<option value="">수동발급</option>
	  					</select>
	  				</td>
	  				<td width="10%" class="table-active">발급상태</td>
	  				<td width="40%">
	  					<select name="issue_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">발급중</option>
	  						<option value="">발급중지</option>
	  					</select>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td width="10%" class="table-active">사용기간</td>
	  				<td width="40%">
	  					<input type="date" name="start_date">~
	  					<input type="date" name="end_date">
	  				</td>
	  				<td width="10%" class="table-active">할인구분</td>
	  				<td width="40%">
	  					<select name="discount_type" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">할인율</option>
	  						<option value="">할인금액</option>
	  					</select>
	  				</td>
	  			</tr>
	  		</tbody>
	  	</table>
	  	<div style="width:100%;">
	  	<input type="submit" value="검색" class="btn pull-right btn-outline-primary search-btn">
	  	</div>
	  	</form>
	  </div>
	  <!-- 검색목록창 끝-->
	  
	  <!-- 리뷰목록 시작 -->
	  <div class="list-wrapper table-responsive">
	  <div class="search-number">
	  	<p>총 ${coupon.size() }건</p>
	  </div>
	  	<table class="table table-hamburg table-hover">
	  		<tbody>
	  			<tr class="table-primary text-center">
	  				<td>번호</td>
	  				<td>쿠폰명</td>
	  				<td>발급종류</td>
	  				<td>할인종류</td>
	  				<td>할인금액</td>
	  				<td>발급기간</td>
	  				<td>발급시기</td>
	  				<td>쿠폰상태</td>
	  			</tr>
	  			<c:forEach var="coupon" items="${coupon }">
	  			<tr class="table text-center">
	  				<td class="no">
	  					${coupon.no }
	  					<input type="hidden" value="${coupon.no }">
	  				</td>
	  				<td>${coupon.name }</td>
	  				<td>${coupon.issue_type }</td>
	  				<td>${coupon.discount_type }</td>
	  				<td>${coupon.discount_price }%<br>(${coupon.max_price }원 까지)</td>
	  				<td>${coupon.start_date }<br>~<br>${coupon.finish_date }</td>
	  				<td>${coupon.issue_date }</td>
	  				<td>${coupon.issue_status }</td>
	  				<td>
	  					<input type="button" value="발급 중지" class="stop">
	  					<input type="button" value="전체 발급" class="all">
	  					<input type="button" value="발급 하기" class="issue"></td>
	  			</tr>
	  			</c:forEach>
	  		</tbody>
	  	</table>
	  </div>
	  <!-- 리뷰목록 끝 -->
	</div>
	<!-- 전체 끝 -->







<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>