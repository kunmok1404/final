<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/admin/shop/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/shop/left/left_review.jsp"></jsp:include>

<script>
	$(function(){
		var options = {
				toolbar:[
					{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
					'/',
					{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
					{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
				]
			};
		CKEDITOR.replace( 'review_content', options);
		
		// 답변저장 클릭시s
		$("form[name=replyForm]").submit(function(e){
			e.preventDefault();
			var result = confirm("저장하시겠습니까?");
			
			if(result){
				var desc = CKEDITOR.instances['review_content'].getData();
				$("textarea[name=review_content]").val(desc);
				var queryString = $("form[name=replyForm]").serialize();
				
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/super_admin/review/reply",
					data : queryString,
					success : function(data){
						alert("저장이 완료되었습니다.");
// 						CKEDITOR.instances['review_content'].setData(data);
						$("textarea[name=review_content]").val(data);
					}
					
				});
			}
			
		})
	})
</script>

   <!--리뷰 상세화면 시작-->
    <div class="wrapper">

      <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>리뷰상세화면</span>
      </div>

      <div class="row mt-3">
        <div class="col-md-12">
          <table class="table table-hamburg">
            <tbody>
              <tr>
                <td class="review-title">매&nbsp장</td>
                <td class="review-content">
                  <img src="https://placeimg.com/100/100/any">
                  <span>${shopDto.shop_name}</span>
                </td>
              </tr>
              <tr>
                <td class="review-title">메&nbsp뉴</td>
                <td class="review-content">
                  <table class="table table-borderless">
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
                <td class="review-text">별&nbsp점</td>
                <td class="review-content">
                  <span>${reviewDto.score}</span>
                </td>
              </tr>
              <tr>
                <td class="review-text">조회수</td>
                <td class="review-content">
                  <span>${reviewDto.read}</span>
                </td>
              </tr>
              <tr>
                <td class="review-text">작성일</td>
                <td class="review-content">
                  <span>${reviewDto.regist_date}</span>
                </td>
              </tr>
              <tr>
                <td class="review-text">제&nbsp목</td>
                <td class="review-content">
                  	<span>${reviewDto.title}</span>
                </td>
              </tr>
              <tr>
                <td class="review-title">내&nbsp용</td>
                <td class="review-content pl-4">
					<div>
						${reviewDto.content}
						<c:forEach var="imgDto" items="${img_list}">
	                	<c:if test="${imgDto.files_no > 0}">
						<img class="review-img" src="${pageContext.request.contextPath}/review/review_img?files_code=${imgDto.files_no}">
	                	</c:if>
	                	</c:forEach>
					</div>
                </td>
              </tr>
            </tbody>
          </table>
          
           <!-- 답변영역 -->
           <form name="replyForm">
           <input type="hidden" name="review_code" value="${reviewDto.no}">
          <table class="table table-hamburg">
          	<tbody>
              <tr>
              	<td class="review-title table-warning">답&nbsp변</td>
                <td>
					<textarea rows="15" name="review_content" class="form-control" placeholder="약관내용을 입력하세요.">${reviewDto.reply_content}</textarea>
                </td>
              </tr>
          	</tbody>
          </table>
          <div class="text-center">
<%--           	<a href="${pageContext.request.contextPath}/super_admin/review/reply?review_code=${reviewDto.no}" class="btn btn-danger">답변저장</a> --%>
          	<input type="submit" class="btn btn-danger save-reply" value="답변저장">
          	<a href="${pageContext.request.contextPath}/super_admin/review/list" class="btn btn-info">목록</a>
          </div>
          </form>
        </div>
      </div>

    </div>
    <!--리뷰상세화면 끝-->