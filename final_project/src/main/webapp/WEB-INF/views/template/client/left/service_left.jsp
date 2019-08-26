<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <!--고객센터 left메뉴-->
    <div class="myInfo-box">
      <div class="myInfo-left">
        <div class="my-Info">고객센터</div>
        <div class="myMenu on">
          <span><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></span>
        </div>
        <div class="myMenu">
          <span><a href="${pageContext.request.contextPath}/qna/list">자주하는 질문</a></span>
        </div>
        <div class="myMenu">
          <span><a href="${pageContext.request.contextPath}/ono/list">1:1 문의</span>
        </div>
      </div>
    </div>