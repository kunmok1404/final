<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/password-encoder.js"></script>


<script>
	
	//가입버튼 비활성화
	$(function(){
		$("input[name=registbtn]").prop("disabled", true);
// 		$("input[name=id_check_btn]").prop("disabled",false);
	});
	
	$(function(){
		//id 입력창에 click 이벤트가 발생하면 ajax 통신으로 중복검사 수행
		//요청 url : /member/id_check.do
		$("input[name=id_check_btn]").click(function(){
			$.ajax({
				url:"id_check",
				data:{id:$("input[name=id]").val()},
				dataType:"text",
				success:function(resp){
					if(resp=="N"){
						window.alert("이미 사용중인 아이디입니다.");
						$("input[name=id]").select();
					}
					else{
						window.alert("사용 가능한 아이디입니다.");
						//alert에서 확인버튼을 누르면 가입버튼을 활성화한다.
						//중복검사 후 사용가능한 아이디면 가입버튼 활성화
						$("input[name=registbtn]").prop('disabled', false);
					}
				}
			});
		});
		
		//pw 입력창에 blur 이벤트가 발생하면 ajax통신으로 checkPW(정규표현식 검사)실행
		$("input[name=pw]").blur(function(){
			checkPW();
		});
		
		//pw_check 입력창에 blur 이벤트가 발생하면 ajax통신으로 PWOK(비빌번호 확인)실행
		$("input[name=pw_check]").blur(function(){
			PWOK();
		});
		
		//phone 입력창에 blur 이벤트가 발생하면 ajax통신으로 checkPHONE(정규표현식 검사)실행
		$("input[name=phone]").blur(function(){
// 			alert("전화번호");
			checkPHONE();
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
		
	//아이디 정규표현식 검사 후 메세지 출력
	function checkID(){
		var id = document.querySelector("#id").value;
		var regex = /^[a-zA-Z0-9!@#$\-_]{6,15}$/;
		
		//정규표현식을 id값 검사
		var result = regex.test(id);
		var div = document.querySelector(".idD");
		
		//형식에 맞으면 중복확인 버튼 활성화
		if(result){
			div.innerHTML = ""
			$("input[name=id_ckeck_btn]").prop("disabled", false)
		}
		//형식에 맞지 않으면 메세지 출력 후, 중복확인 버튼 비활성화
		else{
			div.innerHTML = "<font color = 'red' size = '2'>6~15자의 영문/숫자로 입력헤주세요.</font>"
		}
	}
	
	
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
	
	//약관동의 체크박스 전체동의 누르면 전체 선택하기
	function checkAll(){
		if($("#th_AllCheck").is(':checked')){
			$("input[name=checkRow]").prop("checked", true);
		}
		else{
			$("input[name=checkRow]").prop("checked", false);
		}
	}
	
</script>

<div class="container">
	<form action="regist" method="post">
 	<div class="row">
       <div class="col-md-12">
         <div class="adminLogin-title">회원가입</div>
       </div>
     </div><hr class="hr"><br>

	<div class="row">
	   	  <div class="offset-2 col-md-8">
	   	  	<div class="top-title">
				<div id="terms-wrapper">
		          <div class="terms-line"></div>
		        </div>
			    <span class="terms-agree-title">회원정보 입력</span>
	        </div>
	   	  </div>
   	  </div>

	<div class="row">
            <div class="offset-1 col-md-10">
                <table class="table table-borderless mt-3 text-center login-table">
                  <tbody>
                  	<tr>
               			<td width="20%" class="text-right"><span class="login-text font-weight-bold mr-3">아이디</span></td>
                  		<td>
                  			<input onblur="checkID();" class="form-control" id="id" type="text" name="id" placeholder="아이디" pattern="^[a-zA-Z0-9!@#$\-_]{6,15}$" required>
							<div class="idD"></div>
						</td>
						<td>
							<!-- 아이디 중복검사 후 메세지 출력, 중복확인 버튼 활성화/비활성화 -->
							<input type="button" name="id_check_btn" class="btn btn-secondary ml-3" value="중복확인">
						</td>
                  	</tr>
                  	<tr>
						<td width="20%" class="text-right"><span class="login-text font-weight-bold mr-3">비밀번호</span></td>
						<td>
							<input onblur="checkPW();" class="form-control" id="pw" type="password" name="pw" placeholder="비밀번호" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
							<div class="pwD"></div>
						</td>
					</tr>
					<tr>
						<td class="text-right"><span class="login-text font-weight-bold mr-3">비밀번호확인</span></td>
						<td>
							<input type="password" class="form-control" id="pw_check" name="pw_check" placeholder="비밀번호 확인" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
							<!-- 비밀번호 일치/불일치 문구표시 -->
							<div class="pw_checkD"></div>
						</td>
					</tr>
                    <tr>
                        <td width="10%" class="text-right"><span class="login-text font-weight-bold mr-3">이메일</span></td>
                        <td>
                            <input type="text" name="email" class="form-control" placeholder="이메일" pattern="^[a-zA-Z0-9!@#$\-_.]{6,15}$" required>
                        </td>
                        <td width="3%">@</td>
                        <td>
                        	<input type="text" name="email_address" id="email_address" class="form-control" pattern="^.*?\..*?$" required>
                        </td>
                        <td>
                        	<select id="email_address_option" class="form-control">
								<option>--이메일 선택--</option>
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
						<td class="text-right"><span class="login-text font-weight-bold mr-3">휴대폰</span></td>
						<td>
							<input onblur="checkPHONE();" class="form-control" id="phone" type="tel" name="phone" placeholder="'-'없이 숫자만 입력해주세요." pattern="^01[016-9][0-9]{7,8}$" required>
							<div class="phoneD"></div>
						</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-right"><span class="login-text font-weight-bold mr-3">주소</span></td>
						<td>
							<input type="text" name="post"  class="addr-input form-control" placeholder="우편번호" required readonly>
						</td>
						<td><input type="button" name="post_find" value="주소 찾기"></td>
					</tr>
					<tr>
						<td>		
							<input type="text" name="basic_addr" class="form-control" placeholder="기본주소" required readonly>
							<input type="text" name="detail_addr" class="form-control" placeholder="상세주소" required>	
						</td>
					</tr>
                  </tbody>
                </table>
                
            </div>
          </div>
   	 <br><hr><br>
   	  
   	  <div class="row">
	   	  <div class="offset-2 col-md-8">
	   	  	<div class="top-title">
				<div id="terms-wrapper">
		          <div class="terms-line"></div>
		        </div>
			    <span class="terms-agree-title">약관동의</span>
	        </div>
	   	  </div>
   	  </div><br>
   	  
   	  <div class="row">
   	  	<div class="offset-2 col-md-8">
   	  		<table class="table table-borderless terms-agree">
   	  			<tbody>
   	  				<tr>
   	  					<th>
							<input type="checkbox" id="th_AllCheck" onclick="checkAll();">전체 동의<br>
						</th>
   	  				</tr>
   	  				<tr>
						<td>
							<input type="checkbox" name="checkRow" value="${content.IDX}" required>이용약관(필수)<a data-toggle="modal" data-target="#myModal" class="text-primary">&emsp;약관보기</a><br>
							<input type="checkbox" name="checkRow" value="${content.IDX}" required>개인정보방침(필수)	<a data-toggle="modal" data-target="#myModal" class="text-primary">&emsp;약관보기</a><br>
							<input type="checkbox" name="checkRow" value="${content.IDX}" required>본인은 만 14세 이상입니다.(필수)<br>
						</td>
					</tr>
   	  			</tbody>
   	  		</table>
   	  	</div>
   	  </div>
   	  
   	  <br><hr class="hr">
   	  
   	  <div class="text-center mt-5">
   	  		<input type="submit" class="btn btn-primary regist-btn" value="가입하기">
   	  </div>
   	  
	   </form>
</div><br><br><br><br>

<!-- 모달 -->
<!-- The Modal -->
<div class="modal" id="myModal">
	<div class="modal-dialog terms-modal-wrap">
		<div class="modal-content terms-modal">
		
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">약관</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>	
			
			<!-- Modal body -->
			<div class="modal-body">	        
				<ul class="nav nav-tabs">
					<li class="nav-item terms-nav">
						<a class="nav-link active" data-toggle="tab" href="#qwe">이용약관</a>
					</li>
					<li class="nav-item terms-nav">
						<a class="nav-link" data-toggle="tab" href="#asd">개인정보처리방침</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="qwe">
						<p>${terms1.content}</p>
					</div>
					<div class="tab-pane fade" id="asd">
						<p>${terms2.content}</p>
					</div>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>