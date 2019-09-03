<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<script>

	$(function(){
		//email주소 옵션 선택시 입력창에 선택값 표시
		$("#email_address_option").change(function(){
			$("#email_address").val($(this).val())
			//선택 옵션에서 직접 입력을 선택시 입력창 활성화 후 직접 입력
			if(!$(this).val()){
				$(this).prev().prop("readonly", false);
			}
			//선택 옵션에서 직접입력 이외 선택시 입력창에 선택값 표시 후 입력창 비활성화(수정 불가능하게)
			else{
				$(this).prev().prop("readonly", true);
			}
		});
	});

</script>

<style>

	.find_pw{
		width: 800px;
		margin: auto;
	}

	.legend{
		text-align: center;
	}
</style>

<!-- error 파라미터 유무에 따라 오류메시지를 출력 -->
<c:if test="${not empty param.error}">
	<h4>
		<font color="red">
			입력하신 정보와 일치하는 회원이 존재하지 않습니다.
		</font>
	</h4>
</c:if>

<!-- 비밀번호 찾기 -->
<div class="find_pw">
	<form action="find_pw" method="post">
		<br><br>
		<legend class="legend">비밀번호 찾기</legend>
		<hr><br>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td><label>아이디</label></td>
					<td>
						<input type="text" name="id" placeholder="아이디를 입력해주세요." required>
					</td>
				</tr>
				<tr>
					<td><label>이메일</label></td>
					<td>
						<input type="text" name="email" placeholder="이메일" pattern="^[a-zA-Z0-9!@#$\-_.]{8,16}$" required>
						<span>@</span>
						<input type="text" name="email_address" id="email_address" pattern="^.*?\..*?$" requried>
						<select id="email_address_option">
							<option>--이메일 선택--</option>
							<option value="">직접입력</option>
							<option>naver.com</option>
							<option>gmail.com</option>
							<option>daum.net</option>
							<option>nate.com</option>
							<option>yahoo.com</option>
						</select>
						<div class="emailD"></div>
					</td>
					<td rowpan="2" align="center">
						<input type="submit" value="확인">
					</td>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}"><input type="button" value="홈으로" name="main"></a>
					</td>
					<td>
						<a href="find_id"><input type="button" value="아이디 찾기" name="find_id"></a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>