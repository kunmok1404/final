<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    <jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
    
    
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
                              <td><span class="home-content">${all.size() }건</span></td>
                            </tr>
                            <tr>
                              <td class="text-right"><span class="home-content text-primary">승인 완료 :</span></td>
                              <td><span class="home-content text-primary">${sus.size() }건</span></td>
                            </tr>
                            <tr>
                              <td class="text-right"><span class="home-content text-danger">승인 대기 :</span></td>
                              <td><span class="home-content text-danger">${dagi.size()}건</span></td>
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
                          <img src="${pageContext.request.contextPath}/resources/image/user.png" class="home-img">
                        </td>
                        <td>
                            <table class="table table-borderless">
                              <tbody>
                                <tr><td class="text-center home-title" colspan="2">회원 현황</td></tr>
                                <tr>
                                  <td width="50%" class="text-right"><span class="home-content">총 가입자  :</span></td>
                                  <td><span class="home-content">${memberall.size() }명</span></td>
                                </tr>
                                <tr>
                                  <td class="text-right"><span class="home-content text-primary">블랙회원 :</span></td>
                                  <td><span class="home-content text-primary">${membernagam.size() }명</span></td>
                                </tr>
                                <tr>
                                  <td class="text-right"><span class="home-content text-danger">회원 :</span></td>
                                  <td><span class="home-content text-danger">${memberday.size() }명</span></td>
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
                                  <td><span class="home-content">${month }원</span></td>
                                </tr>
                                <tr>
                                  <td class="text-right"><span class="home-content text-primary">이번주 :</span></td>
                                  <td><span class="home-content text-primary">${week }원</span></td>
                                </tr>
                                <tr>
                                  <td class="text-right"><span class="home-content text-danger">오늘 :</span></td>
                                  <td><span class="home-content text-danger">${day }원</span></td>
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
            <table class="table table-hamburg mt-3 today-table">
              <tbody>
                <tr>
                  <td><img src="${pageContext.request.contextPath}/resources/image/shop.png"></td>
                  <td class="super-title">가입매장현황</td>
                  <td>
                    <table class="table table-borderless">
                      <tbody>
                        <tr>
                          <td class="super-sub-title">총 매장수:</td>
                          <td class="super-sub-title">${apply_all }개</td>
                        </tr>
                        <tr>
                          <td class="super-sub-title text-danger">승인완료:</td>
                          <td class="super-sub-title text-danger">${apply_sus }건</td>
                        </tr>
                        <tr>
                          <td class="super-sub-title text-info">승인대기:</td>
                          <td class="super-sub-title text-info">${apply_dagi }건</td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td><img src="${pageContext.request.contextPath}/resources/image/meal.png"></td>
                  <td class="super-title">주문 현황</td>
                  <td>
                    <table class="table table-borderless">
                      <tbody>
                        <tr>
                          <td class="super-sub-title">이번달 주문건수:</td>
                          <td class="super-sub-title">${date_month }건</td>
                        </tr>
                        <tr>
                          <td class="super-sub-title text-primary">이번주 주문건수:</td>
                          <td class="super-sub-title text-primary">${date_week }건</td>
                        </tr>
                        <tr>
                          <td class="super-sub-title text-info">오늘 주문건수:</td>
                          <td class="super-sub-title text-info">${date_day }건</td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>

        </div>
        <!--공지사항-->
        <div class="col-md-5">
            <div class="shop_notice">
              <table class="table table-borderless table-hover">
                  <tbody>
                    <tr>
                      <td width="60%" class="today-order">
                          <img src="${pageContext.request.contextPath}/resources/image/megaphone.png">
                          공지사항
                      </td>
                      <td width="20%" class="text-right">
                        <a href="${pageContext.request.contextPath}/super_admin/notice/list" class="text-secondary today-order">더보기</a>
                      </td>
                    </tr>
                  </tbody>
              </table>
            </div>
            <table class="table table-striped table-hover mt-3 today-table">
              <tbody>
                <c:forEach var="notice" items="${notice_List}">
                <tr>
                  <td class="today-notice-content"><a href="${pageContext.request.contextPath}/super_admin/notice/content?no=${notice.no}">${notice.title}</a></td>
                  <td class="today-notice-content text-secondary text-center">${notice.regist_date}</td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
        </div>
      </div>

    </div>
    
    
    
    
    
    <jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>