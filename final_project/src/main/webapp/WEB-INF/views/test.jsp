<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="test2" method="post">
		<c:forEach var="i" items="1,2,3,4,5" varStatus="status1">
			<h5>main ${i}</h5>
			<input type="text" name="main[${status1.index}].test1" value="${status1.index}"><br>
			<input type="text" name="main[${status1.index}].test2" value="${status1.index}"><br>
			<input type="text" name="main[${status1.index}].test3" value="${status1.index}"><br>
			<input type="text" name="main[${status1.index}].test4" value="${status1.index}"><br>
			<input type="text" name="main[${status1.index}].test5" value="${status1.index}"><br>
			<c:forEach var="j" items="1,2,3,4,5" varStatus="status2">
				<h6>sub ${j}</h6>
				<input type="text" name="main[${status1.index}].list[${status2.index}].sub1" value="${status2.index}"><br>
				<input type="text" name="main[${status1.index}].list[${status2.index}].sub2" value="${status2.index}"><br>
				<input type="text" name="main[${status1.index}].list[${status2.index}].sub3" value="${status2.index}"><br>
				<input type="text" name="main[${status1.index}].list[${status2.index}].sub4" value="${status2.index}"><br>
				<input type="text" name="main[${status1.index}].list[${status2.index}].sub5" value="${status2.index}"><br>
			</c:forEach>
		</c:forEach>
		<input type="submit" value="등록">
	</form>
</body>
</html> 