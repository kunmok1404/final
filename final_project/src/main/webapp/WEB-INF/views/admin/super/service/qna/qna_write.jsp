<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_service.jsp"></jsp:include>
<script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/kayClient.css" rel="stylesheet">

<div class="qna">
	<div class="offset-1 col-10">
		<h4>자주하는 질문</h4>
		<div class="empty"></div>
		<form action="qna_write" method="post" >
			<!-- 표 -->
			<table class="qna-qna">

			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
				<thead>
				
					<tr >
						<th class=notice-th>카테고리</th>
						<th class=notice-th2 >
						<select name="category" required>
								<option value="">선택하세요</option>
								<c:forEach var="category_list" items="${category_list}">
									<option>${category_list.name}</option>
								</c:forEach>
						</select>
						</th>
						<th class=notice-th>진열여부</th>
						<th class=notice-th2>
						<span><select name="use_yn" required>
								<option value="">선택하세요</option>
								<option>Y</option>
								<option>N</option>
						</select></span>
						</th>
						</tr>
					
					<tr>
						<th class=notice-th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						<th colspan="3"><textarea name="question" required	cols="108" rows="2" style="width:100%"></textarea></th>
					</tr>
					<tr>
						<th class=notice-th>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
						<th colspan="3"><textarea name="answer" placeholder="내용을 입력하세요" required
								cols="108" rows="15" style="width:100%"></textarea></th>
					</tr>

					<!-- 버튼 -->
				<tfoot>
					<tr>
						<td colspan="5" align="center">
							<input class="write-btn1" onclick="if(!confirm('등록 하시겠습니까?')){return false;}" type="submit"
							value="등   록"> 
							<a href="qna_list" class="write-btn" onclick="if(!confirm('글 쓰기를 취소 하시겠습니까?')){return false;}">목&nbsp;&nbsp;&nbsp;록</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>