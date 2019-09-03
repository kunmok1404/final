<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<style>
	
	.delete{
		width: 800px;
		margin: auto;
	}
	
	.delete table{
		text-align: center;
		width: 80%;
		margin-left: 10%;
	}
	
</style>

<!-- 회원 탈퇴 -->
<div class="delete">
	<form action="delete" method="psot">
		<br><br>
		<hr><br>
		<table>
			<tr>
				<th>
					지금까지 뭐먹지 사이트를 이용해 주셔서 감사합니다.
				</th>
			</tr>
			<tr>
				<td>
					다음에 다시 찾아주시길 바랍니다.
				</td>
			</tr>
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}"><input type="button" value="홈으로" name="main"></a>
				</td>
			</tr>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>