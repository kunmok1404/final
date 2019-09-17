<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
        
    <!--고객센터 left메뉴-->
    <div class="myInfo-box">
      <div class="myInfo-left">
        <div class="my-Info">고객센터</div>
        <div ${url == '/notice/list' ? 'class="on"' : ''}>
       
          <span><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></span>
        </div>
        <div ${url == '/qna/list' ? 'class="on"' : ''}>
          <span><a href="${pageContext.request.contextPath}/qna/list">자주하는 질문</a></span>
        </div>
        <div ${url == '/ono/list' ? 'class="on"' : ''}>
          <span><a href="${pageContext.request.contextPath}/ono/list">1:1 문의</a></span>
        </div>
      </div>
    </div>