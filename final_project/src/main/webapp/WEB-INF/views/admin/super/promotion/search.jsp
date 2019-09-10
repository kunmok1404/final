<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_member.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$(".all").click(function() {
		if ($(this).prop("checked")) {
			$(".box").prop("checked",true);
		}else {
			$(".box").prop("checked",false);
		}
		})
	})
</script>

<div class="wrapper mt-3">

	<div class="top-title">
		<div id="terms-wrapper">
			<div class="terms-line"></div>
		</div>
		<span>회원 목록</span>
	</div>
	
	<!-- 검색 목록 창 시작 -->
	<div>
		<form action="search" method="get">
			<table class="table table-sm">
				<tbody>
					<tr>
						<td width="10%" class="table-active">회원 상태</td>
						<td width="40%">
							<select name="status">
								<option>전체</option>
								<option>일반</option>
								<option>블랙</option>
								<option>탈퇴</option>
							</select>
						</td>
						<td width="10%" class="table-active">회원 등급</td>
						<td width="40%">
							<select name="grade" class="form-control">
								<option>전체</option>
								<option>일반</option>
								<option>골드</option>
								<option>VIP</option>
							</select>
						</td>
					<tr>
					<tr>
						<td width="10%" class="table-active">가입일</td>
						<td width="40%">
							<input type="date" name="start_date">~
	  						<input type="date" name="end_date">
						</td>
						<td width="10%" class="table-active">키워드 검색</td>
						<td width="40%">
							<select name="type" class="form-control">
								<option>전체</option>
								<option value="id" ${type == 'id'?'selected':''}>아이디</option>
								<option value="phone" ${type == 'phone'?'selected':''}>전화번호</option>
							</select>
						</td>
						<td>
							<input type="search" name="keyword" placeholder="검색어" value="${keyword}">
						</td>
					<tr>
					<tr>
						<td colspan="4" align="right">
							<input type="submit" value="검색">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 검색 목록 창 끝 -->

	<!-- 회원 목록 시작 -->
	<div>
		<c:choose>
			<c:when test="${list.isEmpty()}">
				<h3>검색 결과가 존재하지 않습니다.</h3>
			</c:when>
			<c:otherwise>
			<form method="post">
			<input type="hidden" value="${coupon_code }" name="coupon_code">
				<table  class="table table-hamburg table-hover">
					<thead>
						<tr class="table-primary text-center">
							<th><input type="checkbox" class="all"></th>
							<th>번호</th>
							<th>아이디</th>
							<th>회원등급</th>
							<th>회원상태</th>
							<th>전화번호</th>
							<th>포인트</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody class="check">
						<c:forEach var="vo" items="${list}">
							<tr class="text-center">
								<th><input type="checkbox"  name="member_code" value="${vo.no}" class="box"></th>
								<td>${vo.no}</td>
								<td><a href="${pageContext.request.contextPath}/super_admin/member/info?no=${vo.no}">${vo.id}</a></td>
								<td>${vo.grade}</td>
								<td>${vo.status}</td>
								<td>${vo.phone}</td>
								<td>${vo.point}</td>
								<td>${vo.regist_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
				<input type="submit" value="발급">
				</div>
			</form>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 회원 목록 끝 -->
</div>

<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>