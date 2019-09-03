<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

   <jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
   <jsp:include page="/WEB-INF/views/template/admin/super/left/left_notice.jsp"></jsp:include>
   <script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
	<script src = "https://code.jquery.com/jquery-latest.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/kayClient.css" rel="stylesheet">

<div class="qna">
	<div class="offset-2 col-8">
		<h4>공지사항</h4>
		<div class="empty"></div>
		<form action="write" method="post" >
			<!-- 표 -->
			<table class="qna-qna">

				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<thead>
				
					<tr>
						<th class=notice-th>카테고리</th>
						<th class=notice-th2><select name="status" required>
								<option value="">선택하세요</option>
								<option>고객</option>
								<option>업주</option>
						</select><select name="type">
								<option value="">선택하세요</option>
								<option>중요</option>
						</select></th>
					<tr>
						<th class=notice-th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						<th><textarea name="title" placeholder="제목을 입력하세요" required
								cols="108" rows="2"></textarea></th>
					</tr>
					<tr>
						<th class=notice-th>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
						<th><textarea name="content" placeholder="내용을 입력하세요" required
								cols="108" rows="6"></textarea></th>
					</tr>

					<!-- 버튼 -->
				<tfoot>
					<tr>
						<td colspan="2" align="center">
							<input class="write-btn1" onclick="if(!confirm('등록 하시겠습니까?')){return false;}" type="submit"
							value="등   록"> 
							<a href="list?status=${param.status }" class="write-btn" onclick="if(!confirm('글 쓰기를 취소 하시겠습니까?')){return false;}">목&nbsp;&nbsp;&nbsp;록</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>
	
	
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>