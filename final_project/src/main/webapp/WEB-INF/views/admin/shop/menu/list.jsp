<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/shop/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/shop/left/left_menu.jsp"></jsp:include>
<script>

	$(function(){
		
		// 승인버튼 클릭시
		$(".apply_menu").click(function(){
			var result = confirm("승인하시겠습니까?");
			var $this = $(this);
			var menu_code = $(this).attr("data-no");
			if(result){
				$.ajax({
					url : "${pageContext.request.contextPath}/super_admin/menu/apply_menu",
					data : {
						menu_code : menu_code,
					},
					success : function(response){
						alert(response);
						$this.parent().prev().prev().prev().text("승인완료").css("color","#58A2B8").removeClass("text-danger");
						$this.remove();
					}
				})
			}
			
		})
		
		// 삭제버튼 클릭시
		$(".delete_menu").click(function(){
			var result = confirm("메뉴를 삭제하시겠습니까?");
			var $this = $(this);
			var menu_code = $(this).attr("data-no");
			if(result){
				$.ajax({
					url : "${pageContext.request.contextPath}/shop_admin/menu/delete_menu",
					data : {
						menu_code : menu_code,
					},
					success : function(response){
						alert(response);
						$this.closest("tr").remove();
					}
				})
			}
			
		})
		
	})
$(function(){
	$(".navigator-no").click(function(e) {
		//a태그는 클릭하면 이동하는게 기본 액션
		//못하게 하려면 e.preventDefault();
		e.preventDefault();
		var p = $(this).text();
		move(p);
	});
	//페이지 번호를 누르면 해당하는 번호의 페이지로 이동처리
	//이동은 form을 전송하는것으로 대체	
	function move(no) {
		//input[name=page]에 no를 설정한뒤 form을 전송
		$("input[name=page]").val(no);
		$(".searchForm").submit();
	}

	//select[name=type]인 항목의 값을 선택
	$("select[name=sale_status]").val("${param.sale_status}");
	$("select[name=apply_status]").val("${param.apply_status}");
	$("select[name=type]").val("${param.type}");
	
})
</script>

	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>메뉴 목록</span>
      </div>
     
	  <!-- 검색목록창 시작 -->
	  <div class="search-wrapper">
	  	<form action="list" method="get" class="searchForm">
	  	<input type="hidden" name="page" value="1">
	  	<table class="table table-sm">
	  		<tbody>
	  			<tr>
	  				<td width="10%" class="table-active">승인상태</td>
	  				<td width="40%">
	  					<select name="apply_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="승인대기">승인대기</option>
	  						<option value="승인완료">승인완료</option>
	  					</select>
	  				</td>
	  				<td width="10%" class="table-active">판매상태</td>
	  				<td width="40%">
	  					<select name="sale_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="판매중">판매중</option>
	  						<option value="판매중지">판매중지</option>
	  					</select>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td width="10%" class="table-active">등록일</td>
	  				<td width="40%">
	  					<input type="date" name="start_date">~
	  					<input type="date" name="end_date">
	  				</td>
	  			</tr>
	  			<tr>
	  				<td width="10%" class="table-active">키워드 검색</td>
	  				<td>
	  					<table class="table table-sm">
		  					<tbody>
		  						<tr>
					  				<td width="40%">
					  					<select name="type" class="form-control">
					  						<option value="name">메뉴명</option>
					  						<option value="no">메뉴코드</option>
					  						<option value="">매장명</option>
					  						<option value="">전화번호</option>
					  					</select>
					  				</td>
					  				<td>
					  					<input style="width:100%" type="text" name="keyword" value="${param.keyword}">
					  				</td>
		  						</tr>
		  					</tbody>
	  					</table>
	  				</td>
	  			</tr>
	  		</tbody>
	  	</table>
	  	<div style="width:100%;">
	  	<input type="submit" value="검색" class="btn pull-right btn-outline-primary search-btn">
	  	</div>
	  	</form>
	  </div>
	  <!-- 검색목록창 끝-->
	  
	  <!-- 리뷰목록 시작 -->
	  <div class="list-wrapper table-responsive">
	  <div class="search-number">
	  	<p>총 0건</p>
	  </div>
	  	<table class="table table-hamburg table-hover">
	  		<tbody>
	  			<tr class="table-primary text-center">
	  				<td>번호</td>
	  				<td>메뉴명</td>
	  				<td>메뉴카테고리</td>
	  				<td>매장명</td>
	  				<td>승인상태</td>
	  				<td>판매상태</td>
	  				<td>등록일</td>
	  				<td>편집</td>
	  			</tr>
	  			
	  			<c:forEach var="menuVO" items="${menu}">
	  			<tr class="text-center">
	  				<td>${menuVO.no}</td>
	  				<td class="over-text"><a href="${pageContext.request.contextPath}/shop_admin/menu/detail?menu_code=${menuVO.no}" class="text-primary">${menuVO.name}</a></td>
	  				<td>${menuVO.menu_category}</td>
	  				<td>${menuVO.shop_name}</td>
	  				<c:choose>
	  					<c:when test="${menuVO.apply_status eq '승인대기'}">
	  						<td class="text-danger">${menuVO.apply_status}</td>
	  					</c:when>
	  					<c:otherwise>
	  						<td class="text-info">${menuVO.apply_status}</td>
	  					</c:otherwise>
	  				</c:choose>
	  				<c:choose>
	  					<c:when test="${menuVO.sale_status eq '판매중지'}">
	  						<td class="text-danger">${menuVO.sale_status}</td>
	  					</c:when>
	  					<c:otherwise>
	  						<td class="text-info">${menuVO.sale_status}</td>
	  					</c:otherwise>
	  				</c:choose>
	  				<td>${menuVO.regist_date}</td>
	  				<td>
	  						<button class="btn btn-sm btn-danger delete_menu" data-no="${menuVO.no}">삭제</button>
	  				</td>
	  			</tr>
	  			</c:forEach>
	  			
	  		</tbody>
	  	</table>
	  	
	  	<!-- 페이징 처리 -->
	  	<div align="center">
  		  	<h4>
				<c:if test="${not p.isFirstBlock()}">
					<a href="list">&lt;&lt;</a>
				</c:if>
				<c:if test="${not p.isFirstPage()}">
					<a href="list">&lt;</a>
				</c:if>
				<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
					<c:choose>
						<c:when test="${param.page == i}">
							<font color="red">${i}</font>
						</c:when>
						<c:otherwise>
							<a href="#" class="navigator-no">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${not p.isLastPage()}">
					<a href="list?${p.getNextPage()}">&gt;</a>
				</c:if>
				<c:if test="${not p.isLastBlock()}">
					<a href="list?${p.getNextBlock()}">&gt;&gt;</a>
				</c:if>
			</h4>
  		</div>
	  	
	  </div>
	  <!-- 리뷰목록 끝 -->
	</div>
	<!-- 전체 끝 -->







<jsp:include page="/WEB-INF/views/template/admin/shop/footer.jsp"></jsp:include>