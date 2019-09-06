<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_promotion.jsp"></jsp:include>

	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>포인트 상세목록</span>
      </div>
      
      <!-- 회원정보 -->
      <table class="table table-borderless mt-3">
      	<tbody>
      		<tr>
      			<td class="table-secondary text-center" width="10%"><span>아이디</span></td>
      			<td class="text-left" width="20%"><span class="text-left pl-2">${memberDto.id}</span></td>
      			<td class="table-secondary text-center" width="10%"><span>이메일</span></td>
      			<td width="50%"><span class="pl-2">${memberDto.email}</span></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center" width="10%"><span>전화번호</span></td>
      			<td class="text-left" width="20%"><span class="text-left pl-2">${memberDto.phone}</span></td>
      			<td class="table-secondary text-center" width="10%"><span>주소</span></td>
      			<td width="50%"><span class="pl-2"></span>${memberDto.basic_addr}${memberDto.detail_addr}</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center" width="10%"><span>회원등급</span></td>
      			<td class="text-left" width="20%"><span class="text-left pl-2">${memberDto.grade}</span></td>
      			<td class="table-secondary text-center" width="10%"><span>상태</span></td>
      			<td width="50%"><span class="pl-2"></span>${memberDto.status}</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center" width="10%"><span>등록일</span></td>
      			<td class="text-left" width="20%"><span class="text-left pl-2">${memberDto.regist_date}</span></td>
      			<td class="table-secondary text-center" width="10%"><span>최종접속일</span></td>
      			<td width="50%"><span class="pl-2"></span>${memberDto.latest_login}</td>
      		</tr>
      	</tbody>
      </table>
      
      <!-- 포인트 현황 -->
      <div class="point-detail">
      <div class="row">
      	<div class="offset-2 col-md-3 text-primary">
      		총 적립 포인트 : +${pointVO.total_point}
      	</div>
      	<div class="col-md-3 text-danger">
      		총 사용 포인트 :  -${pointVO.use_point}
      	</div>
      	<div class="col-md-3">
      		현재 포인트 : ${pointVO.present_point}
      	</div>
      </div>
      </div>
      
	  <!-- 포인트 상세목록 시작 -->
	  <div class="list-wrapper table-responsive mt-3">
	  <div class="search-number">
	  	<p>총 0건</p>
	  </div>
	  	<table class="table table-hamburg table-hover">
	  		<tbody>
	  			<tr class="point-detail-list text-center">
	  				<td>내용</td>
	  				<td>포인트</td>
	  				<td>구분</td>
	  				<td>일시</td>
	  			</tr>
	  			
	  			<c:forEach var="pointDto" items="${point_list}">
	              <tr class="text-center">
	                <td>${pointDto.content}</td>
	                <c:choose>
	                	<c:when test="${pointDto.use_yn eq '적립'}">
	                	<td style="color:blue;">+${pointDto.point}</td>
	                	</c:when>
	                	<c:otherwise>
	                	<td style="color:red;">-${pointDto.point}</td>
	                	</c:otherwise>
	                </c:choose>
	                <c:choose>
	                	<c:when test="${pointDto.use_yn eq '적립'}">
	                	<td style="color:blue;">${pointDto.use_yn}</td>
	                	</c:when>
	                	<c:otherwise>
	                	<td style="color:red;">${pointDto.use_yn}</td>
	                	</c:otherwise>
	                </c:choose>
	                <td>${pointDto.when}</td>
	              </tr>
                 </c:forEach>
	  			
	  			  <tr>
	  			  	<td class="text-center" colspan="4">
	  			  		<button class="btn btn-info" id="point" data-toggle="modal" data-target="#apply" data-no="${pointVO.member_code}">포인트증정</button>
  			  			<a href="${pageContext.request.contextPath}/super_admin/point/list" class="btn btn-secondary text-white">목록</a>
  			  		</td>
	  			  </tr>
	  		</tbody>
	  	</table>
	  </div>
	  <!-- 포인트상세목록 끝 -->
	</div>
	<!-- 전체 끝 -->

	<!-- 포인트 모달 시작-->
    <form id="modal-form" action="send_point" method="post">
    <input type="hidden" name="member_code" value="${memberDto.no}">
    <div class="modal" id="apply">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h4 class="modal-title">포인트 증정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                        <tr class="text-center">
                            <td class="table-secondary" width=30%;>포인트 금액</td>
                            <td>
                                <div class="form-group">
                                    <input type="number" name="point" class="form-control" placeholder="금액을 입력하세요."><br>
                                    <textarea rows="7" cols="" name="content" class="form-control" placeholder="내용를 입력하세요."></textarea>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="확인">
                <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
            </div>
         </div>
     </div>
     </form>
     <!-- 포인트 모달 끝 -->





<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>