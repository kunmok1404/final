<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
    <script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function() {

            //[1] 기본값 설정
			$("#moreRegion").hide();
            $(".region").click(function(){
            	$(this).parent().next().children().toggle();
            }); //region 영역 보이기
           
            $("select[name=category]").change(function(){
            	var category =  $("select[name=category]").val();
            	location.href="${pageContext.request.contextPath}/qna/list?category="+category;
            });
        });
    </script>
<div class="qna">
<div class="offset-1 col-10">

<h4>자주하는 질문</h4>

<div class="search">
	<!-- 검색창 -->
	<form class="form" action="list" method="get">
	<input type="hidden" name="page" value="1">
	<select name="category">
		<option value="">전   체</option>
		<option value=1>주문접수</option>
		<option value=2>주문확인</option>
		<option value=3>주문취소/변경</option>
		<option value=4>서비스이용</option>
		<option value=5>결제</option>
		<option value=6>가맹 및 기타</option>
		<option value=7>뭐먹지 슈퍼클럽</option>
	</select>
	</form>
</div>
	
<div class="empty"></div>

    <!-- 표 -->
    <table class="qna-qna">
    	<!-- 위에 -->
    	<thead>
    	<tr>
    		<th class="qna-top">번호</th>
    		<th class="qna-top">카테고리</th>
    		<th class="qna-top">제목</th>
    	</tr>
    	</thead>
    	<!-- 아래  -->
    	<tbody>
    		<c:forEach var ="qdto" items="${list}">
    		<tr>
    			<td>${qdto.no}</td>
    			<td>
    			<%--말멀리 있을때 []붙여서 출력 --%>
    			<c:if test ="${not empty qdto.category}">
    			[${qdto.category}]
    			</c:if>
    			</td>
    			
    			<%-- 질문 --%>
	    		<td class="region">${qdto.question}	</td>
	   		 </tr>
	    	<tr>
	    		<%-- 답변 --%>
	    		<td id="moreRegion" style="height:100px">${qdto.answer}</td>
			</tr>
			</c:forEach>
    	</tbody>
		<!-- 글쓰기 버튼 -->
		<tfoot>
			<tr>
			<td colspan="8" align="right">
				<a href="write">글쓰기</a>
			</td>
			</tr>
		</tfoot>
    			
    </table>

    
    <ul class="navigator">
	<%-- 이전 구간 링크 --%>
	<c:if test="${not p.isFirstBlock()}">
	<li><a href="list?${p.getPrevBlock()}">&lt;&lt;</a></li>
	</c:if>
	
	<%-- 이전 페이지 링크(pno - 1) --%>
	<c:if test="${not p.isFirstPage()}">
	<li><a href="list?${p.getPrevPage()}">&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>
	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${page==i}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
				<li><a href="#" class="navigator-page">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<%-- 다음 페이지 링크(pno + 1) --%>
	<c:if test="${not p.isLastPage()}">
		<li><a href="list?${p.getNextPage()}">&gt;</a></li>
	</c:if>
	
	<%-- 다음 구간 --%>
	<c:if test="${not p.isLastBlock()}">
		<li><a href="list?${p.getNextBlock()}">&gt;&gt;</a></li>
	</c:if>
</ul>
</div>
</div>
    
    <jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>