<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>



<br><br><br><br>




<h1>Route 상세정보</h1>
루트번호 : ${requestScope.route.routeNum }<br>
루트제목 : ${requestScope.route.routeName }<br>
루트내용 : ${requestScope.route.content }<br>

밑에 지도를 뿌려주세요우~~

</body>
</html>