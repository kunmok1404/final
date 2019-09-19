<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_promotion.jsp"></jsp:include>

<script>
	$(function(){
		
		// 포인트 클릭시 멤버코드 설정
		$(".point").click(function(){
			var no = $(this).attr("data-no");
			console.log(no);
			$("input[name=member_code]").val(no);
		})
		
	})
</script>

	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>포인트 목록</span>
      </div>
     
	  <!-- 검색목록창 시작 -->
	  <div class="search-wrapper">
	  	<form action="" method="post">
	  	<table class="table table-sm">
	  		<tbody>
	  			<tr>
	  				<td width="10%" class="table-active">회원분류</td>
	  				<td width="40%">
	  					<select name="apply_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">일반</option>
	  						<option value="">블랙</option>
	  						<option value="">탈퇴</option>
	  					</select>
	  				</td>
	  				<td width="10%" class="table-active">회원등급</td>
	  				<td width="40%">
	  					<select name="sale_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">일반</option>
	  						<option value="">골드</option>
	  						<option value="">vip</option>
	  					</select>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td width="10%" class="table-active">조건검색</td>
	  				<td width="40%">
	  					<select name="food_category" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">적립높은순</option>
	  						<option value="">적립낮은순</option>
	  						<option value="">사용높은순</option>
	  						<option value="">사용낮은순</option>
	  						<option value="">현재높은순</option>
	  						<option value="">현재낮은순</option>
	  					</select>
	  				</td>
	  			</tr>
	  		</tbody>
	  	</table>
	  	<div style="width:100%;">
	  	<input type="submit" value="검색" class="btn pull-right btn-outline-primary search-btn">
	  	</div>
	  	</form>
	  </div>
	  <!-- 검색목록창 끝-->
	  
	  <!-- 리뷰목록 시작 -->
	  <div class="list-wrapper table-responsive">
	  <div class="search-number">
	  	<p>총 0건</p>
	  </div>
	  	<table class="table table-hamburg table-hover">
	  		<tbody>
	  			<tr class="point-detail-list text-center">
	  				<td>번호</td>
	  				<td>아이디</td>
	  				<td>회원등급</td>
	  				<td>회원분류</td>
	  				<td>총적립포인트</td>
	  				<td>총사용포인트</td>
	  				<td>현재포인트</td>
	  			</tr>
	  			
	  			<c:forEach var="pointVO" items="${point_list}">
	  			<tr class="text-center">
	  				<td>${pointVO.member_code}</td>
	  				<td class="over-text"><a href="${pageContext.request.contextPath}/super_admin/point/detail?member_code=${pointVO.member_code}" class="text-primary">${pointVO.id}</a></td>
	  				<td>${pointVO.grade}</td>
	  				<td>${pointVO.status}</td>
	  				<td class="text-info">+${pointVO.total_point}</td>
	  				<td class="text-danger">-${pointVO.use_point}</td>
	  				<td>${pointVO.present_point}</td>
	  				<td><button class="btn btn-sm btn-info point" data-toggle="modal" data-target="#apply" data-no="${pointVO.member_code}">포인트증정</button></td>
	  			</tr>
	  			</c:forEach>
	  			
	  		</tbody>
	  	</table>
	  </div>
	  <!-- 리뷰목록 끝 -->
	</div>
	<!-- 전체 끝 -->

	<!-- 포인트 모달 시작-->
    <form id="modal-form" action="send_point" method="post">
    <input type="hidden" name="member_code">
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