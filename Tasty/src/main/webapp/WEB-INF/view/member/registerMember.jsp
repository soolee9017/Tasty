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
<c:forEach items="${requestScope.result}" var="member">
<%-- <c:forEach items="${member.memberTasteList}" var="member_taste">
		<c:forEach items="${memberTaste.tasteList}" var="taste"> --%>
<li>${member}</li>
	<%-- </c:forEach>
	</c:forEach> --%>
	</c:forEach>
</ul>
</body>
</html>