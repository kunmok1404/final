<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/password-encoder.js"></script>

<script>

</script>

<div class="container">

	<form action="info_check" method="post">
 	<div class="row">
       <div class="col-md-12">
         <div class="adminLogin-title">개인정보수정</div>
       </div>
     </div><hr class="hr"><br>
     
     <div class="row">
            <div class="offset-4 col-md-4">
                <table class="table table-borderless mt-5 text-center login-table">
                  <tbody>
                    <tr>
                        <td class="text-right"><span class="admin-id font-weight-bold mr-3">아이디</span></td>
                        <td class="idpw-2 text-secondary font-weight-bold" style="font-size:1.5rem">
                        	${memberDto.id}
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right"><span class="admin-id font-weight-bold mr-3">비밀번호</span></td>
                        <td>
                        	<input type="hidden" value="${memberDto.id}" name="id">
							<input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호를 입력해주세요." required>
                        </td>
                    </tr>
                  </tbody>
                </table>
            </div>
          </div>
          
          <div class="text-center mt-3">
   	  		<input type="submit" value="확인" class="btn btn-danger" style="width:300px" name="pwcheck">
   	  	  </div>
          
   	  </form><br><br><br><hr class="hr">
   	  
   	  
   	  
 </div><br><br><br><br><br>



<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>