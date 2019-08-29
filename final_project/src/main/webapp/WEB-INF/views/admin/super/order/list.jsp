<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_review.jsp"></jsp:include>

	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>주문관리</span>
      </div>
     
	  <!-- 검색목록창 시작 -->
	  <div class="search-wrapper">
	  	<form action="" method="post">
	  	<table class="table table-sm">
	  		<tbody>
	  			<tr>
	  				<td width="10%" class="table-active">주문상태</td>
	  				<td width="40%">
	  					<select name="reply_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">접수대기</option>
	  						<option value="">조리중</option>
	  						<option value="">배달완료</option>
	  						<option value="">취소완료</option>
	  					</select>
	  				</td>
	  				<td width="10%" class="table-active">키워드검색</td>
	  				<td width="40%">
	  					<select name="keyword" class="form-control">
	  						<option value="">선택</option>
	  						<option value="">매장명</option>
	  						<option value="">주문자</option>
	  					</select>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td width="10%" class="table-active">작성일</td>
	  				<td width="40%">
	  					<input type="date" name="start_date">~
	  					<input type="date" name="end_date">
	  				</td>
	  				<td width="10%" class="table-active">순위</td>
	  				<td width="40%">
	  					<select name="rank" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">조회수많은순</option>
	  						<option value="">조휘수적은순</option>
	  						<option value="">평점높은순</option>
	  						<option value="">평점낮은순</option>
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
	  				<td class="over-text"><a href="${pageContext.request.contextPath}/super_admin/order/detail?no=${list.no}" class="text-primary">${list.title}</a></td>
	  				<td>${list.pay_method}</td>
	  				<td>${list.total_price}</td>
	  				<td>${list.id}</td>
	  				<td>${list.order_date}</td>
	  				<td>${list.order_status}</td>
	  			</tr>
	  			</c:forEach>
	  		</tbody>
	  	</table>
	  </div>
	</div>







<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>