<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdn.tiny.cloud/1/6ftday8a7jg29iewicngy31mxruhwuo468au005jb6npig7g/tinymce/5/tinymce.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/pkmadmin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/password-encoder.js"></script>

<script>
	$(function(){
		
		// 뭐먹지 바로가기 클릭
        $("#client-site").click(function(){
        	window.open("${pageContext.request.contextPath}/");
        })
        
        // 로그인 버튼 클릭시 로그인처리
        $(".login-btn").click(function(){
        	$("form").submit();
        })
		
	})
</script>

<header>
        <!--네비게이션 영역시작-->
        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="${pageContext.request.contextPath}">
                <img alt="Brand" src="${pageContext.request.contextPath}/resources/image/logo.jpg">
              </a>
            </div>
            <div class="header-button"> 
              <button class="btn btn-light btn-sm" id="client-site">뭐먹지 바로가기</button>
            </div>
          </div>
        </nav>
        <!--네비게이션 영역 끝-->
        
        <!--로그인컨텐츠-->
        <div class="container">

          <div class="row">
            <div class="col-md-12">
              <div class="adminLogin-title">뭐먹지 사장님 관리자</div>
            </div>
          </div>

          <div class="row">
            <div class="offset-2 col-md-8">
              <form action="login" method="post">
                <table class="table table-borderless mt-5 text-center login-table">
                  <tbody>
                    <tr>
                        <td width="20%" class="text-right"><span class="admin-id font-weight-bold">아이디</span></td>
                        <td>
                          <input type="text" name="id" class="form-control" placeholder="아이디를 입력해주세요."> 
                        </td>
                        <td rowspan="2" class="login-btn font-weight-bold login-btn">로그인</td>
                    </tr>
                    <tr>
                        <td class="text-right"><span class="admin-id font-weight-bold">비밀번호</span></td>
                        <td>
                          <input type="password" name="pw" class="form-control" placeholder="비밀번호를 입력해주세요."> 
                        </td>
                    </tr>
                  </tbody>
                </table>
              </form>
            </div>
          </div>

          <div class="row">
              <div class="offset-1 col-md-10">
                  <div class="login-bottom mt-3"></div>
              </div>
          </div>
          <div class="row">
              <div class="offset-1 col-md-10">
                  <div class="login-text">
                    *불법적인 접근 또는 허가되지 않은 사용자가 접속을 시도할 경우 관계 법령에 의해 처벌 받을 수 있습니다.
                  <a href="${pageContext.request.contextPath}/shop_admin/member/testLogin" class="ml-3 text-primary">(테스트 로그인)</a>
                  </div>
              </div>
          </div>

        </div>

    </header>