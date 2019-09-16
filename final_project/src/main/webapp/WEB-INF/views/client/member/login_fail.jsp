<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<style>
	
	.login_fail{
		width: 1500px;
		margin: auto;
		text-align: center;
	}
	.login_fail img{
		width: 1500px;
	}
	
</style>

<div class="login_fail">
	<form action="login_fail">
		<table class="table table-borderless">
			<tbody>
				<tr>
					<td>
						<img src="${pageContext.request.contextPath}/resources/image/login_fail.png">
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<a href="${pageContext.request.contextPath}/member/login" class="btn btn-lg btn-info">로그인</a>
						<a href="${pageContext.request.contextPath}" class="btn btn-lg btn-secondary">홈으로</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>