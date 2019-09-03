<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/sha256-min.js"></script>

<script>
$(function(){
	$("form").submit(function(e){
		e.preventDefault();
		
		console.log(CryptoJS);
		
		//CryptoJS를 이용하여 SHA-256 암호화를 진행(비밀번호에)
		var pw = $("input[name=new_pw]").val();
		if(pw.length != 0){
			var encPw = CryptoJS.SHA256(pw).toString();
			//[1] 비밀번호 입력창 값을 encPw로 교체 : 사용자에게 변경과정 노출
			//$("input[name=pw]").val(encPw);
			
			//[2] hidden 전송태그를 만드러 기존의 pw를 제거하고 변경 후 전송
// 			$("input[name=new_pw]").attr("name", "");
			var newInput = $("<input/>").attr("type", "hidden")
										.attr("name", "pw").val(encPw);
			$(this).append(newInput);
		}
		this.submit();
		
	});
});
</script>
<script>
	$(function(){
		//pw 입력창에 blur 이벤트가 발생하면 ajax통신으로 checkPW(정규표현식 검사)실행
		$("input[name=pw]").blur(function(){
// 			alert("비밀번호");
			checkPW();
		});
		
		//pw_check 입력창에 blur 이벤트가 발생하면 ajax통신으로 PWOK(비빌번호 확인)실행
		$("input[name=pw_check]").blur(function(){
// 			alert("비밀번호확인");
			PWOK();
		});
		
		//phone 입력창에 blur 이벤트가 발생하면 ajax통신으로 checkPHONE(정규표현식 검사)실행
		$("input[name=phone]").blur(function(){
// 			alert("전화번호");
			checkPHONE();
		});
		
// 		//email주소 옵션 선택시 입력창에 선택값 표시
// 		$("#email_address_option").change(function(){
// 			$("#email_address").val($(this).val())
// 			//선택 옵션에서 직접 입력을 선택시 입력창 활성화 후 직접 입력
// 			if(!$(this).val()){
// 				$(this).prev().prop("readonly", false);
// 			}
// 			//선택 옵션에서 직접입력 이외 선택시 입력창에 선택값 표시 후 입력창 비활성화(수정 불가능하게)
// 			else{
// 				$(this).prev().prop("readonly", true);
// 			}
// 		});
	});

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
	
	
	//전화번호 정규표현식 검사
	function checkPHONE(){
		var phone = document.querySelector("#phone").value;
		var regex = /^01[016-9][0-9]{7,8}$/;
		
		//정규표현식으로 phone값 검사
		var result = regex.test(phone);
		var div = document.querySelector(".phoneD");
		
		//형식에 맞으면 통과
		if(result){
			div.innerHTML = ""
		}
		//형식에 맞지 않으면 메세지 출력
		else{
			div.innerHTML = "<font color = 'red' size = '2'>'-'없이 숫자만 입력해주세요.</font>"
		}
	}
	
	//주소 입력 기능
	//주소 찾기 버튼을 누르면 팝업창(?)이 뜬다.
	$(function(){
		$("input[name=post_find]").click(findADDRESS);
	});
	
	//팝업창에서의 작업
	function findADDRESS(){
		new daum.Postcode({
			oncomplete: function(data){
				//팝업에서 검색결과 항목을 클릭했을 때, 실행할 코드를 작성하는 부분
				//각 주소의 노출 규칙에 따라 주소를 조합한다.
				//내려오는 변수가 값이 없는 경우에는 공백('')을 값으로 가진다.
				//이를 참고하여 프로그램의 실행순서를 변경하여 다른 명령을 실행할수 있게 한다.
				var addr = ''; //주소변수
				var extraAddr = ''; //참고항목 변수
				
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if(data.userSelectedType === 'R'){ //사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				}
				else{ //사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				
				//사용자가 선택한 주소가 도로명 주소일 때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
					//법정동명이 있을 경우 추가한다. (법정리는 제외)
					//법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					//건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					//표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
					//조합된 참고항목을 해다 필드에 넣는다.
				}
				//우편번호와 주소 정보를 해당 필드에 넣는다.
				// document.querySelector('input[name=postcode]').value = data.zonecode;
                // document.querySelector("input[name=basicaddr]").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                // document.querySelector("input[name=detailaddr]").focus();

                // 이 코드는 jquery.js 를 먼저 불러온 경우만 사용 가능
                $("input[name=post]").val(data.zonecode);
                $("input[name=basic_addr]").val(addr);
                $("input[name=detail_addr]").focus();
			}
		}).open();
	}

</script>

<style>
	
	.info_change{
		width: 800px;
		margin: auto;
		min-height: 500;
	}
	
	.legend{
		text-align: center;
	}
	
</style>


<div class="info_change">
	<form action="info_change" method="post">
		<br><br>
		<legend class="legend">개인 정보 수정</legend>
		<hr>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td>아이디</td>
					<td>
						${memberDto.id}
						<input type="hidden" name="no" value="${memberDto.no}">
					</td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td>
						<input type="password" value="" onblur="checkPW();" id="pw" name="new_pw" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$">
						<div class="pwD"></div>
					</td>
				</tr>
				<tr>
					<td>새 비밀번호 확인</td>
					<td>
						<input type="password" value="" id="pw_check" name="pw_check" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$">
						<div class="pw_checkD"></div>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email" value="${memberDto.email}" pattern="^[a-zA-Z0-9!@#$\-_.]{18,23}$" required>
<!-- 						<span>@</span> -->
<%-- 						<input type="text" name="email_address" id="email_address" value="${memberDto.email_address}" pattern="^.*?\..*?$" requried> --%>
<!-- 						<select id="email_address_option"> -->
<!-- 							<option>--이메일 선택--</option> -->
<!-- 							<option value="">직접입력</option> -->
<!-- 							<option>naver.com</option> -->
<!-- 							<option>gmail.com</option> -->
<!-- 							<option>daum.net</option> -->
<!-- 							<option>nate.com</option> -->
<!-- 							<option>yahoo.com</option> -->
<!-- 						</select> -->
						<div class="emailD"></div>
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<input type="tel" name="phone" value="${memberDto.phone}" pattern="^01[016-9][0-9]{7,8}$" required>
						<div class="phoneD"></div>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="post" value="${memberDto.post}" required readonly>
						<input type="button" name="post_find" value="주소 찾기"><br>
						<input type="text" name="basic_addr" value="${memberDto.basic_addr}" required readonly><br>
						<input type="text" name="detail_addr" value="${memberDto.detail_addr}" required>	
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="정보수정" name="change_info_btn">
						<a href="delete"><input type="button" value="회원탈퇴"></a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>