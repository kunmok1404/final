<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_review.jsp"></jsp:include>

	<!-- 전체시작 -->
	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>리뷰관리</span>
      </div>
     
	  <!-- 검색목록창 시작 -->
	  <div class="search-wrapper">
	  	<form action="" method="post">
	  	<table class="table table-sm">
	  		<tbody>
	  			<tr>
	  				<td width="10%" class="table-active">답변상태</td>
	  				<td width="40%">
	  					<select name="reply_status" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">미답변</option>
	  						<option value="">답변완료</option>
	  						<option value=""></option>
	  					</select>
	  				</td>
	  				<td width="10%" class="table-active">키워드검색</td>
	  				<td width="40%">
	  					<select name="keyword" class="form-control">
	  						<option value="">선택</option>
	  						<option value="">메뉴명</option>
	  						<option value="">작성자</option>
	  						<option value="">매장명</option>
	  					</select>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td width="10%" class="table-active">작성일</td>
	  				<td width="40%">
	  					<input type="date" name="start_date">~
	  					<input type="date" name="end_date">
	  				</td>
	  				<td width="10%" class="table-active">순위</td>
	  				<td width="40%">
	  					<select name="rank" class="form-control">
	  						<option value="">전체</option>
	  						<option value="">조회수많은순</option>
	  						<option value="">조휘수적은순</option>
	  						<option value="">평점높은순</option>
	  						<option value="">평점낮은순</option>
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
	  	<p>총 ${search_number}건</p>
	  </div>
	  	<table class="table table-hamburg table-hover">
	  		<tbody>
	  			<tr class="table-primary text-center">
	  				<td>번호</td>
	  				<td>제목</td>
	  				<td>매장명</td>
	  				<td>조회수</td>
	  				<td>평점</td>
	  				<td>작성일</td>
	  				<td>답변상태</td>
	  				<td>편집</td>
	  			</tr>
	  			
	  			<c:forEach var="reviewVO" items="${list}">
	  			<tr class="text-center">
	  				<td>${reviewVO.no}</td>
	  				<td class="over-text"><a href="${pageContext.request.contextPath}/super_admin/review/detail?review_code=${reviewVO.no}" class="text-primary">${reviewVO.title}</a></td>
	  				<td>${reviewVO.shop_name}</td>
	  				<td>${reviewVO.read}</td>
	  				<td>${reviewVO.score}</td>
	  				<td>${reviewVO.regist_date}</td>
	  				<c:choose>
	  					<c:when test="${reviewVO.reply_status eq '답변대기'}">
	  						<td class="text-danger">${reviewVO.reply_status}</td>
	  					</c:when>
	  					<c:otherwise>
	  						<td class="text-primary">${reviewVO.reply_status}</td>
	  					</c:otherwise>
	  				
	  				</c:choose>
	  				<td><button class="btn btn-sm btn-danger">삭제</button></td>
	  			</tr>
	  			</c:forEach>
	  		</tbody>
	  	</table>
	  </div>
	  <!-- 리뷰목록 끝 -->
	</div>
	<!-- 전체 끝 -->







<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>