<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_review.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function list(page) {
		location.href = "${pageContext.request.contextPath}/super_admin/shop_info?curPage="+page+"&searchOption=${searchOption}"+"&keyword=${keyword}";
	}
</script>
<style>
	.table-responsive {
		width: 90%;
		margin-left: 5%;
	}
	
	.table {
		width: 90%;
		margin-left: 10%;
	}
	
	.table > thead > tr > th {
		width: auto;
	}
	.table > tbody > tr > th {
		width: auto;
	}
</style>
<h2>매장 목록</h2>

 <div class="search-wrapper">
<form action="${pageContext.request.contextPath}/super_admin/shop/shop_info" method="post">
	<select name="searchOption">
		<!-- 검색 조건을검색처리후 결과 화면에 보여 주기위해 c:out 출력태그 사용,삼항연산자 -->
		<option value="all" <c:out value="${searchOption == 'all'?'selected':'' }"></c:out>>모든 조건</option>
		<option value="category" <c:out value="${searchOption == 'category'?'selected':'' }"></c:out>>카테고리</option>
		<option value="reason" <c:out value="${searchOption == 'reason'?'selected':'' }"></c:out>>계약상태</option>
	</select>
	<input name="keyword" value="${keyword }" type="text">
	<input type="submit" value="조회">
</form>
</div>
 <div class="list-wrapper table-responsive">
<table class="table table-hamburg table-hover">
	<thead>
		<tr class="table-primary" align="center">
			<th>번호</th>
			<th >카테고리</th>
			<th >매장명</th>
			<th >승인상태</th>
			<th >계약상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="list" items="${list }">
		 <tr class="text-center" >
		 	<td>${list.no }</td>
		 	<td>
		 	<c:forEach var="name" items="${name }">
		 	<c:if test="${list.category == name.no }">
		 	${name.name }
		 	</c:if>
		 	</c:forEach>
		 	</td>
		 	<td><a href="${pageContext.request.contextPath}/super_admin/shop/detail?no=${list.no }">${list.company_name }</a></td>
		 	<td>${list.apply_status }</td>
		 	<td>${list.contract_status }</td>
		 	
		 </tr>
		</c:forEach>	
	</tbody>
	<tfoot>
		<tr class="text-center">
			<td colspan="5">
			<!-- 처음 페이지로 이동 : 현재 페이지가 1보다 크면 [처음]하이퍼링크를 화면에 출력 -->
			<c:if test="${pageing.curPage > 1 }">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>
			<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
			<c:if test="${pageing.curBlock > 1 }">
				<a href="javascript:list('${pageing.prevBlock }')">[이전]</a>
			</c:if>
			<!-- 하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
			<c:forEach var="num" begin="${pageing.blockBegin }" end="${pageing.blockEnd }">
				<c:choose>
					<c:when test="${num == pageing.curPage }">
						<span style="color: red">${num }</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num }')">${num }</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
			<c:if test="${pageing.curBlock <= pageing.totBlock }">
				<a href="javascript:list('${pageing.nextPage }')">[다음]</a>
			</c:if>
			<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
			<c:if test="${pageing.curPage <= pageing.totPage }">
				<a href="javascript:list('${pageing.totPage }')">[끝]</a>
			</c:if>
		</tr>
	</tfoot>
</table>
</div>


<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>