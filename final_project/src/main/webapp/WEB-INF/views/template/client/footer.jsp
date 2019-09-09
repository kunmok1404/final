<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<footer>
      <div class="footer-menu">
          <ul>
            <li class="mt-2"><a data-toggle="modal" data-target="#myModal">약관</a></li>
            <li><a href="${pageContext.request.contextPath}/shop_admin/member/login">뭐먹지사장님</a></li>
            <li><a href="${pageContext.request.contextPath}/shop/explan">입점문의</a></li>
          </ul>
      </div><hr>
      <div class="footer-content container-fluid" align="left" >
        <h5>(유)딜리버리히어로 코리아</h5>
		<h6>서울시 서초구 서초대로38길 12 마제스타시티 타워2 17층|대표자 : 강신봉|사업자등록번호:211-88-68802 사업자정보확인통신판매업신고:제 2018-서울서초-2635호|</h6>
		<h6>개인정보담당자 : privacy@yogiyo.co.kr|제휴문의 : partnership@deliveryhero.co.kr|고객만족센터 : support@yogiyo.co.kr|호스트서비스사업자 : (주)심플렉스인터넷</h6>
					
					<h6>뭐먹지</h6>
					<h6>안심센터뭐먹지 100%</h6>
					<h6>클린리뷰고객만족센터 02-3447-3612 24시간, 연중무휴</h6>
				<h6>유한회사 딜리버리히어로 코리아는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품/ 거래정보 및 거래와 관련하여 </h6>
				<h6>뭐먹지에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 유한회사 딜리버리히어로 코리아는 책임을 지지 않습니다. </h6>
				<h6>상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 확인하여 주시기 바랍니다. Copyright YOGIYO. All Rights Reserved.</h6>
      </div>
    </footer>
    
    <!-- 모달 -->
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog terms-modal-wrap">
	    <div class="modal-content terms-modal">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">약관</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        
	        <ul class="nav nav-tabs">
			  <li class="nav-item terms-nav">
			    <a class="nav-link active" data-toggle="tab" href="#qwe">이용약관</a>
			  </li>
			  <li class="nav-item terms-nav">
			    <a class="nav-link" data-toggle="tab" href="#asd">개인정보처리방침</a>
			  </li>
			</ul>
			<div class="tab-content">
			  <div class="tab-pane fade show active" id="qwe">
			    <p>${terms1.content}</p>
			  </div>
			  <div class="tab-pane fade" id="asd">
			    <p>${terms2.content}</p>
			  </div>
			</div>
	        
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>