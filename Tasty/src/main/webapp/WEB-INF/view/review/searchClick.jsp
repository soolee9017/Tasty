<%@ page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  
     
     
<h2> 식당명: ${sessionScope.eateryTitle}</h2>
<h3>식당 주소: ${sessionScope.eateryJibun}</h3>
<h3>식당 전화번호: ${sessionScope.eateryTel }</h3>


<a href="/Tasty/review/getAllTaste.do"><button >이 식당 리뷰 작성</button></a>

<br><br>

이 식당에 대한 리뷰들 나오고~ 루트 나오고~


</body>
</html>