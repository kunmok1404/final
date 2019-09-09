<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<style>
	
	.login_fail{
		width: 400px;
		margin: auto;
		text-align: center;
	}
	
</style>

<div class="login_fail">
	<form action="login_fail">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td>
						로그인 정보가 일치하지 않습니다.
					</td>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/member/login" class="btn btn-primary">로그인</a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}" class="btn btn-primary">홈으로</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>