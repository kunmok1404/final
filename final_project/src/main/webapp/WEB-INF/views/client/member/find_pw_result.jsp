<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<style>

	.find_pw_result{
		width: 800px;
		margin: auto;
	}
	
	.legend{
		text-align: center;
	}
	
	.find_pw_result_textbox{
		text-align: center;
		background-color: lightgray;
	}

</style>

<!-- 비밀번호 찾기 결과 -->
<div class="find_pw_result">
	<form action="find_pw_result" method="post">
		<br><br>
		<legend class="legend">비밀번호 찾기</legend>
		<hr><br>
		<div class="find_pw_result_textbox">
			이메일이 발송되었습니다.
			<br>
			해당 이메일에서 인증해주세요.
		</div>
		<table class="table table-bordered">
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}"><input type="button" value="홈으로" name="main"></a>
				</td>
				<td>
					<a href="login"><input type="button" value="로그인" name="login"></a>
				</td>
			</tr>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>