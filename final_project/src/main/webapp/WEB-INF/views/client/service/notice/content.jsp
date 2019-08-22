<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
    <script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
	<script src = "https://code.jquery.com/jquery-latest.js"></script>

    
<div class="qna">
<div class="offset-1 col-10">
<span class="qna-number">공지 사항</span>	
<div class="empty"></div>

    <!-- 표 -->
    <table class="qna-qna">
    	<!-- 위에 -->
    	<colgroup>
    	<col width="30%">
    	<col width="70%">
    	</colgroup>
    	<thead >
    	<tr>
    		<th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
    		<th>${ndto.title}</th>
    	</tr>
    	<tr>
    		<th>작&nbsp;성&nbsp;일</th>
    		<th>${ndto.regist_date}</th>
    	</tr>
    	<tr>
    		<th>조&nbsp;회&nbsp;수</th>
    		<th>${ndto.read}</th>
    	</tr>
    	</thead>
    	
    	<!-- 내용  -->
    	<tbody>
    		<td colspan="2" style="height:300px">${ndto.content}	</td>
    	</tbody>
    	
    	<!-- 목록보기 버튼 -->
		<tfoot>
			<tr>
			<td colspan="8" align="center" >
				<a href="list" class="write-btn">목 록</a>
			</td>
			</tr>
		</tfoot>
    </table>
</div>
</div>
    
    <jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>