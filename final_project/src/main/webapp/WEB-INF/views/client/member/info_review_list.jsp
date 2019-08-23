<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/client/info_top_menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>
<!--주문내역 contents-->
    <div class="wrapper">
      <div class="row">
        <div class="col-md-12 myInfo-title">
          <div id="myInfo-wrapper">
            <div class="myInfo-line"></div>
          </div>
          <span>리뷰관리</span>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-md-12">
          <table class="table table-bordered text-center myInfo-table">
            <thead>
              <tr class="">
                <td style="width: 10%">번호</td>
                <td style="width: 20%">매장</td>
                <td style="width: 30%">제목</td>
                <td style="width: 20%">점수</td>
                <td style="width: 10%">작성일</td>
                <td style="width: 10%">조회수</td>
              </tr>
            </thead>
            <tbody>
<%--               <c:forEach var="order_map" items="${order_list}"> --%>
<!--               <tr> -->
<%--                 <td>${order_map.get("no")}</td> --%>
<%--                 <td>${order_map.get("shop_name")}</td> --%>
<%--                 <td><a href="${pageContext.request.contextPath}/member/info_order_detail?order_code=${order_map.get('no')}">${order_map.get("menu_name")}&nbsp등&nbsp${order_map.get("menu_count")}개</a></td> --%>
<%--                 <td>${order_map.get("order_date")}</td> --%>
<%--                 <td>${order_map.get("order_status")}</td> --%>
<!--               </tr> -->
<%--               </c:forEach> --%>
            </tbody>
          </table>
        </div>
      </div>
    </div>