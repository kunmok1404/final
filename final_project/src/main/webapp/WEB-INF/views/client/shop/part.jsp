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
	    	<span>평점</span>
	    	<div id="line-shop">
              <div class="line"></div>
            </div>
	    	<span class="shop-review">리뷰243</span>
	    </div>
	    <div class="min-price">
	    	<span>최소주문금액 : 9000원</span>
	    </div>
	    <div class="delivery-time">
	    	<span>예상배달시간 : 40~50분</span>
	    </div>
	  </div>
	</li>
</c:forEach>