<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_menu.jsp"></jsp:include>

<script>
	$(function(){
		
		// 이미지 미리보기
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
		var radio_template = $(".radio_template").clone();
		$(".radio_template").remove();
		var check_template = $(".check_template").clone();
		$(".check_template").remove();
		
		// 필수선택 추가버튼 클릭시
		$(".add_radio").click(function(){
			var new_radio = radio_template.clone();
			var length = $(".radio-table tr").length-3;
			// 네임 설정
			new_radio.find(".radio_name").attr("name",'radioMenuList['+length+'].radio_name');
			new_radio.find(".radio_price").attr("name",'radioMenuList['+length+'].radio_price');
			$(this).closest("tfoot").prepend(new_radio);
			
			// 삭제버튼 클릭시
			new_radio.find(".del").click(function(){
				$(this).closest("tr").remove();
			});
		})
		
		// 추가선택 추가버튼 클릭시
		$(".add_check").click(function(){
			var new_check = check_template.clone();
			var length = $(".check-table tr").length-3;
			// 네임 설정
			new_check.find(".check_name").attr("name",'checkMenuList['+length+'].check_name');
			new_check.find(".check_price").attr("name",'checkMenuList['+length+'].check_price');
			$(this).closest("tfoot").prepend(new_check);
			// 삭제버튼 클릭시
			new_check.find(".del").click(function(){
				$(this).closest("tr").remove();
			});
		})
		
		// 수정버튼 클릭시
		$(".edit-btn").click(function(e){
			e.preventDefault();
			var result = confirm("수정하시겠습니까?");
			if(result){
				$(".edit-form").submit();
			}
		})
		
	})
