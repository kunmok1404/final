<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_basic.jsp"></jsp:include>

<script>
	$(function(){
		$("input[name=category_img]").change(function(e){
			var $this = $(this);
			console.log($this);
            
            if(this.files && this.files[0]){
                //읽기 도구 생성
                var reader = new FileReader();
                
                //읽기 완료시 할 작업을 예약 설정
                reader.onload = function(data){//data : 파일 정보
                    var img = $("<img/>").attr("src", data.target.result);
                    $this.parent().next().append(img);
                };
                	reader.readAsDataURL(this.files[0]);
            }
           })
				
		//프로그램 시작시 템플릿 백업 후 삭제
		var template = $(".template").clone();
		$(".template").remove();
		
		$(".add").click(function(){
			//신규 추가하는 버튼에 적용할 이벤트
			var new_template = template.clone();
			new_template.find(".del").click(function(){
				$(this).parents("tr").remove();
			});
			$(".input").last().append(new_template);
			
			$("input[name=category_img]").change(function(e){
				var $this = $(this);
				console.log($this);
	            
	            if(this.files && this.files[0]){
	                //읽기 도구 생성
	                var reader = new FileReader();
	                
	                //읽기 완료시 할 작업을 예약 설정
	                reader.onload = function(data){//data : 파일 정보
	                    var img = $("<img/>").attr("src", data.target.result);
	                    $this.parent().next().append(img);
	                };
	                	reader.readAsDataURL(this.files[0]);
	            }
	           })
	           
		})
		
		//처음 표시되는 버튼에 적용할 이벤트
		$(".del").click(function(){
			$(this).parents("tr").remove();
		})
	})
</script>

        <!-- 카테고리 관리 시작 -->
        <div class="wrapper mt-3 food-category-title">
		   <div id="terms-wrapper">
             <div class="terms-line"></div>
	       </div>
	   	   <span>음식카테고리 관리</span>
	   	   	<form action="${pageContext.request.contextPath}/super_admin/basic/food_category" method="post" enctype="multipart/form-data">
            <table class="table table-hamburg table-hover text-center mt-3">
                <thead>
                    <tr class="cat_head table-primary">
                        <td>카테고리명</td>
                        <td>노출순서</td>
                        <td colspan="2">이미지</td>
                    </tr>
                </thead>
                <tbody class="input">
                	<c:forEach var="cat_list" items="${cat_list}" varStatus="status" step="1">
                    <tr>
                        <td><input type="text" name="category[${status.index}].cat_name" value="${cat_list.name}" required></td>
                        <td>
                        	<input type="number" name="category[${status.index}].sort_no" value="${cat_list.sort_seq}" required>
                        	<input type="hidden" name="category[${status.index}].category_code" value="${cat_list.no}" required>
                        	<input type="hidden" name="category[${status.index}].image_code" value="${cat_list.img}" required>
                        </td>
                        <td><input type="file" name="category[${status.index}].category_img"></td>
                        <td class="category-img"><img src="${pageContext.request.contextPath}/review/review_img?files_code=${cat_list.img}"></td>
                        <td><button class="btn_delete btn-block btn-secondary del">-삭제</button></td>
                    </tr>
                    </c:forEach>
                    <!-- 템플릿 -->
					<tr class="template">
                        <td><input type="text" name="cat_name" required></td>
                        <td>
                        	<input type="text" name="sort_no" required>
                        	<input type="hidden" name="category_code" required>
                        </td>
                        <td><input type="file" name="category_img" required>
                        <td class="category-img" width=100px;></td>
                        <td><button class="btn_delete btn-block btn-secondary del">-삭제</button></td>
                    </tr>
                </tbody>
                <tfoot>
                	<tr>
                        <td colspan="3"><button class="btn btn-primary add">+추가</button></td>
                        <td><button class="btn btn-info btn-block submit">등록</button></td>
                    </tr>
                </tfoot>
            </table>
            </form>
        </div>
        <!-- 카테고리 관리 끝 -->
</body>
</html>