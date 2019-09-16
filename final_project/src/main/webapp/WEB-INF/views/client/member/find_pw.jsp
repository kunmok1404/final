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

<!-- error 파라미터 유무에 따라 오류메시지를 출력 -->
<c:if test="${not empty param.error}">
	<h4>
		<font color="red">
			입력하신 정보와 일치하는 회원이 존재하지 않습니다.
		</font>
	</h4>
</c:if>

<div class="container">

 	<form action="find_pw" method="post">
 	<div class="row">
       <div class="col-md-12">
         <div class="adminLogin-title">비밀번호 찾기</div>
       </div>
     </div><hr class="hr"><br>
     
     <div class="row">
            <div class="offset-1 col-md-10">
                <table class="table table-borderless mt-5 text-center login-table">
                  <tbody>
                  	<tr>
               			<td width="10%" class="text-right"><span class="admin-id font-weight-bold mr-3">아이디</span></td>
                  		<td class="idpw-2">
							<input type="text" name="id" class="form-control" placeholder="아이디를 입력해주세요." required>
						</td>
						<td colspan="3"></td>
                  	</tr>
                    <tr>
                        <td width="10%" class="text-right"><span class="admin-id font-weight-bold mr-3">이메일</span></td>
                        <td class="idpw-2">
                            <input type="text" name="email" class="form-control" placeholder="이메일" pattern="^[a-zA-Z0-9!@#$\-_.]{6,15}$" required>
                        </td>
                        <td width="5%">@</td>
                        <td class="idpw">
                        	<input type="text" name="email_address" id="email_address" class="form-control" pattern="^.*?\..*?$" required>
                        </td>
                        <td class="idpw">
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
                  </tbody>
                </table>
                
                <div class="text-center mt-5">
                	<input type="submit" value="비밀번호 찾기" class="btn btn-secondary text-white">
                </div>
                
            </div>
          </div>
   	  </form><br><br><hr class="hr">
   	  
   	  <div class="text-center mt-5">
   	  		<a href="${pageContext.request.contextPath}/member/find_id" class="btn btn-info ml-3">아이디 찾기</a>
   	  		<a href="${pageContext.request.contextPath}" class="btn btn-info ml-3">홈으로</a>
   	  </div>
   	  
 </div><br><br><br><br><br>


<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>