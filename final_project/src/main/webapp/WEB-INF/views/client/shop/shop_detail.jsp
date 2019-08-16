<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/category/food_category.jsp"></jsp:include>

<!--매장상세-->
    <div class="shop">
      <div class="container">
        <!--매장 정보-->
        <div class="shop-info offset-1 col-10">
            <img src="${pageContext.request.contextPath}/resources/image/food.png">
            매장정보
        </div>
        <!--메뉴정보-->
        <div class="menu-detail offset-1 col-10">
          <!--메뉴 탭-->
          <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#qwe">메뉴</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#asd">클린리뷰3</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#zxc">정보</a>
            </li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane fade show active" id="qwe">
              <div class="menu">
                메뉴정보
              </div>
            </div>
            <div class="tab-pane fade" id="asd">
              <div class="review">
                리뷰정보
              </div>
            </div>
            <div class="tab-pane fade" id="zxc">
              <div class="info">
                정보
              </div>
            </div>
          </div>
          
        </div>
      </div>
    </div>
  
    <!-- 모달버튼 -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        모달버튼1
    </button>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        모달버튼2
    </button>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        모달버튼3
    </button>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        모달버튼4
    </button>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        모달버튼5
    </button>
    <!-- 모달 -->
    <div class="modal" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- 모달 헤더 -->
          <div class="modal-header">
            <h4 class="modal-title">모달 헤더</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <!-- 모달 바디 -->
          <div class="modal-body">
            모달 바디
          </div>
          <!-- 모달 푸터 -->
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
    
        </div>
      </div>
    </div>









<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>