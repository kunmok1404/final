<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!--나의정보 left메뉴-->
    <div class="myInfo-box">
      <div class="myInfo-left">
        <div class="my-Info">나의 정보</div>
        <div class="myMenu on">
          <span><a href="${pageContext.request.contextPath}/member/info_order_list">주문내역</a></span>
        </div>
        <div class="myMenu">
          <span><a href="${pageContext.request.contextPath}/review/info_review_list">리뷰관리</a></span>
        </div>
        <div class="myMenu">
          <span>나의쿠폰</span>
        </div>
        <div class="myMenu">
          <span>포인트</span>
        </div>
        <div class="myMenu">
          <span>찜한매장</span>
        </div>
        <div class="myMenu">
          <span>개인정보수정</span>
        </div>
      </div>
    </div>