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
		
		//select[name=apply_status]인 항목의 값을 선택
		var apply_status ="${param.apply_status}";
		if(apply_status){
		$("select[name=apply_status]").val(apply_status);
		}
		var keyword_type ="${param.keyword_type}";
		if(keyword_type){
		$("select[name=keyword_type]").val(keyword_type);
		}
		
    	})
    
    </script>
	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>고객 1:1 문의</span>
      </div>
     
	  <!-- 검색목록창 시작 -->
	  <div class="search-wrapper">
	  	<form action="ono_list" method="get">
	  	<input type="hidden" name="page" value="1">
	  	<table class="table table-sm">
	  		<tbody>
	  			<tr>
	  				<td width="10%" class="table-active">답변상태</td>
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
	  				
	  			</tr>
	  			
	  		</tbody>
	  	</table>
	  	<div style="width:100%;">
	  	<input type="submit" value="검색" class="btn pull-right btn-outline-primary search-btn">
	  	</div>
	  	</form>
	  </div>
	  <!-- 검색목록창 끝-->
	  
	  <!-- 답변 개수 -->
	  <div class="list-wrapper table-responsive">
	  <div class="search-number">
	  <c:choose>
	  <c:when test="${param.reply_status=='답변대기'}">
	  	<p>총 ${count_reply}건</p>
	  </c:when>
	  	<c:otherwise>
	  	<p>총 ${client_count}건</p>
	  	</c:otherwise>
	  </c:choose>
	  </div>
	  
	  <!-- 목록 시작 -->	  
	  	<table class="table table-hamburg table-hover">
	  		<tbody>
	  			<tr class="table-primary text-center">
	  				<td>번호</td>
	  				<td>제목</td>
	  				<td>작성자</td>
	  				<td>작성일</td>
	  				<td>답변상태</td>
	  			</tr>
	  <!-- 답변 대기 이면 -->
	  	<c:choose>
    		<c:when test="${param.reply_status=='답변대기'}">	
    			<c:forEach var="odto" items="${list2}">
	  			<tr class="text-center">
	  				<td>${odto.no}</td>
	  				<td>
	  				<%-- content로 가기 위해 no를 첨부한다 --%>
    				<a href="super_content?ono_code=${odto.no}&reply_status=${param.reply_status}">
						${odto.title}
					</a></td>
	  				<td>${odto.member_code}</td>
	  				<td>${odto.regist_date}</td>
	  				<c:choose>
	  					<c:when test="${odto.reply_status eq '답변대기'}">
	  						<td class="text-danger">${odto.reply_status}</td>
	  					</c:when>
	  					<c:otherwise>
	  						<td class="text-primary">${odto.reply_status}</td>
	  					</c:otherwise>
	  				</c:choose>
	  			</tr>
	  			</c:forEach>
	  		</c:when>
	  		
	  		
	  		<c:otherwise>
	  			<c:forEach var="odto" items="${list}">
	  			<tr class="text-center">
	  				<td>${odto.no}</td>
	  				<td>
	  				<%-- content로 가기 위해 no를 첨부한다 --%>
    				<a href="super_content?ono_code=${odto.no}">
						${odto.title}
					</a></td>
	  				<td>${odto.member_code}</td>
	  				<td>${odto.regist_date}</td>
	  				<c:choose>
	  					<c:when test="${odto.reply_status eq '답변대기'}">
	  						<td class="text-danger">${odto.reply_status}</td>
	  					</c:when>
	  					<c:otherwise>
	  						<td class="text-primary">${odto.reply_status}</td>
	  					</c:otherwise>
	  				</c:choose>
	  			</tr>
	  			</c:forEach>
	  		</c:otherwise>
	  	</c:choose>	
	  		</tbody>
	  	</table>
	  </div>
	  <!-- 목록 끝 -->
<c:choose>
<c:when test="${param.reply_status=='답변대기'}">
	 <ul class="navigator">

	<%-- 이전 구간 링크 --%>
	<c:if test="${not p.isFirstBlock()}">
	<li><a href="ono_list?${p.getPrevBlock()}&reply_status=${param.reply_status}">&lt;&lt;</a></li>
	</c:if>
	
	<%-- 이전 페이지 링크(pno - 1) --%>
	<c:if test="${not p.isFirstPage()}">
	<li><a href="ono_list?${p.getPrevPage()}&reply_status=${param.reply_status}">&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>

	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${page==i}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
				<li><a href="ono_list?page=${i}&reply_status=${param.reply_status}" class="navigator-page">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<%-- 다음 페이지 링크(pno + 1) --%>
	<c:if test="${not p.isLastPage()}">
		<li><a href="ono_list?${p.getNextPage()}&reply_status=${param.reply_status}">&gt;</a></li>
	</c:if>
	
	<%-- 다음 구간 --%>
	<c:if test="${not p.isLastBlock()}">
		<li><a href="ono_list?${p.getNextBlock()}&reply_status=${param.reply_status}">&gt;&gt;</a></li>
	</c:if>

</ul>
</c:when>
<c:otherwise>
	 <ul class="navigator">

	<%-- 이전 구간 링크 --%>
	<c:if test="${not p.isFirstBlock()}">
	<li><a href="ono_list?${p.getPrevBlock()}">&lt;&lt;</a></li>
	</c:if>
	
	<%-- 이전 페이지 링크(pno - 1) --%>
	<c:if test="${not p.isFirstPage()}">
	<li><a href="ono_list?${p.getPrevPage()}">&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>

	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${page==i}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
				<li><a href="ono_list?page=${i}" class="navigator-page">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<%-- 다음 페이지 링크(pno + 1) --%>
	<c:if test="${not p.isLastPage()}">
		<li><a href="ono_list?${p.getNextPage()}">&gt;</a></li>
	</c:if>
	
	<%-- 다음 구간 --%>
	<c:if test="${not p.isLastBlock()}">
		<li><a href="ono_list?${p.getNextBlock()}">&gt;&gt;</a></li>
	</c:if>

</ul>
</c:otherwise>
</c:choose>
	</div>
	<!-- 전체 끝 -->


<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>