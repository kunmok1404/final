<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/shop/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/shop/left/left_review.jsp"></jsp:include>
<script>
$(function(){
	$(".navigator-no").click(function(e) {
		//a태그는 클릭하면 이동하는게 기본 액션
		//못하게 하려면 e.preventDefault();
		e.preventDefault();
		var p = $(this).text();
		move(p);
	});
	//페이지 번호를 누르면 해당하는 번호의 페이지로 이동처리
	//이동은 form을 전송하는것으로 대체	
	function move(no) {
		//input[name=page]에 no를 설정한뒤 form을 전송
		$("input[name=page]").val(no);
		$(".searchForm").submit();
	}

	//select[name=type]인 항목의 값을 선택
	$("select[name=status]").val("${param.status}");
	$("select[name=type]").val("${param.type}");
	
})
</script>



	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>주문관리</span>
      </div>
     
	  <!-- 검색목록창 시작 -->
	  <div class="search-wrapper" align="center">
	  <form action="list" method="get" class="searchForm">
	  <input type="hidden" name="page" value="1">
	  	<table class="table table-sm">
	  		<tbody>
	  			<tr>
	  				<td width="10%" class="table-active">주문상태</td>
	  				<td width="40%">
	  					<select id="order" class="form-control" name="status">
	  						<option value="all">전체</option>
	  						<option value="접수대기">접수대기</option>
	  						<option value="조리중">조리중</option>
	  						<option value="주문확인">주문확인</option>
	  						<option value="배달완료">배달완료</option>
	  						<option value="취소완료">취소완료</option>
	  					</select>
	  				</td>
	  				<td width="10%" class="table-active">키워드검색</td>
	  				<td width="40%">
	  					<select name="type" class="form-control" id="ty">
	  						<option value="">선택</option>
	  						<option value="company_name">매장명</option>
	  						<option value="id">주문자</option>
	  					</select>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td width="10%" class="table-active" >검색명</td>
	  				<td width="40%" rowspan="3">
	  					<input style="width:100%" type="text" name="keyword" value="${param.keyword}">
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
	  
	  
	 
	  <div class="list-wrapper table-responsive">
	  <div class="search-number">
	  	<p>총 ${ordersCount}건</p>
	  </div>
	  	<table class="table table-hamburg table-hover">
	  		<tbody>
	  			<tr class="table-primary text-center">
	  				<td>번호</td>
	  				<td>매장명</td>
	  				<td>음식카테고리</td>
	  				<td>주문메뉴</td>
	  				<td>결제방법</td>
	  				<td>결제금액</td>
	  				<td>주문자</td>
	  				<td>주문일시</td> 
	  				<td>주문상태</td>
	  			</tr>  			
	  			<c:forEach var="list" items="${ordersList}">
	  			<tr class="text-center">
	  				<td>${list.no}</td>
	  				<td>${list.company_name}</td>
	  				<td>${list.name}</td>
	  				<td class="over-text"><a href="${pageContext.request.contextPath}/shop_admin/order/detail?no=${list.no}" class="text-primary">${list.title}</a></td>
	  				<td>${list.pay_method}</td>
	  				<td>${list.total_price}</td>
	  				<td>${list.id}</td>
	  				<td>${list.order_date}</td>
	  				<td>
	  				<form action="list_status" method="post">
	  				<input type="hidden" name="no" value="${list.no}">
						<select name="order_status" class="status${list.no}" >
  							<option>접수대기</option>
  							<option>조리중</option>
  							<option>주문확인</option>
 							<option>배달완료</option>
 							<option>취소완료</option>
 						</select>
 						<script>
								$(".status${list.no}").val("${list.order_status}");
						</script>
 						<input type="submit" value="변경하기"> 
 						</form>	 
					</td>
	  			</tr>
	  			</c:forEach>
	  		</tbody>
	  	</table>
	  	<div align="center">
	  		  	<h4>
		<c:if test="${not p.isFirstBlock()}">
			<a href="list">&lt;&lt;</a>
		</c:if>
		<c:if test="${not p.isFirstPage()}">
			<a href="list">&lt;</a>
		</c:if>
		<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
			<c:choose>
				<c:when test="${param.page == i}">
					<font color="red">${i}</font>
				</c:when>
				<c:otherwise>
					<a href="#" class="navigator-no">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${not p.isLastPage()}">
			<a href="list?${p.getNextPage()}">&gt;</a>
		</c:if>
		<c:if test="${not p.isLastBlock()}">
			<a href="list?${p.getNextBlock()}">&gt;&gt;</a>
		</c:if>
	</h4>
	  	</div>
	  </div>
	</div>			
<jsp:include page="/WEB-INF/views/template/admin/shop/footer.jsp"></jsp:include>