<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_commission.jsp"></jsp:include> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
    <div class="wrapper mt-3">
    <form method="post">
    <div >
    <table style=" margin: auto;" >
    	<tbody>
			<tr class="table text-center">
				<th class="table-primary">수수료율</th>
				<th><input type="number" min="0" max="100">%</th>
			</tr> 
			<tr class="table text-center">
				<th class="table-primary">정산일</th>
				<th><input type="number" min="0" max="29">일</th>
			</tr> 
			<tr class="table text-center">
				<th colspan="2"><input type="submit" value="변경" class="btn btn-primary"></th>
			</tr>  
    	</tbody>
    </table>
    
    </div>
    </form>
    </div>
<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>
