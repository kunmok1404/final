<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_review.jsp"></jsp:include>

<script>
// 	$(function(){
// 		var options = {
// 				toolbar:[
// 					{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
// 					'/',
// 					{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
// 					{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
// 				]
// 			};
// 		CKEDITOR.replace( 'review_content', options);
		
// 		// 답변저장 클릭시s
// 		$("form[name=replyForm]").submit(function(e){
// 			e.preventDefault();
// 			var result = confirm("저장하시겠습니까?");
			
// 			if(result){
// 				var desc = CKEDITOR.instances['review_content'].getData();
// 				$("textarea[name=review_content]").val(desc);
// 				var queryString = $("form[name=replyForm]").serialize();
				
// 				$.ajax({
// 					type : "post",
// 					url : "${pageContext.request.contextPath}/super_admin/review/reply",
// 					data : queryString,
// 					success : function(data){
// 						alert("저장이 완료되었습니다.");
// // 						CKEDITOR.instances['review_content'].setData(data);
// 						$("textarea[name=review_content]").val(data);
// 					}
					
// 				});
// 			}
			
// 		})
// 	})
</script>

<div class="container">
	<h2>주문 정보</h2>
	<div class="offset-md-2 col-md-8">
		<table class="table table-hambuger">
			<thead>
				<tr>
					<th>주문정보</th>
					<th colspan="3">정보찍히는란</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>주문 메뉴</td>
					<td colspan="3">메뉴 상세 찍히는 테이블
					<br>
					<br>
					<br>
					<br>
					</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td>배송비찍히는란</td>
					<td>결제금액</td>
					<td>결제금액 찍히는란</td>
				</tr>
				<tr>
					<td>할인금액</td>
					<td>할인금액 찍히는란[글자 빨강]</td>
					<td>총 결제 금액</td>
					<td>결제금액-결제금액</td>
				</tr>
				<tr>
					<td>결제방법</td>
					<td>결제방법 찍히는 란</td>
					<td>주문상태</td>
					<td>주문상태 찍히는 란</td>
				</tr>
			</tbody>
		</table>
	</div>
		<h2>주문자 정보</h2>
	<div class="offset-md-2 col-md-8">
		<table class="table table-hambuger">
			<tr>
				<td>주문자</td>
				<td  colspan="10%">주문자 이름 찍히는곳</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>주소 찍히는곳</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>전화번호 찍히는곳</td>
			</tr>
			<tr>
				<td>요청사항</td>
				<td>리퀘스트 찍히는곳</td>
			</tr>
		</table>
	</div>
	<button>닫 기</button>
</div>