<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_service.jsp"></jsp:include>
<script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/kayClient.css"
	rel="stylesheet">

<div class="qna">
	<div class="offset-2 col-8">
		<span class="qna-number">자주하는 질문</span>
		<div class="empty"></div>

<form action="qna_content" method="post">

<input type="hidden" name="no" value="${qdto.no}">
		<!-- 표 -->
		<table class="qna-qna">
			<!-- 위에 -->
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<thead>
				<tr>
					<th class=notice-th><span>질&nbsp;&nbsp;&nbsp;문</span></th>
					<th class=notice-th2 colspan="3"><span>${qdto.question}</span></th>
				</tr>

				<tr>
					<th class=notice-th><span>카테고리</span></th>
					<th class=notice-th2><span>${qdto.category}</span></th>
					<th class=notice-th><span>진열여부</span></th>
					<th class=notice-th2><span>${qdto.use_yn}</span></th>
				</tr>
				<tr>
					<th class=notice-th><span>등록일</span></th>
					<th class=notice-th2><span>${qdto.regist_date}</span></th>
					<th class=notice-th><span>수정일</span></th>
					<th class=notice-th2><span>${qdto.edit_date}</span></th>
				</tr>
			</thead>

			<tbody>
				<!-- 내용  -->
				<tr>
					<td class=notice-th style="height: 200px" rowspan="2"><span>내&nbsp;&nbsp;&nbsp;용</span></td>
					<td class=notice-th3  colspan="3" style="height: 200px"><span>${qdto.answer}</span>
					</td>
					</tr>
					
				
			</tbody>

			<!-- 목록보기 버튼 -->
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<a href="qna_edit?no=${qdto.no }" class="write-btn">수&nbsp;&nbsp;&nbsp;정</a>
					<a href="qna_list" class="write-btn">목&nbsp;&nbsp;&nbsp;록</a>
					</td>
			</tr>
		</tfoot>
    </table>
    </form>
</div>
</div>
    
<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>