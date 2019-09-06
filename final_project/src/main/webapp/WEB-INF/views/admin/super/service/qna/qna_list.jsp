<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_service.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/css/kayClient.css" rel="stylesheet">
    <script>
    
	$(function(){
		//목표 : 페이지 번호를 누르면 해당하는 번호의 페이지로 이동처리
		// 		이동은 form을 전송하는 것으로 대체
		$(".navigator-page").click(function(){
			var p = $(this).text();
			move(p);
		});
		//이동 함수
		function move(no){
		//input[name=page]에 no를 설정한 뒤 form을 전송
		$("input[name=page]").val(no);
		$("form").submit();
		}
    		
    	})
    
    </script>
	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
		<span>자주하는 질문</span>
      </div>
     
	  <!-- 검색목록창 시작 -->
	  <div class="search-wrapper">
	  	<form action="" method="get">
	  	<table class="table table-sm">
	  		<tbody>
	  			<tr>
	  				<td width="10%" class="table-active">카테고리</td>
	  				<td width="40%">
	  					<select name="apply_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">답변대기</option>
	  						<option value="">답변완료</option>
	  					</select>
	  				</td>
	  				<td width="10%" class="table-active">키워드 검색</td>
	  				<td>
	  					<table class="table table-sm">
		  					<tbody>
		  						<tr>
					  				<td width="40%">
					  					<select name="keyword_type" class="form-control">
					  						<option value="">제목</option>
					  						<option value="">작성자</option>
					  					</select>
					  				</td>
					  				<td>
					  					<input type="text" name="keyword" class="form-control">
					  				</td>
		  						</tr>
		  					</tbody>
	  					</table>
	  				</td>
	  				
	  			</tr>
	  			<tr>
	  				<td width="10%" class="table-active">등록일</td>
	  				<td width="40%">
	  					<input type="date" name="start_date">~
	  					<input type="date" name="end_date">
	  				</td>
	  				<td width="10%" class="table-active">진열여부</td>
	  				<td width="40%">
	  					<select name="apply_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">Y</option>
	  						<option value="">N</option>
	  					</select>
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
	  
	  
	  <!-- 목록 시작 -->	  
	  	<table class="table table-hamburg table-hover">
	  		<tbody>
	  			<tr class="table-primary text-center">
	  				<td>번호</td>
	  				<td>질문	</td>
	  				<th>카테고리</th>
	  				<td>득록일</td>
	  				<td>수정일</td>
	  				<td>작성여부</td>
	  				<td>편집</td>
	  			</tr>
	  		
	  			<c:forEach var="qdto" items="${list}">
	  			<tr class="text-center">
	  				<td>${qdto.no}</td>
	  				<td>
	  				<%-- content로 가기 위해 no를 첨부한다 --%>
    				<a href="qna_content?no=${qdto.no}">
						${qdto.question}
					</a></td>
	  				<td>${qdto.category}</td>
	  				<td>${qdto.regist_date}</td>
	  				<td>${qdto.edit_date}</td>
	  				<td>${qdto.use_yn}</td>
	  				<td><a href="qna_delete?no=${qdto.no}"><button class="btn btn-sm btn-danger">삭제</button></a></td>
	  			</tr>
	  			</c:forEach>
	  		</tbody>
	  		<!-- 글쓰기 버튼 -->
		<tfoot>
			<tr>
			<td colspan="8" align="center" >
				<a href="qna_write" class="write-btn">질문등록</a>
			</td>
			</tr>
		</tfoot>
	  	</table>
	  </div>
	  <!-- 목록 끝 -->

	 <ul class="navigator">

	<%-- 이전 구간 링크 --%>
	<c:if test="${not p.isFirstBlock()}">
	<li><a href="qna_list?${p.getPrevBlock()}">&lt;&lt;</a></li>
	</c:if>
	
	<%-- 이전 페이지 링크(pno - 1) --%>
	<c:if test="${not p.isFirstPage()}">
	<li><a href="qna_list?${p.getPrevPage()}">&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>

	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${page==i}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
				<li><a href="qna_list?page=${i}" class="navigator-page">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<%-- 다음 페이지 링크(pno + 1) --%>
	<c:if test="${not p.isLastPage()}">
		<li><a href="qna_list?${p.getNextPage()}">&gt;</a></li>
	</c:if>
	
	<%-- 다음 구간 --%>
	<c:if test="${not p.isLastBlock()}">
		<li><a href="qna_list?${p.getNextBlock()}">&gt;&gt;</a></li>
	</c:if>

</ul>

	</div>
	<!-- 전체 끝 -->


<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>