<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_basic.jsp"></jsp:include>

<script>
	$(function(){
		$("input[type=file]").change(function(e){
			var $this = $(this);
            
            if(this.files && this.files[0]){
                //읽기 도구 생성
                var reader = new FileReader();
                
                //읽기 완료시 할 작업을 예약 설정
                reader.onload = function(data){//data : 파일 정보
                    var img = $("<img/>").attr("src", data.target.result);
                    $this.parent().next().empty();
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
		// 숫자넣기
		var new_template = template.clone();
		
		var length = $("#food-table tr").length - 2;
		// 네임 설정
		new_template.find(".cat_name").attr("name",'category['+length+'].cat_name');
		new_template.find(".sort_no").attr("name",'category['+length+'].sort_no');
		new_template.find(".category_img").attr("name",'category['+length+'].category_img');
		$(".input").last().append(new_template);
		
		new_template.find("input[type=file]").change(function(e){
			var $this = $(this);
            
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
		
       	// 삭제버튼 클릭시
// 		new_template.find(".del").click(function(){
// 			$(this).parents("tr").remove();
// 		});
		})
		
		$(".btn_delete").click(function(){
   			$(this).closest("tr").remove();
   		})
		//처음 표시되는 버튼에 적용할 이벤트
// 		$(".del").click(function(){
// 			$(this).parents("tr").remove();
// 		})

		
	})
	
	//순서 보정
	function changeIndex(condition, value){
		//5 이상만 value를 증가
		$(".table").find("tbody").find("tr").each(function(){			
			var index = parseInt($(this).find("input").eq(1).val()) - 1;
			var newIndex = index + value;//이 숫자가 변경시킬 값
			
			if(condition - 1 <= index){
//	 			console.log(index, newIndex);
				var cat_name = $(this).find("input").eq(0);
				var sort_no = $(this).find("input").eq(1);
				var category_code = $(this).find("input").eq(2);
				var category_img = $(this).find("input").eq(3);
				
				cat_name.attr("name", "category["+newIndex+"].cat_name");
				sort_no.attr("name", "category["+newIndex+"].sort_no");
				sort_no.val(newIndex + 1);
				category_code.attr("name", "category["+newIndex+"].category_code");
				category_img.attr("name", "category["+newIndex+"].category_img");
				
//	 			console.log(sort_no.get(0));
			}
		});
	}
</script>
 
        <!-- 카테고리 관리 시작 -->
        <div class="wrapper mt-3 food-category-title">
		   <div id="terms-wrapper">
             <div class="terms-line"></div>
	       </div>
	   	   <span class="header-title">음식카테고리 관리</span>
	   	   	<form action="${pageContext.request.contextPath}/super_admin/basic/food_category" method="post" enctype="multipart/form-data">
            <table class="table table-hamburg table-hover text-center mt-3" id="food-table">
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
                        </td>
                        <td><input type="file" name="category[${status.index}].category_img"></td>
                        <td class="category-img"><img src="${pageContext.request.contextPath}/review/review_img?files_code=${cat_list.img}"></td>
                        <td><button class="btn_delete btn-block btn-secondary del">-삭제</button></td>
                    </tr>
                    </c:forEach>
                    <!-- 템플릿 -->
					<tr class="template">
                        <td><input type="text" class="cat_name" required></td>
                        <td>
                        	<input type="text" class="sort_no" required>
                        </td>
                        <td><input type="file" class="category_img">
                        <td class="category-img" width=100px;></td>
                        <td><button class="btn_delete btn-block btn-secondary del">-삭제</button></td>
                    </tr>
                </tbody>
                <tfoot>
                	<tr>
                        <td colspan="3"><button class="btn btn-primary add">+추가</button></td>
                        <td><input class="btn btn-info btn-block " type="submit" value="등록"></td>
                    </tr>
                </tfoot>
            </table>
            </form>
        </div>
        <!-- 카테고리 관리 끝 -->
</body>
</html>