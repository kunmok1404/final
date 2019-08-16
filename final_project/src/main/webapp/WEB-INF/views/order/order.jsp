<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/client/header.jsp"></jsp:include>
    
<div align="center">
<h1>주문서</h2>
</div>
<div align="left">
<h2>배달정보</h3>
</div>
<hr>
<div>
<h3>주소</h3>
<button>기본주소로 설정</button>
<button>새 주소</button>
</div>
<div>
<input type="text" name="address" readonly="readonly" placeholder="배달주소"><br>
<input type="text" name="address_detail" readonly="readonly"><br>
<input type="text" name="address_detail2" placeholder="상세 주소">
</div>
<div>
<h3>연락처</h3>
<input type="text" name="phone" placeholder="전화번호를 입력해주세요.">
</div>

<jsp:include page="/WEB-INF/views/template/client/footer.jsp"></jsp:include>