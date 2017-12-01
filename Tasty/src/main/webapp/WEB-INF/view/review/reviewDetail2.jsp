<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${requestScope.review } <br><br>

${requestScope.review.address }<br>

${requestScope.review.ratings }<br>

${requestScope.review.menuList }<br><br>

${requestScope.review.reviewPhotoList }<br>


</body>
</html>