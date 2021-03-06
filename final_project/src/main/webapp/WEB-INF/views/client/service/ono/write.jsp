<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/client/left/service_left.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="jQuery.MultiFile.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/kayClient.css"
	rel="stylesheet">
<%-- <script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script> --%>
<script>
	// 	$(function(){
	// 	    ClassicEditor
	// 	            .create( document.querySelector( 'textarea[name=content]' ) )
	// 	});

	//다중 파일 미리보기 기능
	var sel_files = [];
	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
	});
	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}
	function handleImgFileSelect(e) {
		//이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_wrap").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 jpg, png 파일만 가능합니다. ");
						return;
					}


					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' width=150></a>";
						$(".imgs_wrap").append(html);
						index++;
						if (index > 5) {
							alert("파일은 최대 5장까지만 첨부가능 합니다.");
						}
					}
					reader.readAsDataURL(f);
				});

		
	}
	//다중 파일 중 특정 이미지만 삭제
	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);

		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}
	// 	 $(function(){
	// 		 $("input[name=image]").change(function(e){
	//             //e에 포함된 이미지를 불러와서 설정
	//             console.log(this.files);

	//             //input[type=file]만 files 항목이 있으므로
	//             //파일이 있으면 실행하도록 조건을 구현
	//             if(this.files && this.files[0]){
	//                 //읽기 도구 생성
	//                 var reader = new FileReader();
	//                 //읽기 완료시 할 작업을 예약 설정
	//                 reader.onload = function(data){//data : 파일 정보
	//                     $(".image-preview").attr("src", data.target.result);
	//                     console.log(data);
	//                 };

	//                 //실제로 읽기
	//                 reader.readAsDataURL(this.files[0]);
	//             }
	// 		 });
	// 	 });
</script>

<div class="qna">
	<div class="offset-2 col-8">
		<h4>1:1 문의</h4>
		<div class="empty"></div>
		<form action="write" method="post" enctype="multipart/form-data">
			<!-- 표 -->
			<table class="qna-qna">

				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<thead>
					<tr>
						<th class=notice-th>카테고리</th>
						<th class=notice-th2>
						<select name="category" required>
								<option value="">선택하세요</option>
								<c:forEach var="category_list" items="${category_list}">
									<option value="${category_list.no}">${category_list.name}</option>
								</c:forEach>
						</select></th>
					<tr>
						<th class=notice-th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						<th><textarea name="title" placeholder="제목을 입력하세요" required
								cols="108" rows="2"></textarea></th>
					</tr>
					<tr>
						<th class=notice-th>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
						<th><textarea name="content" placeholder="내용을 입력하세요" required
								cols="108" rows="6"></textarea></th>
					</tr>
					<tr>
						<th class=notice-th rowspan="2">사진첨부</th>
						<th class="input_wrap"><a href="javascript:"
							onclick="fileUploadAction();" class="my_button"></a><input type="file" id="input_imgs" name="images"
							accept=".jpg, .png" multiple	><span>(Jpg, Png파일 최대
								5장까지 첨부가 가능합니다.)</span></th>
							
						<th></th>
					</tr>
					<tr>
						<th class="imgs_wrap"  width="200" height="200"><img class="image-preview" src=""></th>
					</tr>
					<!-- 버튼 -->
				<tfoot>
					<tr>
						<td colspan="2" align="center"><input class="write-btn1"
							onclick="if(!confirm('등록 하시겠습니까?')){return false;}" type="submit"
							value="등   록"> <a href="list" class="write-btn"
							onclick="if(!confirm('글 쓰기를 취소 하시겠습니까?')){return false;}">목&nbsp;&nbsp;&nbsp;록</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>