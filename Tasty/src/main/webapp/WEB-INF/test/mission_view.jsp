<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>미션 요청페이지</h1>
<form action="${initParam.rootPath }/mission/getAllMisson.do" method="post">
	<input type="text" name="missionNum"/>
	<button type="submit">조회하기</button>

</form>
</body>
</html>