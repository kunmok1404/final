<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/client/info_top_menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/my_info_left.jsp"></jsp:include>

<script>
	$(function(){
		
		$("input[name=images]").change(function(e){
            //e에 포함된 이미지를 불러와서 설정

            //input[type=file]만 files 항목이 있으므로
            //파일이 있으면 실행하도록 조건을 구현
            
            if(this.files && this.files[0]){
            	for(var i = 0; i < this.files.length ; i++){
                //읽기 도구 생성
                var reader = new FileReader();
                
                //읽기 완료시 할 작업을 예약 설정
                reader.onload = function(data){//data : 파일 정보
                    var img = $("<img/>").attr("src", data.target.result);
                	$("#choice-img").append(img);
                };
                	reader.readAsDataURL(this.files[i]);
           	  }
            }
           })
		
		// tiny 에디터
		tinymce.init({
	      selector: '#mytextarea'
	    });
		
// 		$("#review_write").click(function(){
// 			var result = alert("후기를 등록하시겠습니까?");
// 			$("#review_write").submit();
// 		})
	})
</script>

   <!--리뷰 작성 시작-->
    <div class="wrapper">

      <div class="row">
        <div class="col-md-12 myInfo-title">
          <div id="myInfo-wrapper">
            <div class="myInfo-line"></div>
          </div>
          <span>후기 작성</span>
        </div>
      </div><hr class="review-top">

      <div class="row">
        <div class="col-md-12">
          <form action="${pageContext.request.contextPath}/review/write" method="post" enctype="multipart/form-data">
          <input type="hidden" name="order_code" value="${order_code}">
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
                  <input type="number" name="score" class="form-control" required>
                </td>
              </tr>
              <tr>
                <td class="review-text">제&nbsp목</td>
                <td class="review-content">
                  <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" required>
                </td>
              </tr>
              <tr>
                <td class="review-title">내&nbsp용</td>
                <td class="review-content">
                  <textarea id="mytextarea" name="content" rows="15" class="form-control" placeholder="내용을 입력하세요."></textarea>
                </td>
              </tr>
              <tr>
                <td class="review-title" rowspan="2">사진&nbsp첨부</td>
                <td class="review-content">
                  <input type="file" name="images" multiple>
                </td>
              </tr>
              <tr>
   				<td id="choice-img"></td>
   			  </tr>
            </tbody>
          </table>
          <div class="text-center">
          	<input id="review_write" type="submit" class="btn btn-success" value="등록하기">
          	<a href="${pageContext.request.contextPath}/member/info_order_list" class="btn btn-info">목록</a>
          </div>
          </form>
        </div>
      </div>

    </div>
    <!--리뷰작성 끝-->