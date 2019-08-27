<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<style>

	.find_id{
		width: 800px;
		margin: auto;
	}

</style>

<!-- error 파라미터 유무에 따라 오류메시지를 출력 -->
<c:if test="${not empty param.error}">
	<h4>
		<font color="red">
			해당 이메일이 존재하지 않습니다.
		</font>
	</h4>
</c:if>

<!-- 비밀번호 찾기 -->
<div class="find_id">
	<form action="find_id" method="post">
		<br><br>
		<legend>아이디 찾기</legend>
		<hr><br>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td><label>이메일</label></td>
					<td>
						<input type="text" name="email" placeholder="이메일을 입력해주세요." required>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="이메일 발송">
					</td>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}"><input type="button" value="홈으로" name="main"></a>
					</td>
					<td>
						<a href="find_pw"><input type="button" value="비밀번호 찾기" name="find_pw"></a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>