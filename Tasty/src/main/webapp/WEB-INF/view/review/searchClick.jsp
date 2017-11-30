<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var address = ${sessionScope.eateryJibun}
	
	
	
	
	$.ajax({
		"url":"/Tasty/review/getReviewByAddress.do",
		"data":"address="+address,
		"dataType":"json",
		"success":function(list){
			var txt="";
			$.each(list, function(){
				txt += this+"<br>";
			});
			$(".reviewList").html(txt);
		}
	});
});
</script>

<body>


<h2> 식당명: ${sessionScope.eateryTitle}</h2>
<h3>식당 주소: ${sessionScope.eateryJibun}</h3>
<h3>식당 전화번호: ${sessionScope.eateryTel }</h3>

<div class="reviewList">
	
</div>
<a href="/Tasty/review/getAllTaste.do"><button >이 식당 리뷰 작성</button></a>

<br><br>

이 식당에 대한 리뷰들 나오고~ 루트 나오고~


</body>
</html>