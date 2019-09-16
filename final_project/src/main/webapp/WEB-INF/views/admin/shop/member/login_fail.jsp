<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
    
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
						<a href="${pageContext.request.contextPath}/shop_admin/member/login" class="btn btn-lg btn-info">로그인</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
        
<jsp:include page="/WEB-INF/views/template/admin/shop/footer.jsp"></jsp:include>