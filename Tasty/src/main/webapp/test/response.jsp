<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
<h1>response 결과</h1>

<ul>
<c:forEach items="${requestScope.result}" var="review">
	<c:forEach items="${review.menuList}" var="menu">
		<c:forEach items="${menu.mtList}" var="menu_taste">
			<li>${menu_taste}</li>
		</c:forEach>
		</c:forEach>
</c:forEach>
</ul>


</body>
</html>