<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_service.jsp"></jsp:include>
<script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/kayClient.css" rel="stylesheet">

<div class="qna">
	<div class="offset-2 col-8">
		<span class="qna-number">자주하는 질문</span>
	<div class="empty"></div>
		
<form action="write" method="post">

<div class="form-group">
	<label>질문</label>
	<input type="text" name="question" placeholder="질문을 입력하세요" required>
</div>

<div class="form-group">
	<label>분류</label>
	<select name="category">
		<option value="">선택하세요</option>
		<option value=1>주문접수</option>
		<option value=2>주문확인</option>
		<option value=3>주문취소/변경</option>
		<option value=4>서비스이용</option>
		<option value=5>결제</option>
		<option value=6>가맹 및 기타</option>
		<option value=7>뭐먹지 슈퍼클럽</option>
	</select>
</div>

<div class="form-group">
	<span>등록일</span> 
	<span>${qnaDto.regist_date}</span>

	<span>수정일</span>
	<input type="text" name="edit_date" required>
</div>
<div class="form-group">
	<label>내용</label>
	<textarea name="answer" placeholder="내용을 입력하세요" required></textarea>
</div>
<input type="submit" value="등   록">
<input type="submit" value="목   록">
</form>

<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>