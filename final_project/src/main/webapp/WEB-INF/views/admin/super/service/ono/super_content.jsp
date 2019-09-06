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
		<span class="qna-number">고객 1:1 문의</span>
		<div class="empty"></div>

<form action="super_content" method="post">

<input type="hidden" name="no" value="${onoDto.no}">
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
					<th class=notice-th2 colspan="3"><span>${onoDto.title}</span></th>
				</tr>
				<tr>
					<th class=notice-th><span>작성자</span></th>
					<th class=notice-th2><span>${onoDto.member_code}</span></th>
					<th class=notice-th><span>카테고리</span></th>
					<th class=notice-th2><span>${onoDto.category}</span></th>
				</tr>
				<tr>
					<th class=notice-th><span>작성일</span></th>
					<th class=notice-th2><span>${onoDto.regist_date}</span></th>
					<th class=notice-th><span>답변상태</span></th>
					<th class=notice-th2><span>${onoDto.reply_status}</span></th>
				</tr>
			</thead>

			<tbody>
				<!-- 내용  -->
				<tr>
					<td class=notice-th style="height: 200px" rowspan="2"><span>내&nbsp;&nbsp;&nbsp;용</span></td>
					<td class=notice-th3  colspan="3" style="height: 200px"><span>${onoDto.content}</span>
					</td>
					</tr>
					<tr>
					<td colspan="3">
					<c:forEach var="imgDto" items="${img_list}">
					<c:if test ="${imgDto.files_no > 0 }">
					<img src="${pageContext.request.contextPath}/ono/ono_img?files_code=${imgDto.files_no}" width="200" class="ono_img"  >
					</c:if>
					</c:forEach>
					</td>
					
				</tr>
				<!-- 답변  -->
				<tr>
					<td class=notice-th style="height: 200px"><span>답&nbsp;&nbsp;&nbsp;변</span></td>
					<td class=notice-th3-1 colspan="3" style="height: 200px"><span><textarea name=reply_content cols="100" rows="11">${onoDto.reply_content}</textarea></span></td>
				</tr>
			</tbody>

			<!-- 목록보기 버튼 -->
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<input class="write-btn1"
							onclick="if(!confirm('저장 하시겠습니까?')){return false;}" type="submit"
							value="등&nbsp;&nbsp;&nbsp;록">
							<c:choose>
					<c:when test="${param.reply_status=='답변대기'}">
					<a href="ono_list?reply_status=${param.reply_status}" class="write-btn">목&nbsp;&nbsp;&nbsp;록</a>
					</c:when>
					<c:otherwise>
					<a href="ono_list" class="write-btn">목&nbsp;&nbsp;&nbsp;록</a>
					</c:otherwise>
					</c:choose>
					</td>
			</tr>
		</tfoot>
    </table>
    </form>
</div>
</div>
    
<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>