<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_member.jsp"></jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script>

	$(function(){
		
		//phone 입력창에 blur 이벤트 발생 시 ajax통신으로 checkPHONE(정규표현식 검사) 실행
		$("input[name=phone]").blur(function(){
			checkPHONE();
		});
		
		//email 주소 옵션 선택 시 입력창에 선택값 표시
		$("#email_address_option").change(function(){
			$("#email_address").val($(this).val())
			//선택 옵션에서 직접 입력을 선택 시 입력창 활성화 후 직접 입력
			if(!$(this).val()){
				$(this).prev().prop("readonly", false);
			}
			//선택 옵션에서 직접입력 이외 선택 시 입력창에 선택값 표시 후 입력창 비활성화(수정 불가)
			else{
				$(this).prev().prop("readonly", true);
			}
		});
	});
	
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


<div class="wrapper mt-3">
	<div class="top-title">
		<div id="terms-wrapper">
			<div class="terms-line"></div>
		</div>
		<span>회원 정보 수정</span>
	</div>
	
	<!-- 회원 정보 상세 수정 -->
	<div>
		<form action="edit" method="post">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="table-active">아이디</td>
						<td>
							${membervo.id}
							<input type="hidden" name="no" value="${membervo.no}">
						</td>
						<td class="table-active">이메일</td>
						<td>
                        	<input type="text" name="email" value="${membervo.email}" pattern="^[a-zA-Z0-9!@#$\-_.]{8,16}$" required>
                        	<span>@</span>
                        	<input type="text" name="email_address" value="${membervo.email_address}" pattern="^.*?\..*?$" id="email_address" requried>
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
						<td class="table-active">전화번호</td>
						<td>
							<input type="tel" name="phone" value="${membervo.phone}" pattern="01[016-9][0-9]{7,8}$" required>
                        	<div class="phoneD"></div>
						</td>
						<td class="table-active">주소</td>
						<td>
                        	<input type="text" name="post" value="${membervo.post}" required readonly>
							<input type="button" name="post_find" value="주소 찾기"><br>
							<input type="text" name="basic_addr" value="${membervo.basic_addr}" required readonly><br>
							<input type="text" name="detail_addr" value="${membervo.detail_addr}" required>	
                    	</td>
					</tr>
					<tr>
						<td class="table-active">회원등급</td>
						<td>
<%-- 							${membervo.grade} --%>
                        	<select>
                            	<option>일반</option>
                            	<option>골드</option>
                            	<option>VIP</option>
                        	</select>
                    	</td>
						<td class="table-active">회원상태</td>
						<td>
<%-- 							${membervo.status} --%>
							<select>
                            	<option>일반</option>
                            	<option>블랙</option>
                            	<option>휴면</option>
                        	</select>
                        	<input type="text" name="reason" placeholder="사유를 입력하세요">
						</td>
					</tr>
					<tr>
						<td class="table-active">쿠폰</td>
						<td>
							${membervo.coupon}장
							<a>모달상자</a>
						</td>
						<td class="table-active">포인트</td>
						<td>
							${membervo.point}pt
							<a>모달상자</a>
						</td>
					</tr>
					<tr>
						<td class="table-active">총 구매 금액</td>
						<td colspan="3">1000000원</td>
					</tr>
					<tr>
						<td class="table-active">1:1문의</td>
						<td>${membervo.ono}건</td>
						<td class="table-active">리뷰</td>
						<td>${membervo.review}건</td>
					</tr>
					<tr>
						<td class="table-active">가입일</td>
						<td>${membervo.regist_date}</td>
						<td class="table-active">최종접속일</td>
						<td>${membervo.latest_login}</td>
					</tr>
				</tbody>
			</table>
			<div class="text-center">
				<input type="submit" value="저장">
			</div>
		</form>
	</div>
</div>