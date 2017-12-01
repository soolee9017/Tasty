<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${initParam.rootPath }/review/selectReviewByNum.do" method="post">
<sec:csrfInput/>
리뷰번호:<input type="text" name="reviewNum">
<br><button>전송</button>
</form>



</body>
</html>