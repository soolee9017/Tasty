<%@ page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>request</h1> 
<form action="${initParam.rootPath }/review/getAllReview.do" method="post">
	<input type="text" name="address"/>
	<button>조회</button>
</form>

</body>
</html>