</script>

	<div class="wrapper mt-3">
	<!--메뉴기본정보 -->
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>메뉴기본정보</span>
      </div>
      
      <form action="${pageContext.request.contextPath}/super_admin/menu/update" class="edit-form" method="post" enctype="multipart/form-data">
      <input type="hidden" name="shop_code" value="${menuDto.shop_code}">
      <table class="table table-hamburg mt-3 menu-regist-table">
      	<tbody>
      		<tr>
      			<td class="table-secondary text-center" width="20%"><span>음식&nbsp카테고리</span></td>
      			<td class="text-left">
      				<span class="text-left pl-2">
      					<select name="food_category" class="form-control" required>
	  						<option>선택</option>
	  						<c:forEach var="category" items="${food_category}">
	  							<option ${category.name eq menuDetailVO.food_cat?'selected':''}>${category.name}</option>
	  						</c:forEach>
	  					</select>
      				</span>
      			</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center"><span>메뉴&nbsp카테고리</span></td>
      			<td class="text-left">
      				<span class="text-left pl-2">
      					<select name="menu_category" class="form-control" required>
	  						<option>선택</option>
	  						<c:forEach var="category" items="${menu_category}">
	  							<option ${category.name eq menuDetailVO.menu_cat?'selected':''}>${category.name}</option>
	  						</c:forEach>
	  					</select>
      				</span>
      			</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center">매장코드</td>
      			<td class="text-left">
      				${menuDto.shop_code}
   				</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center">메뉴명</td>
      			<td class="text-left">
      				<input type="text" name="menu_name" value="${menuDetailVO.menu_name}" class="form-control" placeholder="메뉴명을 입력하세요." required>
   					<input type="hidden" name="menu_code" value="${menu_code}">
   				</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center">판매&nbsp가격</td>
      			<td class="text-left"><input type="number" name="menu_price" value="${menuDetailVO.menu_price}" class="form-control" min="1" placeholder="가격을 입력하세요." required></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center">메뉴&nbsp코드</td>
      			<td class="text-left">${menuDto.no}</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center">등록일</td>
      			<td class="text-left">${menuDto.regist_date}</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center">수정일</td>
      			<td class="text-left">${menuDto.edit_date}</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center">승인상태</td>
      			<td class="text-left">
      				<span class="text-left pl-2">
      					<select name="apply_status" class="form-control" required>
	  						<option>선택</option>
	  						<option ${menuDto.apply_status eq '승인완료'?'selected':''}>승인완료</option>
	  						<option ${menuDto.apply_status eq '승인대기'?'selected':''}>승인대기</option>
	  					</select>
      				</span>
      			</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center">판매상태</td>
      			<td class="text-left">
      				<span class="text-left pl-2">
      					<select name="sale_status" class="form-control" required>
	  						<option>선택</option>
	  						<option ${menuDto.sale_status eq '판매중'?'selected':''}>판매중</option>
	  						<option ${menuDto.sale_status eq '판매중지'?'selected':''}>판매중지</option>
	  					</select>
      				</span>
      			</td>
      		</tr>
      	</tbody>
      </table>
      
      <!-- 메뉴 이미지 정보 -->
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>메뉴&nbsp이미지정보</span>
      </div>
	  
	  <table class="table table-hamburg mt-3 menu-regist-table">
	  	<tbody>
	  		<tr>
      			<td class="table-secondary text-center" width="20%">메뉴&nbsp목록이미지</td>
      			<td class="text-left">
      				<input type="file" name="menu_list_img" class="form-control">
      				<img class="menu-img" src="${pageContext.request.contextPath}/review/review_img?files_code=${menuDetailVO.basic_img}">
      			</td>
      			<td class="category-img" width=100px;></td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center" width="20%">메뉴&nbsp상세이미지</td>
      			<td class="text-left">
      				<input type="file" name="menu_detail_img" class="form-control">
      				<img class="menu-img" src="${pageContext.request.contextPath}/review/review_img?files_code=${menuDetailVO.detail_img}">
      			</td>
      			<td class="category-img" width=100px;></td>
      		</tr>
	  	</tbody>
	  </table>
	  
	  <!-- 추가메뉴 정보 -->
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
        </div>
	    <span>추가&nbsp메뉴정보</span>
      </div>
	  
	  <table class="table table-hamburg mt-3 menu-regist-table">
	  	<tbody>
	  		<tr>
      			<td class="table-secondary text-center" width="20%">필수&nbsp선택</td>
      			<td class="text-left">
      				<table class="table table-borderless radio-table">
      					<tbody>
      						<tr>
      							<td colspan="2">
      								<input type="text" name="radio_title" value="${sub_title.radio_title}" class="form-control" placeholder="Ex)소스선택(필수)">
      							</td>
      						</tr>
      						<tr class="table-primary text-center">
      							<td width="50%">필수메뉴명</td>
      							<td width="50%">가격</td>
      						</tr>
      						<c:forEach var="list" items="${radio_list}">
      						<tr>
		                        <td><input type="text" value="${list.name}" class="form-control radio_name"></td>
		                        <td>
		                        	<input type="number" value="${list.price}" class="form-control radio_price" min="1">
		                        </td>
		                        <td><button class="btn_delete btn-block btn-secondary del">-삭제</button></td>
		                    </tr>
		                    </c:forEach>
      						<!-- 필수메뉴 템플릿 -->
							<tr class="radio_template">
		                        <td><input type="text" class="form-control radio_name"></td>
		                        <td>
		                        	<input type="number" class="form-control radio_price" min="1">
		                        </td>
		                        <td><button class="btn_delete btn-block btn-secondary del">-삭제</button></td>
		                    </tr>
			                </tbody>
			                <tfoot>
			                	<tr>
			                        <td><a class="btn btn-primary add_radio text-white">+추가</a></td>
			                    </tr>
			                </tfoot>
      					</tbody>
      				</table>
      			</td>
      		</tr>
      		<tr>
      			<td class="table-secondary text-center" width="20%">자유&nbsp선택</td>
      			<td class="text-left">
      				<table class="table table-borderless check-table">
      					<tbody>
      						<tr>
      							<td colspan="2">
      								<input type="text" name="check_title" value="${sub_title.check_title}" class="form-control" placeholder="Ex)추가메뉴(선택)">
      							</td>
      						</tr>
      						<tr class="table-primary text-center">
      							<td width="50%">추가메뉴명</td>
      							<td width="50%">가격</td>
      						</tr>
      						<c:forEach var="list" items="${check_list}">
      						<tr>
		                        <td><input type="text" value="${list.name}" class="form-control radio_name"></td>
		                        <td>
		                        	<input type="number" value="${list.price}" class="form-control radio_price" min="1">
		                        </td>
		                        <td><button class="btn_delete btn-block btn-secondary del">-삭제</button></td>
		                    </tr>
		                    </c:forEach>
      						<!-- 추가메뉴 템플릿 -->
							<tr class="check_template">
		                        <td><input type="text" class="form-control check_name"></td>
		                        <td>
		                        	<input type="number" class="form-control check_price" min="1">
		                        </td>
		                        <td><button class="btn_delete btn-block btn-secondary del">-삭제</button></td>
		                    </tr>
			                </tbody>
			                <tfoot>
			                	<tr>
			                        <td><a class="btn btn-primary add_check text-white">+추가</a></td>
			                    </tr>
			                </tfoot>
      					</tbody>
      				</table>
      			</td>
      		</tr>
      		<tr class="text-center">
      			<td colspan="4">
      				<input type="submit" width="100px" class="btn btn-primary edit-btn" value="수정">
      				<a href="${pageContext.request.contextPath}/shop_admin/menu/list" class="btn btn-secondary">목록</a>
      			</td>
      		</tr>
	  	</tbody>
	  </table>
	  </form>
	   	      
     </div>
      


<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>