<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<%-- <jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include> --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>



<div class="container">
	 <br><br><br><br>
     <hr class="hr"><br>
     
     <div class="row">
            <div class="offset-2 col-md-8">
                <table class="table table-borderless mt-5 text-center login-table">
                  <tbody>
                    <tr>
                        <td class="idpw-2 text-secondary font-weight-bold" style="font-size:2rem">
                        	입력하신 정보가 일치하지 않습니다.
                        </td>
                    </tr>
                  </tbody>
                </table>
            </div>
          </div>
          
   	  <br><br><br><hr class="hr">
   	  
   	  <div class="text-center mt-5">
   	  		<a href="${pageContext.request.contextPath}/member/info_check" class="btn btn-info ml-3">다시 시도</a>
   	  		<a href="${pageContext.request.contextPath}" class="btn btn-secondary ml-3">홈으로</a>
   	  </div>
   	  
   	  
 </div><br><br><br><br><br>





<div class="info_check_fail">
	<form action="info_check_fail">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td>
						입력하신 정보가 일치하지 않습니다.
					</td>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/member/info_check" class="btn btn-primary">다시 시도</a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}" class="btn btn-primary">홈으로</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>


<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>