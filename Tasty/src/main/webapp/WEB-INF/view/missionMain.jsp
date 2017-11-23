<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
</head>
<body>
<h1>미션들 보여질 페이지</h1>

<c:foreach items="${requestScope.list }" var="mission">

</c:foreach>

</body>
</html>