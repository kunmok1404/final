<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/WEB-INF/views/template/admin/super/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/template/admin/super/left/left_chart.jsp"></jsp:include> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}

</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/kelly.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_kelly);
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);

var data = [];
var size = parseInt($(".data_size").val())+1;
for(let i = 1; i < size; i++){
  data.push({date:new Date($(".t1"+i).val(), $(".t2"+i).val(), $(".t3"+i).val()), value:$(".data"+i).val(),value2:$(".cancel"+i).val(),value3:$(".sussce"+i).val()});
}

chart.data = data;

// Create axes
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.minGridDistance = 60;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

// Create series
var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "value";
series.dataFields.dateX = "date";
series.tooltipText = "주문건수:{value}";

var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "value2";
series.dataFields.dateX = "date";
series.tooltipText = "취소건수:{value2}";

var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "value3";
series.dataFields.dateX = "date";
series.tooltipText = "완료건수:{value3}";


series.tooltip.pointerOrientation = "vertical";

chart.cursor = new am4charts.XYCursor();
chart.cursor.xAxis = dateAxis;

//chart.scrollbarY = new am4core.Scrollbar();
chart.scrollbarX = new am4core.Scrollbar();

}); 

$(function(){
	var size;
	$(".seach").click(function(){
		var sh_name = $(".search_name").val();
		console.log(sh_name);
	    $.ajax({
	        url : "${pageContext.request.contextPath}/super_admin/chart/search_name",
	        data: {sh_name: sh_name},	
	        success : function(aaa){
	        	var results = aaa;
	        	size = aaa.length;
	        	 var str = "<TR>";
	            $.each(results , function(i){
	                str += "<TD class=\"aes\"><H6 class=\"name\" data-dismiss=\"modal\">" + results[i].shop_name + "</H6><H6 class=\"no\">" + results[i].no + "</H6></TD>";
	                str += "</TR>";
	           });
	           $("#boardList").append(str); 
	           for (var i = 0; i < size; i++) {				
	       		$(".aes").click(function() {
					    $(".result_name").val($(this).children(".name").text());
					    $(".result_no").val($(this).children(".no").text());
	       		})
	       		break;
			}
	      
	        }
	    });
	})
	
		 z=$(".end").val();

	    var end_today = new Date();
	    var end_dd = end_today.getDate();
	    var end_mm = end_today.getMonth()+1; //January is 0!

	    var end_yyyy = end_today.getFullYear();
	    if(end_dd<10){end_dd='0'+end_dd} 
	    if(end_mm<10){end_mm='0'+end_mm} 
	    end_today = end_yyyy+'-'+end_mm+'-'+end_dd;     

	    $(".end").val(end_today);
		
		 z=$(".start").val();

		 var start_today = new Date(Date.parse(end_today) - 7*1000*60*60*24);
		 var start_dd = start_today.getDate();
		 var start_mm = start_today.getMonth()+1; //January is 0!

		 var start_yyyy = start_today.getFullYear();
		 if(start_dd<10){start_dd='0'+start_dd} 
		 if(start_mm<10){start_mm='0'+start_mm} 
		 start_today = start_yyyy+'-'+start_mm+'-'+start_dd;     

		 $(".start").val(start_today);
		 
		 
		 $(".one").click(function() {
			 z=$(".start").val();

			 var start_today = new Date(Date.parse(end_today) - 1*1000*60*60*24);
			 var start_dd = start_today.getDate();
			 var start_mm = start_today.getMonth()+1; //January is 0!

			 var start_yyyy = start_today.getFullYear();
			 if(start_dd<10){start_dd='0'+start_dd} 
			 if(start_mm<10){start_mm='0'+start_mm} 
			 start_today = start_yyyy+'-'+start_mm+'-'+start_dd;
			 
			 $(".start").val(start_today);
		})
		 $(".week").click(function() {
			 z=$(".start").val();

			 var start_today = new Date(Date.parse(end_today) - 7*1000*60*60*24);
			 var start_dd = start_today.getDate();
			 var start_mm = start_today.getMonth()+1; //January is 0!

			 var start_yyyy = start_today.getFullYear();
			 if(start_dd<10){start_dd='0'+start_dd} 
			 if(start_mm<10){start_mm='0'+start_mm} 
			 start_today = start_yyyy+'-'+start_mm+'-'+start_dd;
			 
			 $(".start").val(start_today);
		}) 
		 $(".month").click(function() {
			 z=$(".start").val();

			 var start_today = new Date();
			 var start_dd = start_today.getDate();
			 var start_mm = start_today.getMonth(); //January is 0!

			 var start_yyyy = start_today.getFullYear();
			 if(start_dd<10){start_dd='0'+start_dd} 
			 if(start_mm<10){start_mm='0'+start_mm} 
			 start_today = start_yyyy+'-'+start_mm+'-'+start_dd;
			 
			 $(".start").val(start_today);
		}) 
})



// end am4core.ready()
</script>
<style>
	#chdiv {
		width:60%;
		margin: auto;
	}
	.dise {
		text-align: right;
	}
</style>
<!-- HTML -->
<div id="chdiv">
		<form method="post">
		<table border="1" style="width: 100%">
		<tr>
		<th width="50%"><input type="text" name="shop_name" class="result_name" style="width: 80%">
		<input type="hidden" name="no" class="result_no" style="width: 80%">
		<input type="button" value="검색" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">매장이름 검색</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <input type="text" class="search_name"><input type="button" value="검색" class="seach"><hr>
		        <div><table id = "boardList" border = "1"></table></div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		  </div>
		</div>
		</div>
		</th>
		<th><input type="button" class="btn btn-secondary one" value="하루">
			<input type="button" class="btn btn-secondary week" value="1주일">
			<input type="button" class="btn btn-secondary month" value="1달"><br>
		시작<input type="date" name="start" class="start">
		종료<input type="date" name="end" class="end">
		<input type="submit" value="검색" class="btn btn-primary"></th>
		</tr>
		</table>
		</form>
<div id="chartdiv"></div>
<input type="hidden" value="${order_date.size() }" class="data_size">
	<table border="1" style="width: 100%">
		<thead>
			<tr align="center" class="table-primary text-center">
				<th>년/월/일</th>
				<th>주문건수</th>
				<th>취소건수</th>
				<th>완료건수</th>
			</tr>
		</thead>
		<tbody>
<c:forEach var="data"  items="${order_date }">
			<tr>
				<td><input type="hidden" value="${data.t1 }" class="t1${data.rownum }">
					<input type="hidden" value="${data.t2 }" class="t2${data.rownum }">
					<input type="hidden" value="${data.t3 }" class="t3${data.rownum }">
				${data.t1 }/${data.t2 }/${data.t3 }</td>
				<td>
				<input type="text" value="${data.cut }번" class="data${data.rownum } dise" readonly style="width: 100%"></td>
				<td>
				<input type="text" value="${cancel.get(data.rownum-1) }번" class="cancel${data.rownum } dise" readonly style="width: 100%"></td>
				<td>
				<input type="text" value="${sussce.get(data.rownum-1) }번" class="sussce${data.rownum } dise" readonly style="width: 100%"></td>
			</tr>
</c:forEach>
		</tbody>
	</table>
</div>


<jsp:include page="/WEB-INF/views/template/admin/super/footer.jsp"></jsp:include>








