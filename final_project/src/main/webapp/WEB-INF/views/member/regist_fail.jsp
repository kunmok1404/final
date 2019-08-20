<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>

<div align="center">
 	<form action="regist_fail" method="post">
 		<table class="table table-bordered">
 			<tbody>
 				<tr>
					<td colspan ="2"></td>
				</tr>
				<tr>
					<td colspan ="2"></td>
				</tr>
 				<tr>
 					<td>
 						<a>회원가입에 실패하였습니다.</a>
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<a>다시 시도해주십시오.</a>
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<a href = "regist"><input type="button" value="회원가입" name="login"></a>
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<a href = "${pageContext.request.contextPath}"><input type="button" value="메인으로" name="main"></a>
 					</td>
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