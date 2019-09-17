<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
$(function(){
    $(".pay_active").click(function(){
       $(".pay_active").removeClass("btn btn-primary");
       $(this).addClass("btn btn-primary");
    })
 })

//카드 결제시 수정되는 값
function change_pay_c(){
	$(".button").attr("id","order").attr('disabled', false);
	document.querySelector("form").action='credit_order';
	document.querySelector(".pay_method").value='credit';
}
//현금 결제시 수정되는 값
function change_pay_m(){
	$(".button").attr("id","order").attr('disabled', false);
	document.querySelector("form").action='credit_order';
	document.querySelector(".pay_method").value='money';
}
//카카오페이 결제시 변경되는 값
function change_pay_kakao(){
	$(".button").attr("id","kakao").attr('disabled', false);
	document.querySelector("form").action='kakao';
	document.querySelector(".pay_method").value='kakao_pay';

}
function change_pay_credit(){
	$(".button").attr("id","online_credit").attr('disabled', false);
	document.querySelector("form").action='online_credit';
	document.querySelector(".pay_method").value='card';
	
}

$(function(){
	$("#allCheck").click(function(){
		if($("#allCheck").prop("checked")){
			$(".check").prop("checked",true);
		}
		else{
			$(".check").prop("checked",false);
		}
	});	
	$("form").submit(function(e){
		var result = $("#allCheck").prop("checked");
		var result2 = $("#okcheck").prop("checked");
		if(result){
			if(result2){
				alert("결제를 시작합니다");
			}else{
				e.preventDefault();
				alert("개인정보 수집 및 이용동의를 읽은 후 주문해주세요");	
			}
		}
		else{
			e.preventDefault();
			alert("상품을 전부 선택 후 주문해주세요");					
		}
	});
	
	$("#chec").click(function(){
		$("#okcheck").prop("checked",true);
	});
	
	
	$(".button").click(function(e){
		var total = $(".final").val();
		var check = $(".button").attr("id");
		e.preventDefault();
		if(check == "kakao"){
			console.log(check);
			$('form').submit();
		}
		else if(check=="order"){
			$('form').submit();
		}
		else{
			var IMP = window.IMP;
			console.log(total);
			IMP.init('imp47420056');

			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '치킨',
			    amount : total,
			    buyer_email : '${memberDto.email}',
			    buyer_name : '${memberDto.id}',
			    buyer_tel : '${memberDto.phone}',
			    buyer_addr : '${memberDto.detail_addr}',
			    buyer_postcode : '${memberDto.post}',
			    m_redirect_url : 'http://localhost:8082/spring/order/card_success'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        $(location).attr("href", "card_success");
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
				})
		}
		
	})

	var total_price = 0;
	var menu_price = 0;
	var sub_price = 0;
	
	//개별 메인메뉴 가격
	$(".ta").each(function(){
		var menu_pri = parseInt($(this).find(".mp2").val());
		var price = 0;
		$(this).find(".sub_price").each(function(){
			price += parseInt($(this).val());
		})
		$(this).find(".pr").text(menu_pri+price);
	});
	
		
	$(".mp2").each(function(){
		menu_price += parseInt(this.value);
	});
	
	$(".sub_price").each(function(){
		 sub_price += parseInt(this.value);
	});

	$(".total").text(menu_price+sub_price);
	$("#total_price").val(menu_price+sub_price);

});
	$(function(){
			var price = parseInt($(".final_price").text());
		$("#usepoint").click(function(){
			var point = $("input[name=point]").val();
			var mypoint = parseInt($(".mypoint").text());
			if(point>mypoint){
				alert("남은 포인트보다 많이 쓰실수 없습니다");
				$("input[name=point]").val(0);
			}else{				
			$(".discount_price").text(point);
			$(".discount_price").val(point);
			$(".final_price").text(price-point+"원");
			$(".final").val(price-point);
			$(".coandpo").val(1);
			$("#po").attr("disabled",true);
			$("#co").attr("disabled",true);
			}
		});
		
		$("#couponset").click(function(){
			var price = parseInt($(".final_price").text());
			var discount = parseInt($("#discou").val());
			var max = parseInt($("#dismax").val());
			var mycou = parseInt($("#mycou").text());
			if(price>max){
				$(".discount_price").text(price*(discount/100));
				$(".discount_price").val(price*(discount/100));
				$(".final_price").text(price-(price*(discount/100))+"원");
				$(".final").val(price-(price*(discount/100)));
				$("#mycou").text(mycou-1);
				$("#po").attr("disabled",true);
				$("#co").attr("disabled",true);
			}
			else{
				alert("총 값이 쿠폰의 사용가능액 보다 낮습니다");			
			}
		})
	});

	$(function(){
		$(".pay_active").click(function(){
			$(".pay_active").removeClass("btn btn-primary");
			$(this).addClass("btn btn-primary");
		})
	})


