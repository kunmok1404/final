<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/client/info_top_menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>

<script>

	$(function(){
		
		// 주문취소버튼 클릭시
		$(".order-cancel").click(function(){
			var result = alert("주문을 취소하시겠습니까?");
			console.log(result);
			if(result){
				alert("취소누름");
				location.href="${pageContext.request.contextPath}";
			}
		})
		
	})
	

</script>
<!--주문내역 contents-->
    <div class="wrapper">
      <div class="row">
        <div class="col-md-12 myInfo-title">
          <div id="myInfo-wrapper">
            <div class="myInfo-line"></div>
          </div>
          <span>주문관리</span>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-md-12">
          <table class="table table-borderless text-center myInfo-table">
            <thead>
              <tr class="">
                <td style="width: 10%">번호</td>
                <td style="width: 20%">매장</td>
                <td style="width: 30%">메뉴</td>
                <td style="width: 20%">주문일시</td>
                <td style="width: 10%">주문상태</td>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="order_map" items="${order_list}">
              <tr>
                <td>${order_map.get("no")}</td>
                <td>${order_map.get("shop_name")}</td>
                <td><a href="${pageContext.request.contextPath}/member/info_order_detail?order_code=${order_map.get('no')}">${order_map.get("menu_name")}&nbsp등&nbsp${order_map.get("menu_count")}개</a></td>
                <td>${order_map.get("order_date")}</td>
				<c:if test="${order_map.get('order_status') eq '배달완료'}">
					<td>${order_map.get("order_status")}</td>
				</c:if>
				<c:if test="${order_map.get('order_status') eq '조리중'}">
					<td class="text-primary">${order_map.get("order_status")}</td>
				</c:if>
				<c:if test="${order_map.get('order_status') eq '접수대기'}">
					<td class="text-warning">${order_map.get("order_status")}</td>
				</c:if>
				<c:if test="${order_map.get('order_status') eq '취소완료'}">
					<td class="text-danger">${order_map.get("order_status")}</td>
				</c:if>
                <td>
                	<c:if test="${order_map.get('review_status') eq '미작성' && order_map.get('order_status') eq '배달완료'}">
                		<a href="${pageContext.request.contextPath}/review/write?order_code=${order_map.get('no')}" class="btn btn-sm btn-primary">리뷰작성</a>
                	</c:if>
                	<c:if test="${order_map.get('order_status') eq '접수대기'}">
                		<a class="btn btn-sm btn-danger order-cancel">주문취소</a>
                	</c:if>
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>