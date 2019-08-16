<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
    <script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function() {

            //[1] 기본값 설정

            $(".region").show(); //region 영역 보이기

            $("#moreRegion").hide(); //more...숨기기

           

            //[2] more...클릭시 보이기 및 숨기기

            $("th.more").click(function() {

                //3000 : 3초, 'slow', 'normal', 'fast'

                $("#moreRegion").show('3000'); //천천히 보이기

                $(this).hide('fast');//more버튼 숨기기

            });

        });

    </script>

<h4>자주하는 질문</h4>
	<!-- 검색창 -->
	<form class="form" action="list" method="get">
	<input type="hidden" name="page" value="1">
	<select name="category">
		<option value="">전      체</option>
		<option value="order">주문접수</option>
		<option value="confirm">주문확인</option>
		<option value="cancel">주문취소/변경</option>
		<option value="use">서비스이용</option>
		<option value="pay">결제</option>
		<option value="join">가맹 및 기타</option>
		<option value="club">뭐먹지 슈퍼클럽</option>
	</select>
	</form>
	
<div class="empty"></div>

    <!-- 표 -->
    <table>
    	<!-- 위에 -->
    	<thead>
    	<tr>
    		<th>번호</th>
    		<th>카테고리</th>
    		<th>제목</th>
    	</tr>
    	</thead>
    	<!-- 아래  -->
    	<tbody>
    	<tr>
    		<td class="region">
    		<a href ="answer?no=$[qdto.no]">${qdto.question}</a>
    		</td>
    		<td id="moreRegion" style="height:100px">${qdto.answer}</td>
    	</tr>
    	</tbody>
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
    
    <jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>