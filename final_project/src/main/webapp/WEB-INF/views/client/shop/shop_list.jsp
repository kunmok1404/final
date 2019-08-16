<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/category/food_category.jsp"></jsp:include>
    
<script>
	$(function(){
		// 매장클릭시 상세화면이동
		$(".shop-list li").click(function(){
			var no = $(this).attr("data-no");
			location.href = "detail?no="+no;
		})
	})
</script>
    <!--매장목록전체-->
    <div class="shop">
      <div class="container">
        <!--매장목록-->
        <ul class="shop-list">
          <c:forEach var="shop" items="${shop_list}">
          <li data-no="${shop.no}">
            <div class="menu-image">
                <img src="${pageContext.request.contextPath}/resources/image/macdonald.png">
            </div>
            <div class="menu-info">
              <div>${shop.shop_name}</div>
              <div>리뷰</div>
              <div>평점</div>
            </div>
          </li>
          </c:forEach>
        </ul>
      </div>
    </div>
    
    
    
    
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>