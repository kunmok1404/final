<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<style>

	.new_pw_result{
		width: 800px;
		margin: auto;
	}
	
	.legend{
		text-align: center;
	}
	
	.new_pw_result_textbox{
		text-align: center;
		background-color: lightgray;
	}

</style>

<!-- 비밀번호 재설정 결과 -->
<div>
	<form action="new_pw_result" method="post">
		<br><br>
		<legend class="legend">비밀번호 변경완료</legend>
		<hr><br>
		<div class="new_pw_result_textbox">
			비밀번호 변경이 완료되었습니다.
			<br>
			변경된 비밀번호로 로그인하실 수 있습니다.
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