<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(function(){
	$("#check").click(function(){
		var IMP = window.IMP;

		IMP.init('imp47420056');

		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${item_name}',
		    amount : '${total_price}',
		    buyer_email : '${memberDto.email}',
		    buyer_name : '${memberDto.name}',
		    buyer_tel : '${memberDto.phone}',
		    buyer_addr : '${memberDto.detail_addr}',
		    buyer_postcode : '${memberDto.post}',
		    m_redirect_url : 'http://localhost:8082/spring/order/success'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	});
});

</script>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<button id="check" type="button">버튼</button>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>