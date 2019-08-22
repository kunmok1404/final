<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/kayClient.css"
	rel="stylesheet">
<%-- <script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script> --%>
<script>
// 	$(function(){
// 	    ClassicEditor
// 	            .create( document.querySelector( 'textarea[name=content]' ) )
// 	});

	 //파일이 선택되면 파일의 미리보기 이미지를 img에 설정
	 $(function(){
		 $("input[name=image]").change(function(e){
            //e에 포함된 이미지를 불러와서 설정
            console.log(this.files);
            
            
            //input[type=file]만 files 항목이 있으므로
            //파일이 있으면 실행하도록 조건을 구현
            if(this.files && this.files[0]){
//                 //읽기 도구 생성
                var reader = new FileReader();
                //읽기 완료시 할 작업을 예약 설정
                reader.onload = function(data){//data : 파일 정보
                    $(".image-preview").attr("src", data.target.result);
                    console.log(data);
                };
            	
                //실제로 읽기
                reader.readAsDataURL(this.files[0]);
            }
		 });
	 });
	 
</script>

<div class="qna">
	<div class="offset-1 col-10">
		<h4>1:1 문의</h4>
		<div class="empty"></div>
		<form action="write" method="post">
		<!-- 표 -->
		<table class="qna-qna">

			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<thead>
				<tr>
					<th class=notice-th>카테고리</th>
					<th class=notice-th2><select name="category">
							<option value="">선택하세요</option>
							<option value=1>주문접수</option>
							<option value=2>주문확인</option>
							<option value=3>주문취소/변경</option>
							<option value=4>서비스이용</option>
							<option value=5>결제</option>
							<option value=6>가맹 및 기타</option>
							<option value=7>뭐먹지 슈퍼클럽</option>
					</select></th>
				<tr>
					<th class=notice-th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
					<th><textarea name="title" placeholder="제목을 입력하세요" required cols="108" rows="2"></textarea></th>
				</tr>
				<tr>
					<th class=notice-th>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
					<th><textarea name="content" placeholder="내용을 입력하세요" required cols="108" rows="6"></textarea></th>
				</tr>
				<tr>
					<th class=notice-th rowspan="2">사진첨부</th>
					<th><input type="file" name="image" accept=".jpg, .png" multiple><span>(Jpg, Png파일 최대 5장까지 첨부가 가능합니다.)</span> </th>
				</tr>
				<tr>
					<th><img class="image-preview" src=""  ></th>
				</tr>
				<!-- 버튼 -->
			<tfoot>
				<tr>
					<td colspan="2" align="center" >
						<input class="write-btn1" onclick="if(!confirm('등록 하시겠습니까?')){return false;}" type="submit" value="등   록">
						<a href="list" class="write-btn" onclick="if(!confirm('글 쓰기를 취소 하시겠습니까?')){return false;}">목&nbsp;&nbsp;&nbsp;록</a>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>