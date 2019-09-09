<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/WEB-INF/views/template/admin/shop/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/template/admin/shop/left/left_notice.jsp"></jsp:include> 
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
  data.push({date:new Date(2019, 7, $(".t3"+i).val()), value:$(".data"+i).val(),value2:$(".cancel"+i).val(),value3:$(".sussce"+i).val()});
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


var date1 = new Date();
console.log(date1.getDate());
var date2 = new Date(2019,8,19);
console.log(date2.getDate());
var time = date2-date1;
console.log(time/1000/60/60);
}); 
$(function() {
	$(".daa").click(function() {
		console.log($(".dda").val());
	});
});



// end am4core.ready()
</script>
<style>
	#chartdiv {
		width:60%;
		margin: auto;
	}
	
	#chdiv {
		width:60%;
		margin: auto;
	}
	.dise {
		text-align: right;
	}
</style>
<!-- HTML -->
<div id="chartdiv"></div>
<div id="chdiv">
<input type="hidden" value="${order_date.size() }" class="data_size">
	<table border="1">
		<thead>
			<tr align="center">
				<th>년/월/일</th>
				<th>주문건수</th>
				<th>취소건수</th>
				<th>완료건수</th>
			</tr>
		</thead>
		<tbody>
<c:forEach var="data"  items="${order_date }">
			<tr>
				<td><input type="hidden" value="${data.t3 }" class="t3${data.rownum }">
				${data.t1 }/${data.t2 }/${data.t3 }</td>
				<td>
				<input type="text" value="${data.cut }번" class="data${data.rownum } dise" readonly></td>
				<td>
				<input type="text" value="${cancel.get(data.rownum-1) }번" class="cancel${data.rownum } dise" readonly></td>
				<td>
				<input type="text" value="${sussce.get(data.rownum-1) }번" class="sussce${data.rownum } dise" readonly></td>
			</tr>
</c:forEach>
		</tbody>
	</table>
		<form method="post">
		시작<input type="date" name="start">종료<input type="date" name="end">
		<input type="submit" value="검색">
		</form>
</div>
    <jsp:include page="/WEB-INF/views/template/admin/shop/footer.jsp"></jsp:include>