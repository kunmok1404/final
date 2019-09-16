<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_member.jsp"></jsp:include>

<div class="wrapper mt-3">
	<div class="top-title">
		<div id="terms-wrapper">
			<div class="terms-line"></div>
		</div>
		<span>회원 정보</span>
	</div>

	<!-- 회원 정보 상세보기 -->
	<div>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td class="table-active">아이디</td>
					<td>${membervo.id}</td>
					<td class="table-active">이메일</td>
					<td>${membervo.email}@${membervo.email_address}</td>
				</tr>
				<tr>
					<td class="table-active">전화번호</td>
					<td>${membervo.phone}</td>
					<td class="table-active">주소</td>
					<td>${membervo.post}<br> ${membervo.basic_addr}<br>
						${membervo.detail_addr}
					</td>
				</tr>
				<tr>
					<td class="table-active">회원등급</td>
					<td>${membervo.grade}</td>
					<td class="table-active">회원상태</td>
					<td>${vmembervoo.status}</td>
				</tr>
				<tr>
					<td class="table-active">쿠폰</td>
					<td>${membervo.coupon}</td>
					<td class="table-active">포인트</td>
					<td>${membervo.point}</td>
				</tr>
				<tr>
					<td class="table-active">총 사용 금액</td>
					<td colspan="3">${membervo.total_price}원</td>
				</tr>
				<tr>
					<td class="table-active">1:1문의</td>
					<td>${membervo.ono}</td>
					<td class="table-active">리뷰</td>
					<td>${membervo.review}</td>
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
			<a
				href="${pageContext.request.contextPath}/super_admin/member/search"
				class="btn btn-secondary btn-lg mr-5">목록</a> <a
				href="${pageContext.request.contextPath}/super_admin/member/edit?no=${membervo.no}"
				class="btn btn-primary btn-lg mr-5">수정</a> <a
				href="${pageContext.request.contextPath}/super_admin/member/delete?no=${membervo.no}"
				class="btn btn-danger btn-lg mr-5">탈퇴</a>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>