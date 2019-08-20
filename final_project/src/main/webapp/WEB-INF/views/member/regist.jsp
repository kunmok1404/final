<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>

<script>
	$(function(){
		//id 입력창에 click 이벤트가 발생하면 ajax 통신으로 중복검사 수행
		//요청 url : /member/id_check.do
		$("input[name=id_check_btn]").click(function(){
			$.ajax({
				url:"id_ckeck.do",
				data:{id:$("input[name=id]").val()},
				dataType:"text",
				success:function(resp){
					if(resp=="N"){
						window.alert("이미 사용중인 아이디입니다.");
						$("input[name=id]").select();
					}
					else{
						window.alert("사용 가능한 아이디입니다.");
						//중복검사 후 사용가능한 아이디면 가입버튼 활성화
						//$("input[name=registbtn]").prop("disabled", false)
					}
				}
			});
		});
		
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
	
	//아이디 정규표현식 검사
	function checkID(){
		
	}	
		
	//비밀번호 정규표현식 검사
	
	//비밀번호 확인
	
	//이메일 정규표현식 검사
	
	//전화번호 정규표현식 검사
	
	//주소 입력
	
	
</script>


<div align="center">
	<form action="regist" method="post" class="a">
		<br><br><br>
		<legend>회원가입</legend>
		<br><hr><br>
		<table class="b">
			<tbody>
				<tr>
					<td><label for="name">이름</label></td>
					<td>
						<input type="text" name="name" placeholder="이름" pattern="^[가-힣]{2,7}$" required>
						<div class="nameD"></div>
					</td>
				</tr>
				<tr>
					<td><label for="id">아이디</label></td>
					<td>
						<input type="text" name="id" placeholder="아이디" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
						<input type="button" name="id_check_btn" value="중복확인">
						<div class="idD"></div>
					</td>
				</tr>
				<tr>
					<td><label for="pw">비밀번호</label></td>
					<td>
						<input type="password" name="pw" placeholder="비밀번호" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
						<div class="pwD"></div>
					</td>
				</tr>
				<tr>
					<td><label for="pw_check">비밀번호 확인</label></td>
					<td>
						<input type="password" name="pw_check" placeholder="비밀번호 확인" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
						<!-- 비밀번호 일치/불일치 문구표시 -->
						<div class="pw_checkD"></div>
					</td>
				</tr>
				<tr>
					<td><label for="email">이메일</label></td>
					<td>
						<input type="text" name="email" placeholder="이메일" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
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
				</tr>
				<tr>
					<td><label for="phone">휴대폰</label></td>
					<td>
						<input type="tel" name="phone" placeholder="전화번호('-'없이 입력해주세요.)" pattern="^01[016-9]-[0-9]{3,4}-[0-9]{4}$" required>
						<div class="phoneD"></div>
					</td>
				</tr>
				<tr>
					<td><label for="address">주소</label></td>
					<td>
						<input type="text" name="post" placeholder="우편번호" required readonly>
						<input type="button" name="post_find" value="우편번호 찾기"><br>
						<input type="text" name="basic_addr" placeholder="기본주소" required readonly><br>
						<input type="text" name="detail_addr" placeholder="상세주소">								
						<div class="addressD"></div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<form>
		<br>
		<legend>약관동의</legend>
		<hr><br>
		<table>
			<tbody>
				<tr>
					<td>
						<input type="checkbox">전체 동의<br>
						<input type="checkbox">이용약관(필수)<br>
						<input type="checkbox">개인정보방침(필수)<br>
						<input type="checkbox">본인은 만 14세 이상입니다.(필수)<br>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<input type="submit" name="registbtn" value="가입하기">
						<br><br>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>