//신용카드 결제시 변경되는 값

</script>
<style>
 .modal > .wrapper{
 	background-color: white;
 }

</style>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<div class="container">
<div align="center">
	<h2>주문서</h2>
</div>
<div align="left">
	<h3>배달정보</h3>
</div>
<hr>
<form id="form" action="kakao" method="post">
<input type="hidden" id="item_name" name="item_name" value="${shopDto.company_name}">
<input type="hidden" id="amount" name="total_amount" value="${total_price + shopDto.delivery_price}">
<input type="hidden" id="partner" name="partner_user_id" value="${shopDto.company_name}">	
	<div class="panel-body">
		<label for="address">
			<h3>주소</h3>
		</label>
		<button type="button">새 주소</button>
		<div>
			<input type="text" readonly="readonly" value="${memberDto.post}" disabled><br>
			<input type="text" readonly="readonly" value="${memberDto.basic_addr}" disabled><br>
			<input type="text" placeholder="상세 주소" value="${memberDto.detail_addr}">
		</div>
		<div>
			<label for="phone">
				<h3>연락처</h3>
			</label> <input type="text" placeholder="전화번호를 입력해주세요." value="${memberDto.phone}">
		</div>
	</div>
	<hr>
	<div>
		<label for="request">
			요청 사항
		</label>
		<textarea name="request" rows="3" maxlength="100" cols="50"
			placeholder="주문시 요청사항이 있으시면 남겨주세요" class="request"></textarea>
	</div>
	<hr>
	<div align="left">
		<h2>주문정보</h2>
	</div>
	<hr>
	<div class="container">
		<div class="offset-md-2 col-md-8">
			<table style="border-style: solid">
				<thead>
					<tr>
						<td><img src="http://placehold.it/80x80"></td>
						<td>
							<table class="table">
								<tr>
									<td>${shopDto.company_name}</td>
								</tr>
								<tr>
									<td>평점</td>
									<td>리뷰갯수</td>
								</tr>
								<tr>
									<td>배달비: ${shopDto.delivery_price}</td>
								</tr>
							</table>
						</td>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<hr>
	<div>
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="allCheck"></th>
					<th>전체선택</th>
					<th>메뉴</th>
					<th>수량</th>
					<th>상품금액</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="cart" items="${cartList}" varStatus="status1">
				<tr class="ta">
					<td><input type="checkbox" class="check"></td>
					<td>
						<input type="hidden" name="main[${status1.index}].title" value="${cart.title}">
						<input type="hidden" name="main[${status1.index}].menu_name" value="${cart.menu_name}">
						<input type="hidden" name="main[${status1.index}].menu_amount" value="${cart.menu_amount}">
						<input type="hidden" class="mp2" name="main[${status1.index}].menu_price" value="${cart.menu_price}">
					<img src="http://placehold.it/100x100"></td>
					<td>${cart.menu_name}  ${cart.menu_price}원
					<hr>
					필수<br>
							<c:forEach var="cartsub" items="${cart.list}" varStatus="status2">
								<c:if test="${cartsub.sub_type eq '필수'}">
								${cartsub.sub_name} ${cartsub.sub_price}원
								</c:if>
							</c:forEach>
					<br>
					선택<br>
							<c:forEach var="cartsub" items="${cart.list}" varStatus="status">
								<input type="hidden" name="main[${status1.index}].list[${status.index}].no" value="${cartsub.no}">
								<input type="hidden" name="main[${status1.index}].list[${status.index}].sub_type" value="${cartsub.sub_type}">
								<input type="hidden" name="main[${status1.index}].list[${status.index}].sub_title" value="${cartsub.sub_title}">
								<input type="hidden" name="main[${status1.index}].list[${status.index}].sub_name" value="${cartsub.sub_name}">
								<input type="hidden" class="sub_price" name="main[${status1.index}].list[${status.index}].sub_price" value="${cartsub.sub_price*cartsub.sub_amount}">
								<input type="hidden" name="main[${status1.index}].list[${status.index}].sub_amount" value="${cartsub.sub_amount}">
							</c:forEach>
							<c:forEach var="cartsub" items="${cart.list}" varStatus="status2">
								<c:if test="${cartsub.sub_type eq '선택'}">
								${cartsub.sub_name} ${cartsub.sub_price}원
								<br>
								</c:if>
							</c:forEach>
						<hr>
					</td>
					<td>${cart.menu_amount}</td>
					<td><span class="pr"></span>원</td>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">최소 주문금액:${shopDto.min_price}원 이상</td>
					<td>합계:<span class="total"></span>원</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<hr>
	<div align="left">
		<h3>결제 정보</h3>
	</div>
	<hr>
	<div>
		<table>
			<thead>
				<tr>
					<th>합계</th>
					<th>배송비</th>
					<th>할인금액</th>
					<th>최종결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><span class="total"></span>원</td>
					<td>${shopDto.delivery_price}원</td>
					<td><span class="discount_price">0</span>원<input type="hidden" class="discount_price" name="discount_price" value="0"></td>
					<td class="final_price">${total_price + shopDto.delivery_price}원</td>
				</tr>
			</tbody>
				<input type="hidden" class="final" name="total-price" value="${total_price + shopDto.delivery_price}">
				<input type="hidden" class="coandpo" name="coandpo" value="0">
			<tfoot>
				<tr>
					<th>쿠폰</th>
					<th><font color="red"><span id="mycou">${coupon}</span></font>장보유</th>
					<th><button type="button" class="btn btn-sm btn-info" id="po" data-toggle="modal" data-target="#coup" data-no="${memberDto.no}">사용하기</button></th>
				</tr>
				<tr>
					<th>포인트</th>
					<th><font color="blue">${point}</font>원사용가능</th>
					<th><button type="button" class="btn btn-sm btn-info" id="co" data-toggle="modal" data-target="#apply" data-no="${memberDto.no}">사용하기</button></th>
				</tr>
			</tfoot>
		</table>
	</div>
	<hr>
	<!-- 토글로 이미지 변경하여 표시 -->
	<input type="hidden" class="pay_method" name="pay_method" value="pay">
	<h3>현장결제</h3>
	<button type="button" class="pay_active" id="credit" onclick="change_pay_c();">신용카드</button>
	<button type="button" class="pay_active" id="money" onclick="change_pay_m();">현금</button>
	<br>
	<h3>미리 결제</h3>
	<button type="button" class="pay_active" id="kakaopay" onclick="change_pay_kakao();">카카오페이</button>
	<button type="button" class="pay_active" id="credit_card" onclick="change_pay_credit();">신용카드</button>
	<hr>
	<div>
		<input type="checkbox" id="okcheck" disabled>
		<h4>개인정보 수집 및 이용동의(필수)</h4>
		<a href="#" id="chec">(내용보기)</a>
	</div>
	<br>
	<br> <button type="button" class="button" id="check" disabled="">주문완료</button>
