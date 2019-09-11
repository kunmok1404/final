<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${requestScope['javax.servlet.forward.servlet_path']}"/>

<script>
	$(function(){
		
		// 카테고리 번호가 0이 아니면 클래스 삭제
		var cat_no = "${cat_no}";
		if(cat_no != 0){
			$(".all-category").children().eq(0).removeClass("on");
		}
		
	})
</script>

<!--음식 카테고리-->
    <div class="food-category">
      <div class="container">
        <div class="col-md-12">
          <ul class="food-list ml-5 all-category">
            <li ${url == '/shop/list' ? 'class="on"' : ''}><a href="${pageContext.request.contextPath}/shop/list?cat_no=0">전체보기</a></li>
            <c:forEach var="catDto" items="${cat_list}">
            <li class="${catDto.no eq cat_no?'on':''}">
            	<a href="${pageContext.request.contextPath}/shop/list?cat_no=${catDto.no}">${catDto.name}</a>
            </li>
            </c:forEach>
          </ul>
        </div>
      </div>
    </div>