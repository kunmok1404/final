<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_commission.jsp"></jsp:include> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<div class="wrapper mt-3">
	<table class="table table-hamburg table-hover">    
    	<thead>
    		<tr class="table-primary text-center">
    			<td>번호</td>
    			<td>매장명</td>
    			<td>카테고리</td>
    			<td>메출액</td>
    			<td>수수료율</td>
    			<td>수수료금액</td>
    			<td>정산금액</td>
    			<td>정산기간</td>
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list }">
    		<tr class="table text-center">
    			<td>${list.shop_code }</td>
    			<td>${list.shop_name }</td>
    			<td>${list.category }</td>
    			<td>${list.total_sum }</td>
    			<td>${list.commission_rate }</td>
    			<td>${list.commission_charge }</td>
    			<td>${list.commission_sum }</td>
    			<td>${list.start_date }~${list.end_date }</td>
			</tr>
		</c:forEach>    
    	</tbody>
    </table>
</div>
<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>
