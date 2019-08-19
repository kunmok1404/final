<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/ckeditor.js"></script>
<script>
	$(function(){
	    ClassicEditor
	            .create( document.querySelector( 'textarea[name=answer]' ) )
	            .catch( error => {
	                console.error( error );
	            } );
	});
</script>
<h4>자주하는 질문</h4>
<form action="write" method="post">
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
	<label>제목</label>
	<input type="text" name="question" placeholder="제목을 입력하세요" required>
</div>
<div class="form-group">
	<label>내용</label>
	<textarea name="answer" placeholder="내용을 입력하세요" required></textarea>
</div>
<input type="submit" value="등   록">
<input type="submit" value="목   록">
</form>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>