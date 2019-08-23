<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/client/info_top_menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>

   <!--주문상세시작-->
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
       <!--주문상세정보 시작-->
        <div class="order-detail-info">
            <h5 style="font-size: 1.3rem; color:#2C3E50;">주문 정보</h5><hr>
         <table class="table table-borderless">
             <tbody>
                 <tr>
                     <td class="Detail-title">매장</td>
                     <td class="Detail-content">
                        <img src="https://placeimg.com/100/100/any" class="ml-4">
                         <span style="font-size: 1.3rem">${shopDto.shop_name}</span>
                     </td>
                 </tr>
                 <tr>
                     <td class="Detail-title">주문상태</td>
                     <td class="Detail-content">
                         <span  class="text-info">${orderDto.order_status} (${shopDto.min_time})</span>
                     </td>
                 </tr>
                 <tr>
                     <td class="Detail-title">주문일시</td>
                     <td class="Detail-content">
                         <span>${orderDto.order_date}</span>
                     </td>
                 </tr>
             </tbody>
         </table>
         </div>
         <!--주문상세정보 끝-->
         
         <!--주문 내역 시작-->
         <div class="order-detail-info mt-5">
           <h5 style="font-size: 1.3rem; color:#2C3E50;">주문 내역</h5><hr>
           <table class="table table-borderless">
               <tbody>
                   <tr>
                     <td class="Detail-title">메뉴</td>
                     <td class="Detail-content">
                         <table class="table">
                             <tbody>
                             	 <c:forEach var="order_distinct" items="${order_distinct}">
                                 <tr>
                                     <td class="Detail-menu">
                                         <span>${order_distinct.menu_name} x ${order_distinct.menu_amount}</span>
                                     </td>
                                     <td class="Detail-menu-price">
                                         <span>${order_distinct.menu_price}원</span>
                                     </td>
                                 </tr>
                                 </c:forEach>
                                 
							     <c:set var="loop1Flag" value="true"></c:set>
								 <c:forEach var="order_detail" items="${order_detail_list}">	
                                 <tr>
                                     <td class="Detail-menu-title">
                                     	 <c:if test="${loop1Flag && order_detail.sub_type eq '필수'}">
	                                         <span>[${order_detail.title}]</span>
	                                         <c:set var="loop1Flag" value="false" />
								      	 </c:if>
                                     </td>
                                 </tr>
                                 </c:forEach>
                                 
                                 <c:forEach var="order_detail" items="${order_detail_list}">
	                                 <c:if test="${order_detail.sub_type eq '필수'}">
		                                 <tr>
		                                     <td class="Detail-subMenu-name">
		                                         <span>-${order_detail.sub_name} :</span>
		                                     </td>
		                                     <td class="Detail-subMenu-price">
		                                         <span>+${order_detail.sub_price}원</span>
		                                     </td>
		                                 </tr>
	                                 </c:if>
                                 </c:forEach>
                                 
                                 <c:set var="loop1Flag" value="true"></c:set>
								 <c:forEach var="order_detail" items="${order_detail_list}">	
	                                 <tr>
	                                     <td class="Detail-menu-title">
	                                     	 <c:if test="${loop1Flag && order_detail.sub_type eq '선택'}">
		                                         <span>[${order_detail.title}]</span>
		                                         <c:set var="loop1Flag" value="false" />
									      	 </c:if>
	                                     </td>
	                                 </tr>
                                 </c:forEach>
                                 
                                 <c:forEach var="order_detail" items="${order_detail_list}">
	                                 <c:if test="${order_detail.sub_type eq '선택'}">
		                                 <tr>
		                                     <td class="Detail-subMenu-name">
		                                         <span>-${order_detail.sub_name} :</span>
		                                     </td>
		                                     <td class="Detail-subMenu-price">
		                                         <span>+${order_detail.sub_price}원</span>
		                                     </td>
		                                 </tr>
	                                 </c:if>
                                 </c:forEach>
                                 
                             </tbody>
                         </table>
                     </td>
                 </tr>
                 <tr>
                     <td class="Detail-title">주문합계</td>
                     <td class="Detail-content">
                         <span style="font-size: 1.2rem">${orderDto.total_price}원</span>
                     </td>
                 </tr>
                 <tr>
                     <td class="Detail-title">배달요금</td>
                     <td class="Detail-content">
                         <span>${shopDto.delivery_price}원</span>
                     </td>
                 </tr>
                 <tr>
                     <td class="Detail-title">추가할인</td>
                     <td class="Detail-content">
                         <span class="text-danger">-${orderDto.discount_price}원</span>
                     </td>
                 </tr>
                 <tr>
                     <td class="Detail-title">총 결제금액</td>
                     <td class="Detail-content">
                         <span style="font-size: 1.3rem; color:darkblue;" >${final_price}원</span>
                     </td>
                 </tr>
                 <tr>
                     <td class="Detail-title">결제방식</td>
                     <td class="Detail-content">
                         <span>${orderDto.pay_method}</span>
                     </td>
                 </tr>
               </tbody>
           </table>
         </div>
         <!--주문 내역 끝-->
         
         <!--주문자정보 시작-->
         <div class="order-detail-info mt-5">
           <h5 style="font-size: 1.3rem; color:#2C3E50;">주문자 정보</h5><hr>
           <table class="table table-borderless">
               <tbody>
                   <tr>
                     <td class="Detail-title">연락처</td>
                     <td class="Detail-content">
                         <span>${memberDto.phone}</span>
                     </td>
                 </tr>
                 <tr>
                     <td class="Detail-title">주소</td>
                     <td class="Detail-content">
                         <span>${memberDto.basic_addr}${memberDto.detail_addr}</span>
                     </td>
                 </tr>
                 <tr>
                     <td class="Detail-title">요청사항</td>
                     <td class="Detail-content">
                         <span>${orderDto.request}</span>
                     </td>
                 </tr>
               </tbody>
           </table>
         </div>
         <!--주문자정보  끝-->
         <div class="text-center mt-3">
             <a href="${pageContext.request.contextPath}/member/info_order_list" class="btn btn-info detail-btn">목 록</a>
         </div>
       </div>
     </div>
   </div>
   <!--주문상세 끝-->