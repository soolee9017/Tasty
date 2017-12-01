<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${sessionScope.eateryTitle }의 정보<br>
별점: ${param.rating}<br>
제목 : ${param.title}<br>


</body>
</html>