<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/kayClient.css"
	rel="stylesheet">

<div class="qna">
	<div class="offset-1 col-10">
		<span class="qna-number">1:1 문의</span>
		<div class="empty"></div>

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
					<th class=notice-th><span>제&nbsp;&nbsp;&nbsp;목</span></th>
					<th class=notice-th2 colspan="3"><span>${odto.title}</span></th>
				</tr>
				<tr>
					<th class=notice-th><span>작성자</span></th>
					<th class=notice-th2><span>${odto.member_code}</span></th>
					<th class=notice-th><span>카테고리</span></th>
					<th class=notice-th2><span>${odto.category}</span></th>
				</tr>
				<tr>
					<th class=notice-th><span>작성일</span></th>
					<th class=notice-th2><span>${odto.regist_date}</span></th>
					<th class=notice-th><span>답변상태</span></th>
					<th class=notice-th2><span>${odto.reply_status}</span></th>
				</tr>
			</thead>

			<tbody>
				<!-- 내용  -->
				<tr>
					<td class=notice-th style="height: 200px"><span>내&nbsp;&nbsp;&nbsp;용</span></td>
					<td class=notice-th3  colspan="3" style="height: 200px"><span>${odto.content}</span>
					<img src="download?save_name=${filesDto.save_name}" width="200" height="200"></td>
				</tr>
				<!-- 답변  -->
				<tr>
					<td class=notice-th style="height: 200px"><span>답&nbsp;&nbsp;&nbsp;변</span></td>
					<td class=notice-th3-1 colspan="3" style="height: 200px"><span>${odto.reply_content}</span></td>
				</tr>
			</tbody>

			<!-- 목록보기 버튼 -->
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<a href="edit?no=${odto.no }" class="write-btn1">수&nbsp;&nbsp;&nbsp;정</a>
					<a href="list" class="write-btn">목&nbsp;&nbsp;&nbsp;록</a>
					</td>
			</tr>
		</tfoot>
    </table>
</div>
</div>
    
    <jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>