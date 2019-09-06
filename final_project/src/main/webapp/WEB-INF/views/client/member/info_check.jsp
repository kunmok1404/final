<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/password-encoder.js"></script>

<script>

</script>

<style>

	.info_check{
		width: 700px;
		margin: auto;
		min-height: 500px;
		text-align: center;
	}
	
	.pwcheck{
		text-align: center;
	}
	
	.info_check table{
		width: 80%;
		margin-left: 10%;
	}

</style>

<div class="info_check">
	<form action="info_check" method="post">
		<br><br>
		<legend>개인 정보 수정</legend>
		<hr>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th class="pwcheck" colspan="2">비밀번호 재확인</th>
				</tr>
				<tr>
					<td class="pwcheck" colspan="2">고객님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 입력해주세요.</td>
				</tr>
				<tr>
					<td><label for="id">아이디</label></td>
					<td >${memberDto.id}</td>
				</tr>
				<tr>
					<td><label for="pw">비밀번호</label></td>
					<td colspan="1">
						<input type="hidden" value="${memberDto.id}" name="id">
						<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요." required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="확인" name="pwcheck">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>