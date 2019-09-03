<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/template/admin/super/left/left_notice.jsp"></jsp:include>
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
		//select[name=keyword]인 항목의 값을 선택
		var keyword ="${param.keyword}";
		if(keyword){
		$("select[name=keyword]").val(keyword);
		}
    		
    	})
    
    </script>
<div class="qna">
<div class="offset-2 col-8">
<c:if test="${param.status=='고객' }">
	<span class="qna-number">고객 공지사항</span>
</c:if>
<c:if test="${param.status=='업주' }">
	<span class="qna-number">업주 공지사항</span>
</c:if>
<!-- <span class="qna-number">공지 사항</span> -->    
    
<div class="search">
	<!-- 검색창-->
	<form class="form" action="list" method="get">
	<input type="hidden" name="page" value="1">
	<input type="hidden" name="status" value="1">
	<input type="search" name="keyword" placeholder="제목 + 내용" required value="${param.keyword}">

	<img class="search_btn" src="${pageContext.request.contextPath}/resources/image/search.png" width="30" height="30">

	</form>
</div>
	

<div class="empty"></div>
    <!-- 표 -->
    <table class="qna-qna">
    	<!-- 위에 -->
    	<colgroup>
    	<col width="10%">
    	<col width="45%">
    	<col width="25%">
    	<col width="20%">
    	</colgroup>
    	<thead>
    	<tr>
    		<th>번    호</th>
    		<th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
    		<th>작 성 일</th>
    		<th>조	회</th>
    	</tr>
    	</thead>
    	
    	<!-- 아래  -->
    	<tbody>
    	
    	<!-- 중요 -->
    	<c:choose>
    			<c:when test="${param.status=='고객'}">

    		<c:forEach var ="ndto" items="${list2}">
    		<tr>
    			
    			<%--[중요]일 경우 번호없애고 [공지]로 바꾸기--%>
    				<td style="color: red">[공지]</td>
 
    			<td style="color: red">
    			<%--말머리 있을때 []붙여서 출력 --%>
    			<c:if test ="${not empty ndto.type}" >
    			[${ndto.type}]
    			</c:if>
    			
    			<%-- content로 가기 위해 no를 첨부한다 --%>
    			<c:choose>
    			<c:when test="${not empty ndto.type}">
				<a href="content?no=${ndto.no}&status=${ndto.status}" style="color: red">
					${ndto.title}
				</a>
				</c:when>
			<c:otherwise>
				<a href="content?no=${ndto.no}&status=${ndto.status}" style="color: black">
					${ndto.title}
				</a>
			</c:otherwise>
		</c:choose>
    			</td>
	    		<%-- 등록일 --%>
	    		<td>${ndto.regist_date}</td>
	    		<%-- 조회수 --%>
	    		<td>${ndto.read}	</td>
			</tr>
			</c:forEach>
			</c:when>
		<c:otherwise>
		 		<c:forEach var ="ndto" items="${list4}">
    		<tr>
    			
    			<%--[중요]일 경우 번호없애고 [공지]로 바꾸기--%>
    				<td style="color: red">[공지]</td>
 
    			<td style="color: red">
    			<%--말머리 있을때 []붙여서 출력 --%>
    			<c:if test ="${not empty ndto.type}" >
    			[${ndto.type}]
    			</c:if>
    			
    			<%-- content로 가기 위해 no를 첨부한다 --%>
    		<c:choose>
    			<c:when test="${not empty ndto.type}">
				<a href="content?no=${ndto.no}&status=${ndto.status}" style="color: red">
					${ndto.title}
				</a>
				</c:when>
			<c:otherwise>
				<a href="content?no=${ndto.no}&status=${ndto.status}" style="color: black">
					${ndto.title}
				</a>
			</c:otherwise>
			</c:choose>
    			</td>
	    		<%-- 등록일 --%>
	    		<td>${ndto.regist_date}</td>
	    		<%-- 조회수 --%>
	    		<td>${ndto.read}	</td>
			</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
		
		
<!-- 일반 -->
		<c:choose>
    			<c:when test="${param.status=='고객'}">

    		<c:forEach var ="ndto" items="${list}">
    		<tr>
    			<td>${ndto.no}</td>
    			<td style="color: red">
    			<%--말머리 있을때 []붙여서 출력 --%>
    			<c:if test ="${not empty ndto.type}" >
    			[${ndto.type}]
    			</c:if>
    			
    			<%-- content로 가기 위해 no를 첨부한다 --%>
    			<c:choose>
    			<c:when test="${not empty ndto.type}">
				<a href="content?no=${ndto.no}&status=${ndto.status}" style="color: red">
					${ndto.title}
				</a>
				</c:when>
			<c:otherwise>
				<a href="content?no=${ndto.no}&status=${ndto.status}" style="color: black">
					${ndto.title}
				</a>
			</c:otherwise>
		</c:choose>
    			</td>
	    		<%-- 등록일 --%>
	    		<td>${ndto.regist_date}</td>
	    		<%-- 조회수 --%>
	    		<td>${ndto.read}	</td>
			</tr>
			</c:forEach>
			</c:when>
		<c:otherwise>
		 		<c:forEach var ="ndto" items="${list3}">
    		<tr>
    			
 				<td>${ndto.no}</td>
    			<td style="color: red">
    			<%--말머리 있을때 []붙여서 출력 --%>
    			<c:if test ="${not empty ndto.type}" >
    			[${ndto.type}]
    			</c:if>
    			
    			<%-- content로 가기 위해 no를 첨부한다 --%>
    		<c:choose>
    			<c:when test="${not empty ndto.type}">
				<a href="content?no=${ndto.no}&status=${ndto.status}" style="color: red">
					${ndto.title}
				</a>
				</c:when>
			<c:otherwise>
				<a href="content?no=${ndto.no}&status=${ndto.status}" style="color: black">
					${ndto.title}
				</a>
			</c:otherwise>
			</c:choose>
    			</td>
	    		<%-- 등록일 --%>
	    		<td>${ndto.regist_date}</td>
	    		<%-- 조회수 --%>
	    		<td>${ndto.read}	</td>
			</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
    	</tbody>
<!-- 글쓰기 버튼 -->
		<tfoot>
			<tr>
			<td colspan="8" align="center" >
				<a href="write?status=${param.status }" class="write-btn">등&nbsp;&nbsp;록</a>
			</td>
			</tr>
		</tfoot>
    	
    </table>

<div class="empty"></div>
    <ul class="navigator">

	<%-- 이전 구간 링크 --%>
	<c:if test="${not p.isFirstBlock()}">
	<li><a href="list?${p.getPrevBlock()}&status=${param.status}">&lt;&lt;</a></li>
	</c:if>
	
	<%-- 이전 페이지 링크(pno - 1) --%>
	<c:if test="${not p.isFirstPage()}">
	<li><a href="list?${p.getPrevPage()}&status=${param.status}">&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>

	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${page==i}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
				<li><a href="list?page=${i}&status=${param.status}" class="navigator-page">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<%-- 다음 페이지 링크(pno + 1) --%>
	<c:if test="${not p.isLastPage()}">
		<li><a href="list?${p.getNextPage()}&status=${param.status}">&gt;</a></li>
	</c:if>
	
	<%-- 다음 구간 --%>
	<c:if test="${not p.isLastBlock()}">
		<li><a href="list?${p.getNextBlock()}&status=${param.status}">&gt;&gt;</a></li>
	</c:if>


</ul>
</div>
</div>
   <jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>