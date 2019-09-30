<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include
	page="/WEB-INF/views/template/admin/super/left/left_shop.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function list(page) {
		location.href = "${pageContext.request.contextPath}/super_admin/shop_info?curPage="
				+ page
				+ "&searchOption=${searchOption}"
				+ "&keyword=${keyword}";
	}

	$(function() {

		// 승인버튼 클릭시
		$(".apply_menu")
				.click(
						function() {
							var result = confirm("승인하시겠습니까?");
							var $this = $(this);
							var shop_code = $(this).attr("data-no");
							if (result) {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/super_admin/shop/apply",
											data : {
												shop_code : shop_code,
											},
											success : function(response) {
												alert(response);
												$this.parent().prev().prev()
														.text("승인완료").css(
																"color",
																"#58A2B8")
														.removeClass(
																"text-danger");
												$this.remove();
											}
										})
							}
						})

		// 삭제버튼 클릭시
		$(".delete_shop")
				.click(
						function() {
							var result = confirm("매장을 삭제하시겠습니까?");
							var $this = $(this);
							var shop_code = $(this).attr("data-no");
							if (result) {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/super_admin/shop/delete_shop",
											data : {
												shop_code : shop_code,
											},
											success : function(response) {
												alert(response);
												$this.closest("tr").remove();
											}
										})
							}
						})

	})
</script>

<div class="wrapper mt-3">
	<div class="top-title">
		<div id="terms-wrapper">
			<div class="terms-line"></div>
		</div>
		<span>매장 목록</span>
	</div>
	<!-- 검색목록창 시작 -->
	<div class="search-wrapper">
		<form
			action="${pageContext.request.contextPath}/super_admin/shop/shop_info"
			method="post">
			<table class="table table-sm">
				<tbody>
					<tr>
						<td width="10%" class="table-active">입점상태</td>
						<td width="40%"><select name="apply_status"
							class="form-control">
								<option value="">전체</option>
								<option>입점대기</option>
								<option>승인완료</option>
						</select></td>
						<td width="10%" class="table-active">계약상태</td>
						<td width="40%"><select name="sale_status"
							class="form-control">
								<option value="">전체</option>
								<option>계약중</option>
								<option>계약종료</option>
						</select></td>
					</tr>
					<tr>
						<td width="10%" class="table-active">입점신청일</td>
						<td width="40%"><input type="date" name="start_date">~
							<input type="date" name="end_date"></td>
						<td width="10%" class="table-active">카테고리</td>
						<td width="40%"><select name="food_category"
							class="form-control">
								<option value="">전체</option>
								<option value="">카테고리</option>
						</select></td>
					</tr>
					<tr>
						<td width="10%" class="table-active">키워드 검색</td>
						<td>
							<table class="table table-sm">
								<tbody>
									<tr>
										<td width="40%"><select name="keyword_type"
											class="form-control">
												<option value="">선택</option>
												<option>매장명</option>
												<option>사업주</option>
												<option>전화번호</option>
										</select></td>
										<td><input type="text" name="keyword"
											class="form-control"></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<div style="width: 100%;">
				<input type="submit" value="검색"
					class="btn pull-right btn-outline-primary search-btn">
			</div>
		</form>
	</div>
	<!-- 검색목록창 끝-->

	<div class="list-wrapper table-responsive">
		<table class="table table-hamburg table-hover">
			<thead>
				<tr class="table-primary" align="center">
					<th>번호</th>
					<th>카테고리</th>
					<th>매장명</th>
					<th>승인상태</th>
					<th>계약상태</th>
					<th>편집</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr class="text-center">
						<td>${list.no }</td>
						<td><c:forEach var="name" items="${name}">
								<c:if test="${list.category == name.no}">
		 	${name.name}
		 	</c:if>
							</c:forEach></td>
						<td><a
							href="${pageContext.request.contextPath}/super_admin/shop/detail?no=${list.no }">${list.shop_name }</a></td>
						<c:choose>
							<c:when test="${list.apply_status eq '승인대기'}">
								<td class="text-danger">${list.apply_status}</td>
							</c:when>
							<c:otherwise>
								<td class="text-info">${list.apply_status}</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${list.contract_status eq '계약종료'}">
								<td class="text-danger">${list.contract_status}</td>
							</c:when>
							<c:otherwise>
								<td class="text-info">${list.contract_status}</td>
							</c:otherwise>
						</c:choose>
						<td><c:if test="${list.apply_status eq '승인대기'}">
								<button class="btn btn-sm btn-primary apply_menu"
									data-no="${list.no}">승인</button>
							</c:if>
							<button class="btn btn-sm btn-danger delete_shop"
								data-no="${list.no}">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="text-center">
					<td colspan="5">
						<!-- 처음 페이지로 이동 : 현재 페이지가 1보다 크면 [처음]하이퍼링크를 화면에 출력 --> <c:if
							test="${pageing.curPage > 1 }">
							<a href="javascript:list('1')">[처음]</a>
						</c:if> <!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> <c:if
							test="${pageing.curBlock > 1 }">
							<a href="javascript:list('${pageing.prevBlock }')">[이전]</a>
						</c:if> <!-- 하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 --> <c:forEach var="num"
							begin="${pageing.blockBegin }" end="${pageing.blockEnd }">
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
						<c:if test="${pageing.curBlock < pageing.totBlock }">
							<a href="javascript:list('${pageing.nextPage }')">[다음]</a>
						</c:if> 
						<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
						 <c:if test="${pageing.curPage < pageing.totPage }">
							<a href="javascript:list('${pageing.totPage }')">[끝]</a>
						</c:if>
				</tr>
			</tfoot>
		</table>
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>