<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
div {
	font-weight: bold;
}
</style>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var address = '<%=(String)session.getAttribute("eateryJibun") %>';
	
	 //alert(address);
	$.ajax({
		"url":"/Tasty/review/getReviewByAddress.do",
		"data":"address="+address,
		"dataType":"json",
		"error":function(a, b,c){
			//alert(c);
		},
		"success":function(list){
			var txt="리뷰번호 : ";
			$.each(list, function(){
				txt += this.reviewNum+"<br>";
				txt += this.title+"<br>";
				txt += "<button class='plus'>추천</button>";
				
				
			});
			//alert(txt);
			$("#reviewList").append(txt); 
		}
	});
	
		var cnt = 0;
	$("div").on("click",".plus",function(){
		cnt++;
		alert(cnt);
	});
});
</script>

<body>


<h2> 식당명: ${sessionScope.eateryTitle}</h2>
<h3>식당 주소: ${sessionScope.eateryJibun}</h3>
<h3>식당 전화번호: ${sessionScope.eateryTel }</h3>

<a href="/Tasty/review/getAllTaste.do"><button type="button">리뷰 작성하기</button></a>
<p>

<div id="reviewList">

</div>

<br><br>

이 식당에 대한 리뷰들 나오고~ 루트 나오고~


</body>
</html>