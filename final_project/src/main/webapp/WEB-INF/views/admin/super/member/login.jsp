<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/password-encoder.js"></script>

<style>

	.login{
		width: 600px;
		margin: auto;
	}
	
	.legend{
		text-align: center;
	}
	
	.warn{
		color: red;
		font-size: 15;
	}

</style>

<!-- super admin 로그인 페이지 -->
<div class="login">
	<form action="login" method="post">
		<br><br>
		<legend class="legend">Admin 관리자</legend>
		<hr><br>
		<table class="table table-bordered">
			<tr>
				<td><label for="id">아이디</label></td>
				<td>
					<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." value="${cookie.saveID.value}" required>
				</td>
				<td rowspan="2">
					<input type="submit" name="login" value="로그인">
				</td>
			</tr>
			<tr>
				<td><label class="legend">비밀번호</label></td>
				<td>
					<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요." required>
				</td>
			</tr>
			<tr align="center">
				<td colspan="3">
					<input type="checkbox" name=remember" ${not empty cookie.saveID?"checked":""}>
					<label for="saveID">아이디 저장하기</label>
				</td>
			</tr>
		</table>
		<br><hr>
		<div class="warn">*불법적인 접근 또는 허가되지 않은 사용자가 접속을 시도할 경우 관계 법령에 의해 처벌을 받을 수 있습니다.</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>