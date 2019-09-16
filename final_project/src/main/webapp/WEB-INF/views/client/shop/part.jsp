<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(function(){
		// 매장클릭시 상세화면이동
		$(".shop-list li").click(function(){
			var no = $(this).attr("data-no");
			console.log(no);
			location.href = "detail?no="+no;
		})
	})
</script>
<c:forEach var="shop" items="${shop_list}">
	<li data-no="${shop.no}">
	  <div class="menu-image">
	      <img class="shop-list-img" src="${pageContext.request.contextPath}/review/review_img?files_code=${shop.shop_img}">
	  </div>
	  <div class="menu-info">
	    <div class="shop-name">${shop.shop_name}</div>
	    <div class="shop-score">
	    	<span class="text-danger font-weight-bold">평&nbsp점 : ${shop.score}&nbsp점</span>
	    	<div id="line-shop">
              <div class="line"></div>
            </div>
	    	<span class="shop-review text-info font-weight-bold">리&nbsp뷰&nbsp&nbsp${shop.review}&nbsp개</span>
	    </div>
	    <div class="min-price font-weight-bold">
	    	<span>최소주문금액 : ${shop.min_price}&nbsp원</span>
	    </div>
	    <div class="delivery-time font-weight-bold">
	    	<span>예상배달시간 : ${shop.min_time}&nbsp</span>
	    </div>
	  </div>
	</li>
</c:forEach>