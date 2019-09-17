<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin/shop/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<script>
   	$(function(){
   		setInterval(checkOrderCount, 5000);
   	});
   	
   	function checkOrderCount(){
   		console.log("checkOrderCount");
   		$.ajax({
   			url:"${pageContext.request.contextPath}/shop_admin/update_orders_status",
   			type:"get",
   			success:function(resp){
   				$(".today-order-content").text("0");
   				for(var i=0; i < resp.length; i++){
   					console.log(resp[i].order_status, resp[i]['order_status']);
   					
   					$(".today-order-content").filter(function(){
   						return $(this).data("status") == resp[i].order_status;
   					}).text(resp[i].cnt);
   				} 
   			},
   			error:function(e){
   				console.log(e);
   			}
   		});
   	}
   </script>

<!--shop_admin home 컨텐츠-->
    <div class="shop-wrapper">
      <div class="row">
        <span class="home-menu-box">
          <table class="table table-borderless">
              <tbody>
                  <tr>
                      <td width="30%">
                        <img src="${pageContext.request.contextPath}/resources/image/menu.png" class="home-img">
                      </td>
                      <td>
                        <table class="table table-borderless">
                          <tbody>
                            <tr><td class="text-center home-title" colspan="2">메뉴등록 현황</td></tr>
                            <tr>
                              <td width="50%" class="text-right"><span class="home-content">총 등록수 :</span></td>
                              <td><span class="home-content">${all }건</span></td>
                            </tr>
                            <tr>
                              <td class="text-right"><span class="home-content text-primary">승인 완료 :</span></td>
                              <td><span class="home-content text-primary">${sus }건</span></td>
                            </tr>
                            <tr>
                              <td class="text-right"><span class="home-content text-danger">승인 대기 :</span></td>
                              <td><span class="home-content text-danger">${dagi }건</span></td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                  </tr>
              </tbody>
          </table>
        </span>
        <span class="home-order-box">
            <table class="table table-borderless">
                <tbody>
                    <tr>
                        <td width="30%">
                          <img src="${pageContext.request.contextPath}/resources/image/meal.png" class="home-img">
                        </td>
                        <td>
                            <table class="table table-borderless">
                              <tbody>
                                <tr><td class="text-center home-title" colspan="2">주문 현황</td></tr>
                                <tr>
                                  <td width="50%" class="text-right"><span class="home-content">이번 달 :</span></td>
                                  <td><span class="home-content">${date_month }건</span></td>
                                </tr>
                                <tr>
                                  <td class="text-right"><span class="home-content text-primary">이번 주 :</span></td>
                                  <td><span class="home-content text-primary">${date_week }건</span></td>
                                </tr>
                                <tr>
                                  <td class="text-right"><span class="home-content text-danger">오늘  :</span></td>
                                  <td><span class="home-content text-danger">${date_day }건</span></td>
                                </tr>
                              </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </span>
        <span class="home-sale-box">
            <table class="table table-borderless">
                <tbody>
                    <tr>
                        <td width="30%">
                          <img src="${pageContext.request.contextPath}/resources/image/sale.png" class="home-img">
                        </td>
                        <td>
                            <table class="table table-borderless">
                              <tbody>
                                <tr><td class="text-center home-title" colspan="2">매출 현황</td></tr>
                                <tr>
                                  <td width="30%" class="text-right"><span class="home-content text-right">이번달 :</span></td>
                                  <td><span class="home-content">${month}원</span></td>
                                </tr>
                                <tr>
                                  <td class="text-right"><span class="home-content text-primary">이번주 :</span></td>
                                  <td><span class="home-content text-primary">${week}원</span></td>
                                </tr>
                                <tr>
                                  <td class="text-right"><span class="home-content text-danger">오늘 :</span></td>
                                  <td><span class="home-content text-danger">${day}원</span></td>
                                </tr>
                              </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </span>
      </div>

      <div class="row mt-3">
        <!--오늘의 주문현황-->
        <div class="col-md-6">
            <div class="today-order">
              <img src="${pageContext.request.contextPath}/resources/image/order.png">
              오늘의 주문현황
            </div>
            <table class="table table-bordered mt-3 today-table">
              <tbody>
                <tr>
                  <td class="today-order-title">접수대기</td>
                  <td class="today-order-title">조리중</td>
                  <td class="today-order-title">배달완료</td>
                  <td class="today-order-title">취소</td>
                </tr>
                <tr>
                  <td data-status="접수대기" class="today-order-content">10</td>
                  <td data-status="조리중" class="today-order-content text-info">7</td>
                  <td data-status="배달완료" class="today-order-content text-primary">20</td>
                  <td data-status="취소" class="today-order-content text-danger">2</td>
                </tr>
              </tbody>
            </table>

        </div>
        <!--공지사항-->
        <div class="col-md-5">
            <div class="shop_notice">
              <table class="table table-borderless">
                  <tbody>
                    <tr>
                      <td width="60%" class="today-order">
                          <img src="${pageContext.request.contextPath}/resources/image/megaphone.png">
                          공지사항
                      </td>
                      <td width="20%" class="text-right">
                        <a href="#" class="text-secondary today-order">더보기</a>
                      </td>
                    </tr>
                  </tbody>
              </table>
            </div>
            <table class="table table-striped table-hover mt-3 today-table">
              <tbody>
                <tr>
                  <td class="today-notice-content">수수료율 정책 변경 공지사항</td>
                  <td class="today-notice-content text-secondary text-center">2019-08-01</td>
                </tr>
                <tr>
                  <td class="today-notice-content">신규입점 정책에 관한 공지</td>
                  <td class="today-notice-content text-secondary text-center">2019-07-20</td>
                </tr>
                <tr>
                  <td class="today-notice-content">메뉴 등록시 주의사항 공지</td>
                  <td class="today-notice-content text-secondary text-center">2019-06-30</td>
                </tr>
                <tr>
                  <td class="today-notice-content">배송비 수수료에 관한 공지</td>
                  <td class="today-notice-content text-secondary text-center">2019-05-03</td>
                </tr>
                <tr>
                  <td class="today-notice-content">1:1문의 답변관련 공지</td>
                  <td class="today-notice-content text-secondary text-center">2019-04-15</td>
                </tr>
              </tbody>
            </table>
        </div>
      </div>

    </div>


    <jsp:include page="/WEB-INF/views/template/admin/shop/footer.jsp"></jsp:include>