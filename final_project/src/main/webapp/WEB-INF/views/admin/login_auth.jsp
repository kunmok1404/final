<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    
<style>
	
	.login_auth{
		width: 900px;
		margin: auto;
	}
	
</style>

<div class="login_auth">
	<form action="login_fail">
		<table border="1">
			<tbody>
				<tr>
					<td>
						<img src="${pageContext.request.contextPath}/resources/image/405error.gif">
					</td>
				</tr>
				<tr>
					<td align="center">
						<a href="${pageContext.request.contextPath}" class="btn btn-primary">뭐먹지 화면으로</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
        
<jsp:include page="/WEB-INF/views/template/admin/shop/footer.jsp"></jsp:include>