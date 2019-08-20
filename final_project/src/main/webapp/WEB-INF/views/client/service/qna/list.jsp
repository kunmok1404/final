<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
    <script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
	<script src = "https://code.jquery.com/jquery-latest.js"></script>
    
    <script>
    	$(function(){
    		
    		   //[1] 기본값 설정
			$(".moreRegion").hide();
            $(".region").click(function(){
            	
            	$(this).parent().next().children().toggle();
            }); //region 영역 보이기
           
            $("select[name=category]").change(function(){
            	var category =  $("select[name=category]").val();
            	location.href="${pageContext.request.contextPath}/qna/list?category="+category;
            });
        });
        
        function selectItem(val){
        	location.href="${pageContext.request.contextPath}/qna/list?category="+val;
        };

    </script>
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
<div class="offset-1 col-10">

<!-- <div class="btn btn-default dropdown-toggle"> -->
<!-- 	<!-- 검색창 -->
<!-- 	<form class="form" action="list" method="get"> -->
<!-- 	<input type="hidden" name="page" value="1"> -->
<!-- 	<select name="category"> -->
<!-- 		<option value="">전   체</option> -->
<!-- 		<option value=1>주문접수</option> -->
<!-- 		<option value=2>주문확인</option> -->
<!-- 		<option value=3>주문취소/변경</option> -->
<!-- 		<option value=4>서비스이용</option> -->
<!-- 		<option value=5>결제</option> -->
<!-- 		<option value=6>가맹 및 기타</option> -->
<!-- 		<option value=7>뭐먹지 슈퍼클럽</option> -->
<!-- 	</select> -->
<!-- 	</form> -->
<!-- </div> -->
<div class="border-bottom filter-wrap">
        <div class="container filter">
          <div class="offset-0 col-md-12">
          <span class="qna-number">자주하는 질문</span>
            <span class="shop-filter">
              <span class="qna-dropdown">
                <a class="btn btn-default dropdown-toggle" href="javascript:selectItem('')" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  전   체
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                  <a class="dropdown-item" href="javascript:selectItem('1')">주문접수</a>
                  <a class="dropdown-item" href="javascript:selectItem('2')">주문확인</a>
                  <a class="dropdown-item" href="#">주문취소/변경</a>
                  <a class="dropdown-item" href="#">서비스이용</a>
                  <a class="dropdown-item" href="#">결제</a>
                  <a class="dropdown-item" href="#">가맹 및 기타</a>
                  <a class="dropdown-item" href="#">뭐먹지 슈퍼클럽</a>
                </div>
              </span>
            </span>
          </div>
        </div>
      </div>
	
<div class="empty"></div>

    <!-- 표 -->
    <table class="qna-qna">
    	<!-- 위에 -->
    	<colgroup>
    	<col width="10%">
    	<col width="20%">
    	<col width="70%">
    	</colgroup>

    	<thead >
    	<tr>
    		<th>번    호</th>
    		<th>카	테		고		리</th>
    		<th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
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
	    		<td class="moreRegion" style="height:230px" colspan="3">${qdto.answer}</td>
			</tr>
			</c:forEach>
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
				<li><a href="list?page=${i}" class="navigator-page">${i}</a></li>
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