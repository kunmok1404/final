<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
	
    <div class="card">
    <ul class="card-body">
    	
        <li class="border"><p>전체보기</p>
        <img src="${pageContext.request.contextPath}/resources/image/test.png">
        </li>
         <c:forEach var="category" items="${category}">
        	<li class="border" data-food="${category.no}"><p>${category.name}</p>
        <img src="${pageContext.request.contextPath}/resources/image/test.png">
        </li>
            
        </c:forEach> 
    </ul>
    </div>
    
   
    <jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>