<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script>
        $(function(){
            $("button").eq(0).click(function(){
                // $("h1").css("display", "none");
                // $("h1").hide();
                // $("h1").hide(1000);
                // $("h1").slideUp("fast");//slow 또는 fast 또는 밀리초
                $(".terms1").fadeIn();
                $(".terms2").fadeOut();
            });

            $("button").eq(1).click(function(){
                // $("h1").show();
                // $("h1").show(1000);
                // $("h1").slideDown();
                $(".terms2").fadeIn();
                $(".terms1").fadeOut();
            });
        });
    </script>
</head>
<body>
<button>이용약관</button>
<button>개인정보처리방침</button>
<div class="terms1">
<c:forEach var="terms" items="${terms1}">
	<h1>${terms.type }</h1>
	<h1>${terms.regist_date }</h1>
	<h1>${terms.content }</h1>
</c:forEach>
</div>
<div class="terms2">
<c:forEach var="terms" items="${terms2}">
	<h1>${terms.type }</h1>
	<h1>${terms.regist_date }</h1>
	<h1>${terms.content }</h1>
</c:forEach>
</div>	
</body>
</html>