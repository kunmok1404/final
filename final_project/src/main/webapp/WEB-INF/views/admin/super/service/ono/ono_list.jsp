<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_service.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/css/kayClient.css" rel="stylesheet">
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
	  	<form action="" method="get">
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
	  				</td><td width="10%" class="table-active">키워드 검색</td>
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
	  
	  <!-- 목록 시작 -->
	  <div class="list-wrapper table-responsive">
	  <div class="search-number">
	  	<p>총 ${count}건</p>
	  </div>
	  	<table class="table table-hamburg table-hover">
	  		<tbody>
	  			<tr class="table-primary text-center">
	  				<td>번호</td>
	  				<td>제목</td>
	  				<td>작성자</td>
	  				<td>작성일</td>
	  				<td>답변상태</td>
	  			</tr>
	  			
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
	  			
	  		</tbody>
	  	</table>
	  </div>
	  <!-- 목록 끝 -->


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
	</div>
	<!-- 전체 끝 -->







<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>