</form>
</div>

	<!-- 포인트 모달 시작-->
    <div class="modal" id="apply">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h4 class="modal-title">포인트 사용</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                        <tr class="text-center">
                            <td class="table-secondary">보유 포인트 금액:<span class="mypoint">${point}</span></td>
                            <td>
                                <div class="form-group">
                                    <input type="number" name="point" class="form-control" placeholder="금액을 입력하세요."><br>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <button type="button" id="usepoint" class="btn btn-danger" data-dismiss="modal">확인</button>
            </div>
            </div>
         </div>
     </div>
     <!-- 포인트 모달 끝 -->
     <!-- 쿠폰 모달 시작-->
    <div class="modal"  id="coup">
		<div class="wrapper">
      <div class="container">
        <div class="col-md-12 myInfo-title">
          <div id="myInfo-wrapper">
            <div class="myInfo-line"></div>
          </div>
          <span>나의 쿠폰</span>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-md-12">
          <table class="table table-hamburg text-center myInfo-table">
            <thead>
              <tr class="">
                <td style="width: 30%">쿠폰명</td>
                <td style="width: 20%">조건</td>
                <td style="width: 20%">사용기한</td>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="couponDto" items="${coupon_list}">
              <tr>
                <td><button data-dismiss="modal" class="btn btn-sm btn-info" type="button" id="couponset" value="${couponDto.no}">${couponDto.name}</button>
                <input type="hidden" id="discou" value="${couponDto.discount_price}">
                <input type="hidden" id="dismax" value="${couponDto.max_price}"></td>
                <c:choose>
                	<c:when test="${couponDto.discount_type eq '할인금액'}">
                	<td style="color:blue;">전&nbsp메뉴&nbsp${couponDto.discount_price}원&nbsp할인
                	</td>
                	</c:when>
                	<c:otherwise>
                	<td style="color:blue;">
                		전&nbsp메뉴&nbsp${couponDto.discount_price}%&nbsp할인(최대${couponDto.max_price}원)
                	</td>
                	</c:otherwise>
                </c:choose>
                <td>${couponDto.start_date}<br>~&nbsp${couponDto.finish_date}</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
     </div>
     <!-- 포인트 모달 끝 -->
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>