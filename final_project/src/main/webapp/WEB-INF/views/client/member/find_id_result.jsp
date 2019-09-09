<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<style>

	.find_id_result{
		width: 800px;
		margin: auto;
	}
	
	.legend{
		text-align: center;
	}
	
	.find_id_result_textbox{
		text-align: center;
		background-color: lightgray;
	}

</style>

<!-- 아이디 찾기 결과 -->
<div class="find_id_result">
	<form action="find_id_result" method="post">
		<br><br>
		<legend class="legend">아이디 찾기</legend>
		<hr><br>
		<div class="find_id_result_textbox">
			이메일이 발송되었습니다.
			[${id}]입니다.
			<br>
			해당 이메일에서 아이디를 확인해주세요.
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