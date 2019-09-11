<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_commission.jsp"></jsp:include> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
    <div class="wrapper mt-3">
    <form method="post">
    <table>
    	<tbody>
			<tr class="table text-center">
				<th class="table-primary">수수료율</th>
				<th><input type="number" min="0" max="100">%</th>
			</tr> 
			<tr class="table text-center">
				<th class="table-primary">정산일</th>
				<th><input type="number" min="0" max="29">일</th>
			</tr>   
    	</tbody>
    </table>
    <input type="submit" value="변경">
    </form>
    </div>
<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>
