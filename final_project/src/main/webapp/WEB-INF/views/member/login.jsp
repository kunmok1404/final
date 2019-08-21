<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>


<div align="center">
 	<form action="login" method="post">
 	<br><br><br>
	<legend>로그인</legend>
	<br><hr><br>
 		<table class="table table-bordered">
 			<tbody>
				<tr>
					<td colspan ="3"></td>
				</tr>
				<tr>
					<td><label for="id">아이디</label></td>
					<td>
						<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요.">
					</td>
					<td>
				</tr>
				<tr>
					<td colspan ="2"></td>
				</tr>
				<tr>
					<td colspan ="2"></td>
				</tr>
 			</tbody>
 		</table>
 	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>