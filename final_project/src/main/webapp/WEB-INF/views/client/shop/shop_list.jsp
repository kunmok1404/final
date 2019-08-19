<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/category/food_category.jsp"></jsp:include>
    
<script>
	
	$(function(){
		// 목표 : "더보기" 버튼을 누르면 1페이지씩 갱신하여 추가
		var page = 1;  //페이지번호
		var cat_no = $(".shop-list").attr("data-cat"); // 카테고리 번호
		alert("cat_no="+cat_no);
		function load(){
			alert("page="+page);
			request(page++, cat_no);
		}
		
		// 스크롤이 생길만큼 페이지를 불러온다.
		load();
		load();
		
		//스크롤 관련 처리
		var scroll = false;
		$(window).scroll(function(){
			scroll = true;
			var docHeight = $(document).height();
			var winHeight = $(window).height();
			var winTop = $(window).scrollTop();
			var fix = 10; // 보정치
			
			// 문서 높이에서 보정치만큼 줄인뒤, 그 이상이면 마지막으로 간주
			var bottom = docHeight-fix <= winHeight + winTop;
			
			// 마지막이면 불러오세요.
			if(bottom){
				scroll = false; //스크롤 초기화
				load();
			}
	})
	
	// 함수 구현 : /part로 비동기 통신을 보내는 함수
	function request(page, cat_no){
		$.ajax({
			url:"${pageContext.request.contextPath}/shop/part",
			data : {
				page : page,
				cat_no : cat_no
			},
			success:function(response){
				$(".shop-list").append(response);
			}
		})
	}
})
</script>

    <!--매장목록전체-->
    <div class="shop">
      <!--필터영역-->
      <div class="border border-bottom filter-wrap">
        <div class="container filter">
          <div class="offset-1 col-md-10">
            <span class="shop-number">음식점 00곳을 찾았습니다.</span>
            <span class="shop-filter">
              <span class="dropdown">
                <a class="btn btn-default dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  조건 검색
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                  <a class="dropdown-item" href="#">기본정렬순</a>
                  <a class="dropdown-item" href="#">별점순</a>
                  <a class="dropdown-item" href="#">리뷰 많은순</a>
                  <a class="dropdown-item" href="#">최소주문금액순</a>
                  <a class="dropdown-item" href="#">배달시간순</a>
                </div>
              </span>
            </span>
          </div>
        </div>
      </div>
      <div class="container">
        <!--매장목록-->
        <ul class="shop-list" data-cat="${cat_no}">
          
        </ul>
      </div>
    </div>
    
    
    
    
<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>