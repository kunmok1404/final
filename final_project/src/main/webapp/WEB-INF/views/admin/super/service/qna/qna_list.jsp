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
// 		$(".navigator-page").click(function(){
// 			var p = $(this).text();
// 			move(p);
// 		});
		//이동 함수
		function move(no){
			//input[name=page]에 no를 설정한 뒤 form을 전송
			$("input[name=page]").val(no);
			$("form").submit();
		}
		
		$(".navigator-page").click(function(e){
			e.preventDefault();
			var p = $(this).text();
			move(p);
		});
		
// 		$(".page_block").click(function(e){
// 			e.preventDefault();
// 			var p = $(this).text();
// 			switch(p){
// 			case '<':
// 				move(parseInt(page)-1);
// 			break;
// 			case '<<':
// 				move(parseInt(startBlock)-1);
// 			break;
// 			case '>':
// 				move(parseInt(page)+1);
// 			break;
// 			case '>>':
// 				move(parseInt(endBlock)+1);
// 			break;
			
// 			}
// 		});
		
		//select[name=apply_status]인 항목의 값을 선택
		var apply_status ="${param.apply_status}";
		if(apply_status){
		$("select[name=apply_status]").val(apply_status);
		}
		var keyword_type ="${param.keyword_type}";
		if(keyword_type){
		$("select[name=keyword_type]").val(keyword_type);
		}
		var yn ="${param.yn}";
		if(yn){
		$("select[name=yn]").val(yn);
		}
    		
    	})
    
    </script>
	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
		<span class="font-weight-bold" style="font-size:1.2rem;">자주하는 질문</span>
      </div>
     
	  <!-- 검색목록창 시작 -->
	  <div class="search-wrapper">
	  	<form action="qna_list" method="get">
	  	<input type="hidden" name="page" value="1">
	  	<table class="table table-sm">
	  		<tbody>
	  			<tr>
	  				<td width="10%" class="table-active">카테고리</td>
	  				<td width="40%">
	  					<select name="apply_status" class="form-control">
	  						<option>전체</option>
								<c:forEach var="category" items="${category_list}">
								<option>${category.name}</option>
								</c:forEach>
	  					</select>
	  				</td>
	  				<td width="10%" class="table-active">키워드 검색</td>
	  				<td>
	  					<table class="table table-sm">
		  					<tbody>
		  						<tr>
					  				<td width="40%">
					  					<select name="keyword_type" class="form-control">
					  						<option>전체</option>
					  						<option value="question" ${keyword_type == 'question'?'selected':''}>질문</option>
					  					</select>
					  				</td>
					  				<td>
					  					<input type="text" name="keyword" class="form-control" value="${param.keyword}">
					  				</td>
		  						</tr>
		  					</tbody>
	  					</table>
	  				</td>
	  				
	  			</tr>
	  			<tr>
	  				<td width="10%" class="table-active">등록일</td>
	  				<td width="40%">
	  					<input type="date" name="start_date" value="${param.start_date}">~
	  					<input type="date" name="end_date" value="${param.end_date}">
	  				</td>
	  				<td width="10%" class="table-active">진열여부</td>
	  				<td width="40%">
	  					<select name="yn" class="form-control">
	  						<option>전체</option>
	  						<option>Y</option>
	  						<option>N</option>
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
	  				<td>진열여부</td>
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
	<c:if test="${(not (page eq 1))&& not empty page && page>=11}">
	<li><a href="qna_list?page=${startBlock-1}&apply_status=${param.apply_status}&keyword_type=${param.keyword_type}&keyword=${param.keyword}&start_date=${param.start_date}&end_date=${param.end_date}&yn=${param.yn}" class="page_block">&lt;&lt;</a></li>
	</c:if>
	
	<%-- 이전 페이지 링크(pno - 1) --%>
	<c:if test="${not (page eq 1)&& not empty page}">
	<li><a href="qna_list?page=${page-1}&apply_status=${param.apply_status}&keyword_type=${param.keyword_type}&keyword=${param.keyword}&start_date=${param.start_date}&end_date=${param.end_date}&yn=${param.yn}" class="page_block">&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>

	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${page==i}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
			<c:if test="${i>0}">
				<li><a href="qna_list?page=${i}&apply_status=${param.apply_status}&keyword_type=${param.keyword_type}&keyword=${param.keyword}&start_date=${param.start_date}&end_date=${param.end_date}&yn=${param.yn}" class="navigator-page">${i}</a></li>
			</c:if>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<%-- 다음 페이지 링크(pno + 1) --%>
	<c:if test="${not (page eq pageCount)}">
		<li><a href="qna_list?page=${page+1}&apply_status=${param.apply_status}&keyword_type=${param.keyword_type}&keyword=${param.keyword}&start_date=${param.start_date}&end_date=${param.end_date}&yn=${param.yn}" class="page_block">&gt;</a></li>
	</c:if>
	
	<%-- 다음 구간 --%>
	<c:if test="${(not (page eq pageCount)) && pageCount>=10}">
		<li><a href="qna_list?page=${endBlock+1}&apply_status=${param.apply_status}&keyword_type=${param.keyword_type}&keyword=${param.keyword}&start_date=${param.start_date}&end_date=${param.end_date}&yn=${param.yn}" class="page_block">&gt;&gt;</a></li>
	</c:if>
</ul>

	</div>
	<!-- 전체 끝 -->


<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>