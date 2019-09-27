<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/super/left/left_member.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script>
	$(function() {
		$(".min2").on("propertychange change keyup paste input", function() {
			var a =parseInt($(this).val());
			a--;
			var c =parseInt($(this).val());
			var b =parseInt($(".max2").val());
			if ( c >= b ) {
				b++
				$(".max2").val(b);
				var d = parseInt($(".max2").val());
				d++
				$(".min1").val(d);
			}
			$(".max3").val(a);
		});
		$(".min1").on("propertychange change keyup paste input", function() {
			var a =parseInt($(this).val());
			a--;
			$(".max2").val(a);
			var b =parseInt($(".min2").val());
			if ( b >= a ) {
			var c =parseInt($(".max2").val());
				c--;
				$(".min2").val(c);
				var d = parseInt($(".min2").val());
				d--;
				$(".max3").val(d);
			}
		});
		$(".max2").on("propertychange change keyup paste input", function() {
			var a =parseInt($(this).val());
			a++;
			var c =parseInt($(this).val());
			var b =parseInt($(".min2").val());
			if ( b >= c ) {
				c--;
				$(".min2").val(c);
				var d = parseInt($(".min2").val());
				d--;
				$(".max3").val(d);
			}
			$(".min1").val(a);
		});$(".max3").on("propertychange change keyup paste input", function() {
			var a =parseInt($(this).val());
			a++;
			$(".min2").val(a);
			var c =parseInt($(".min2").val());
			var b =parseInt($(".max2").val());
			if ( c >= b ) {
				c++;
				$(".max2").val(c);
				var d = parseInt($(".max2").val());
				d++;
				$(".min1").val(d);
			}
		});
		
		
		
		 $(".edit").click(function() {
			 var name1 =$(".name1").val();
				var name2 =$(".name2").val();
				var name3 =$(".name3").val();
				var min_order1 =$(".min1").val();
				var min_order2 =$(".min2").val();
				var max_order2 =$(".max2").val();
				var max_order3 =$(".max3").val();
			 $.ajax({
				 	type:"post",
	    			url:"${pageContext.request.contextPath}/super_admin/member/usergrade_edit",
	    			data : {
	    				"name1" : name1,
	    				"name2" : name2,
	    				"name3" : name3,
	    				"min_order1" : min_order1,
	    				"min_order2" : min_order2,
	    				"max_order2" : max_order2,
	    				"max_order3" : max_order3
	    			}
			 });
		});
		
		
		
		
		
		
		
		
		
	});
	
	
	</script>
		
	
	
	<div class="wrapper mt-3">
	
	<div class="top-title">
		<div id="terms-wrapper">
			<div class="terms-line"></div>
		</div>
		<span class="header-title">회원등급관리</span>
	</div>
	
	<table class="table table-hamburg mt-3 grade_table">
	<thead>
		<tr class="table-info">
			<th>등급명</th>
			<th>최소주문횟수</th>
			<th >최대주문횟수</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="grade" items="${grade}">
	<tr>
		<td>
			<input type="text" class="form-control-sm" name="name${grade.grade }" value="${grade.name }" class="name${grade.grade }">
			<input type="hidden" class="form-control-sm" name="grade" value="${grade.grade }">
		</td>
		<td>
			<c:if test="${grade.grade == 2 }">
				<input type="number" class="form-control-sm" name="min_order${grade.grade }" value="${grade.min_order }" min="2" class="min${grade.grade }">&nbsp이상
			</c:if>
			<c:if test="${grade.grade == 1 }">
				<input type="number" class="form-control-sm" name="min_order${grade.grade }" value="${grade.min_order }" min="4" class="min${grade.grade }">&nbsp이상
			</c:if>
		</td>
		<td>
			<c:if test="${grade.grade == 2 }">
				<input type="number" class="form-control-sm" name="max_order${grade.grade }" value="${grade.max_order }" min="3" class="max${grade.grade }">&nbsp미만
			</c:if>
			<c:if test="${grade.grade == 3 }">
				<input type="number" class="form-control-sm" name="max_order${grade.grade }" value="${grade.max_order }" min="1" class="max${grade.grade }">&nbsp미만
			</c:if>
		</td>
	</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="3" align="center">
			<input type="button" value="저장" class="edit btn btn-lg btn-primary">
			</td>
		</tr>
	</tfoot>
	</table>
	
	</div>
	
<jsp:include page="/WEB-INF/views/template/admin/shop/footer.jsp"></jsp:include>