<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>

<script>
		
		//로그인 실패 시 alert으로 메세지 노출
// 		$(function(){
// 			if($(".fail").text()=='faillogin'){
// 				alert("로그인에 실패했습니다.")
// 			}							
// 		});
		
</script>

<style>

	.login{
		width: 400px;
		margin: auto;
	}

</style>

<%-- <c:if test="${fail==fail}"> --%>
<!-- 	<div class="fail" style="display: none;">faillogin</div> -->
<%-- </c:if> --%>

<!-- error 파라미터 유무에 따라 오류메시지를 출력 -->
<c:if test="${not empty param.error}">
	<h4>
		<font color="red">
			입력하신 정보에 해당하는 회원이 존재하지 않습니다.
		</font>
	</h4>
</c:if>

<div class="login">
 	<form action="login" method="post">
 	<br>
	<legend>로그인</legend>
	<hr>
 		<table class="table table-bordered">
 			<tbody>
				<tr>
					<td colspan ="4"></td>
				</tr>
				<!-- 아이디, 로그인 버튼 -->
				<tr>
					<td><label for="id">아이디</label></td>
					<td >
						<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." value="${cookie.saveID.value}" required>
					</td>
					<td colspan="2" rowspan="2">
						<input type="submit" name="login" value="로그인">
					</td>
				</tr>
				<!-- 비밀번호 -->
				<tr>
					<td><label for="pw">비밀번호</label></td>
					<td colspan="1">
						<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요." required>
					</td>
				</tr>
				<!-- 아이디 저장 checkbox -->
				<tr align="center">
					<td colspan="4">
						<input type="checkbox" name="remember" ${not empty cookie.saveID?"checked":""}>
						<label for="saveID">아이디 저장하기</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="find_id"><input type="button" value="아이디 찾기" name="findID"></a>
					</td>
					<td colspan="2">
						<a href="find_pw"><input type="button" value="비밀번호 찾기" name="findPW"></a>
					</td>
				</tr>
				<tr>	
					<td colspan="2">	
						<a href="regist"><input type="button" value="회원가입" name="regist"></a>
					</td>
					<td colspan="2">	
						<a href="${pageContext.request.contextPath}"><input type="button" value="홈으로" name="main"></a>
					</td>
				</tr>
 			</tbody>
 		</table>
 	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>