<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
     <jsp:include page="/WEB-INF/views/template/client/left/service_left.jsp"></jsp:include>
    <script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
	<script src = "https://code.jquery.com/jquery-latest.js"></script>
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
    
<div class="qna">
<div class="offset-2 col-8">
<span class="qna-number">1:1 문의</span>

<div class="empty"></div>

    <!-- 표 -->
    <table class="qna-qna">
    	<!-- 위에 -->
    	<colgroup>
    	<col width="10%">
    	<col width="25%">
    	<col width="35%">
    	<col width="15%">
    	<col width="15%">
    	</colgroup>
    	<thead>
    	<tr>
    		<th>번&nbsp;&nbsp;호</th>
    		<th>카테고리</th>
    		<th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
    		<th>작&nbsp;성&nbsp;일</th>
    		<th>답변상태</th>
    	</tr>
    	</thead>
    	
    	<!-- 아래  -->
    	<tbody>
    	
    	<c:choose>
    		<c:when test="${empty list}">
    		<tr>
    		<td colspan="5" style="height: 400px">
    		<h3>1:1 문의 내역이 존재 하지 않습니다.</h3>
    		</td>
    		</tr>
    		</c:when>
    		<c:otherwise>
    		<c:forEach var ="odto" items="${list}">
    		<tr>
    			<td>${odto.no}</td>
    			<td>
    			<%-- 말머리는 있을 때에만 [] 를 붙여서 출력한다. --%>
				<c:if test="${not empty odto.category}">
				[${odto.category_name}] 
				</c:if>
    			</td>
    			<td>
    			<%-- content로 가기 위해 no를 첨부한다 --%>
    			<a href="content?ono_code=${odto.no}">
					${odto.title}
				</a>
    			</td>
	    		<%-- 등록일 --%>
	    		<td>${odto.regist_date}</td>
	    		<%-- 답변상태 --%>
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
    	<!-- 글쓰기 버튼 -->
		<tfoot>
			<tr>
			<td colspan="8" align="center" >
				<a href="write" class="write-btn">글쓰기</a>
			</td>
			</tr>
		</tfoot>
    </table>

<div class="empty"></div>
    <ul class="navigator">
	<%-- 이전 구간 링크 --%>
	<c:if test="${(not (page eq 1))&& not empty page && page>=6}">
	<li><a href="list?page=${startBlock-1}" class='page_block'>&lt;&lt;</a></li>
	</c:if>
	
	<%-- 이전 페이지 링크(pno - 1) --%>
	<c:if test="${not (page eq 1)&& not empty page}">
	<li><a href="list?page=${page-1}" class='page_block'>&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>
	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${page==i}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
			<c:if test="${i>0}">
				<li><a href="list?page=${i}" class="navigator-page">${i}</a></li>
			</c:if>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<%-- 다음 페이지 링크(pno + 1) --%>
	<c:if test="${not (page eq pageCount)}">
		<li><a href="list?page=${page+1}" class='page_block'>&gt;</a></li>
	</c:if>
	
	<%-- 다음 구간 --%>
	<c:if test="${(not (page eq pageCount)) && pageCount>=5}">
		<li><a href="list?page=${endBlock+1}" class='page_block'>&gt;&gt;</a></li>
	</c:if>
</ul>
</div>
</div>
    
    <jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>