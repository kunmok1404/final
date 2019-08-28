<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_basic.jsp"></jsp:include>

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

		CKEDITOR.replace( 'terms_content1', options);
		CKEDITOR.replace( 'terms_content2', options);
		
		// 이용약관 저장버튼 클릭시
// 		$(".save-btn1").click(function(e){
// 			e.preventDefault();
// 			var result = confirm("저장하시겠습니까?");
// 			if(result){
// 				$(".save-btn1").submit();
// 			}
// 		})
	})
</script>

	<div class="wrapper mt-3">
	  <div class="top-title">
		<div id="terms-wrapper">
          <div class="terms-line"></div>
       </div>
	   <span>약관관리</span>
     </div>
     
	  <!-- 약관 탭 -->
	  <div class="terms-content ">
	  
	  <ul class="nav nav-tabs mt-3">
		  <li class="nav-item">
		    <a class="nav-link active" id="first-terms" data-toggle="tab" href="#home">이용약관</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#menu1">개인정보처리방침</a>
		  </li>
		</ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="home" class="container tab-pane active"><br>
	      <form action="update1" method="post">
		  	<table class="table table-borderless">
		  		<tbody>
		  			<tr>
		  				<td class="terms-title">이용약관</td>
		  				<td>
		  					<textarea rows="15" name="terms_content1" class="form-control" placeholder="약관내용을 입력하세요.">${terms1.content}</textarea>
		  				</td>
		  			</tr>
		  		</tbody>
		  	</table>
		  	<div class="save-btn">
		  		<input type="submit" value="저장" class="btn btn-info save-btn1">
		  	</div>
		  	</form>
	    </div>
	    <div id="menu1" class="container tab-pane fade"><br>
			<form action="update2" method="post">
		  	<table class="table table-borderless">
		  		<tbody>
		  			<tr>
		  				<td class="terms-title">개인정보<br>처리방침</td>
		  				<td>
		  					<textarea rows="15" name="terms_content2" class="form-control" placeholder="약관내용을 입력하세요.">${terms2.content}</textarea>
		  				</td>
		  			</tr>
		  		</tbody>
		  	</table>
		  	<div class="save-btn">
		  		<input type="submit" value="저장" class="btn btn-info save-btn1">
		  	</div>
		  	</form>
	    </div>
	  </div>
	</div>
	</div>
<!-- 여기까지 -->







<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>