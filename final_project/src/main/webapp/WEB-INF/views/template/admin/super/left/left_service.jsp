<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--left 메뉴 시작-->
  <div class="left">
    <ul>
      <li><a href="${pageContext.request.contextPath}/super_admin/ono/ono_list">고객 1:1 문의</a></li>
      <li><a href="${pageContext.request.contextPath}/super_admin/ono/ono_list?reply_status=답변대기">고객문의 답변대기(<span class="text-danger">${count_reply}</span>)</a></li>
      <li><a href="${pageContext.request.contextPath}/super_admin/ono/ono_list_ceo">매장 1:1 문의</a></li>
      <li><a href="${pageContext.request.contextPath}/super_admin/ono/ono_list_ceo?reply_status=답변대기">매장문의 답변대기(<span class="text-danger">${count_reply_ceo}</span>)</a></li>
      <li><a href="${pageContext.request.contextPath}/super_admin/qna/qna_list">자주하는 질문</a></li>
      <li><a href="${pageContext.request.contextPath}/super_admin/qna/category">질문카테고리</a></li>
    </ul>
  </div>  
  <!--left 메뉴 끝--> 