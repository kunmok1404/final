<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_service.jsp"></jsp:include>

<script>
	$(function(){
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
		$(".input").last().append(new_template);
		
       	// 삭제버튼 클릭시
		new_template.find(".del").click(function(){
			$(this).parents("tr").remove();
		});
	           
		})
		
	})
</script>

        <!-- 카테고리 관리 시작 -->
        <div class="wrapper mt-3 food-category-title">
		   <div id="terms-wrapper">
             <div class="terms-line"></div>
	       </div>
	   	   <span class="font-weight-bold" style="font-size:1.2rem;">자주하는질문 카테고리</span>
	   	   	<form action="${pageContext.request.contextPath}/super_admin/qna/category" method="post">
            <table class="table table-hamburg table-hover text-center mt-3" id="food-table">
                <thead>
                    <tr class="cat_head table-primary">
                        <td>카테고리명</td>
                        <td>노출순서</td>
                        <td>편집</td>
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
                        <td><button class="btn_delete btn-block btn-secondary del">-삭제</button></td>
                    </tr>
                    </c:forEach>
                    <!-- 템플릿 -->
					<tr class="template">
                        <td><input type="text" class="cat_name" required></td>
                        <td>
                        	<input type="text" class="sort_no" required>
                        </td>
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