<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<script>
	
	//비밀번호 정규표현식 검사 후 메세지 출력
	function checkPW(){
		var pw = document.querySelector("#pw").value;
		var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;
	
		//정규표현식으로 pw값 검사
		var result = regex.test(pw);
		var div = document.querySelector(".pwD");
	
		//형식에 맞으면 통과
		if(result){
			div.innerHTML = ""
		}
		//형식에 맞지 않으면 메세지 출력
		else{
			div.innerHTML = "<font color = 'red' size = '2'>8~15자의 영문 대소문자, 숫자, 특수기호(!@#$-_)로 입력헤주세요.</font>"
		}
	}


	//비밀번호 확인값 비밀번호값과 일치한지 검사
	function PWOK(){
		var pw = document.querySelector("#pw").value;
		var pw_check = document.querySelector("#pw_check").value;
		
		var div = document.querySelector(".pw_checkD");
	
		//일치하면 통과
		if($("#pw").val() == $("#pw_check").val()){
			div.innerHTML = ""
		}
		//일치하지 않으면 메세지 출력
		else{
			div.innerHTML = "<font color = 'red' size = '2'>비밀번호가 일치하지 않습니다.</font>"
		}
	}
	
</script>

<style>

	.new_pw{
		width: 800px;
		margin: auto;
	}

</style>

<!-- 비밀번호 재설정 -->
<div>
	<form action="new_pw" method="post">
		<br><br>
		<legend>비밀번호 재설정</legend>
		<hr><br>
		<table class="table table-borderd">
			<tr>
				<td><label for="pw">비밀번호</label></td>
				<td>
					<input onblur="checkPW();" id="pw" type="password" name="pw" placeholder="비밀번호" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
					<div class="pwD"></div>
				</td>
			</tr>
			<tr>
				<td><label for="pw_check">비밀번호 확인</label></td>
				<td>
					<input type="password" id="pw_check" name="pw_check" placeholder="비밀번호 확인" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
					<!-- 비밀번호 일치/불일치 문구표시 -->
					<div class="pw_checkD"></div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="변경하기">
				</td>
			<tr>
		</table>
	</form>
</div>



<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>