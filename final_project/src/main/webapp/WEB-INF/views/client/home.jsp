<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/main_search.jsp"></jsp:include>
	
    <div class="card">
    <ul class="card-body">
    	
        <li class="border" style="height:203px;" data-food="0"><p>전체보기</p>
        <img style="height:120px;" src="${pageContext.request.contextPath}/resources/image/all_category1.png"></li>
         <c:forEach var="category" items="${category}">
        	<li class="border" data-food="${category.no}"><p>${category.name}</p>
        <img src="${pageContext.request.contextPath}/review/review_img?files_code=${category.img}">
        </li>
            
        </c:forEach> 
    </ul>
    </div><br><br><br><br><br>
    
   
    <jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>