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
	<script>
	$(function(){
		var category ="${qdto.category}";
		$("select[name=category]").val(category);
		var use_yn ="${qdto.use_yn}";
		$("select[name=use_yn]").val(use_yn);
	});
</script>
<div class="qna">
	<div class="offset-2 col-8">
		<span class="qna-number">자주하는 질문</span>
		<div class="empty"></div>

<form action="qna_edit" method="post">

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
					<th class=notice-th2 colspan="3"><textarea name = "question" rows="2" cols="108">${qdto.question}</textarea></th>
				</tr>

				<tr>
				
					<th class=notice-th><span>카테고리</span></th>
					<th>
						<select name="category" required>
							<option value="">선택하세요</option>
								<c:forEach var="category_list" items="${category_list}">
									<option value="${category_list.no}">${category_list.name}</option>
								</c:forEach>
						</select>
					</th>
					
					<th class=notice-th><span>진열여부</span></th>
					<th class=notice-th2>
					<select name="use_yn" required>
								<option value="">선택하세요</option>
								<option>Y</option>
								<option>N</option>
						</select></th>
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
					<td class=notice-th3  colspan="3" style="height: 200px">
					<textarea name="answer" rows="11" cols="108">${qdto.answer}</textarea>
					</td>
					</tr>
					
				
			</tbody>

			<!-- 목록보기 버튼 -->
			<tfoot>
				<tr>
					<td colspan="4" align="center"><input class="write-btn1"
							onclick="if(!confirm('수정 하시겠습니까?')){return false;}" type="submit"
							value="수   정">
					<a href="qna_list" class="write-btn"onclick="if(!confirm('수정하기를 취소 하시겠습니까?')){return false;}">
					목&nbsp;&nbsp;&nbsp;록</a>
					</td>
			</tr>
		</tfoot>
    </table>
    </form>
</div>
</div>
    
<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>