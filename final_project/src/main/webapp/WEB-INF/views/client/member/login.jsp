<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/password-encoder.js"></script>

<script>

$(function(){
   // 로그인 버튼 클릭시
   $(".login-btn").click(function(){
      $(".login_form").submit();
   })
})

</script>

<div class="container">

 	<form action="login" method="post" class="login_form">
 	<div class="row">
       <div class="col-md-12">
         <div class="adminLogin-title">로그인</div>
       </div>
     </div>
     
     <div class="row">
            <div class="offset-3 col-md-6">
                <table class="table table-borderless mt-5 text-center login-table">
                  <tbody>
                    <tr>
                        <td width="20%" class="text-right"><span class="admin-id font-weight-bold">아이디</span></td>
                        <td class="idpw">
                          <input type="text" name="id" class="form-control ml-3" placeholder="아이디를 입력해주세요."> 
                        </td>
                        <td rowspan="2" class="login-btn font-weight-bold login-btn ml-3">로그인</td>
                    </tr>
                    <tr>
                        <td class="text-right"><span class="admin-id font-weight-bold">비밀번호</span></td>
                        <td class="idpw">
                          <input type="password" name="pw" class="form-control ml-3" placeholder="비밀번호를 입력해주세요."> 
                        </td>
                    </tr>
                    <!-- 아이디 저장 checkbox -->
					<tr>
						<td colspan="4" class="text-left">
							<input type="checkbox" name="remember" ${not empty cookie.saveID?"checked":""}>
							<span class="save-id text-secondary">아이디 저장하기</span>
							<input type="submit">로그인
						</td>
					</tr>
                  </tbody>
                </table>
            </div>
          </div>
   	  </form>
   	  
   	  <div class="text-center">
   	  		<a href="${pageContext.request.contextPath}/member/find_id" class="btn btn-info ml-5">아이디 찾기</a>
   	  		<a href="${pageContext.request.contextPath}/member/find_pw" class="btn btn-info ml-3">비밀번호 찾기</a>
   	  		<a href="${pageContext.request.contextPath}/member/regist" class="btn btn-info ml-3">회원가입</a>
   	  		<a href="${pageContext.request.contextPath}" class="btn btn-info ml-3">홈으로</a>
   	  </div>
   	  
 </div><br><br><br><br><br>
     

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>