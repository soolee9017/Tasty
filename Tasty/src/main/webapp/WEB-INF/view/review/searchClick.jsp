<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	alert("실행");
	var address = '<%=(String)session.getAttribute("eateryJibun") %>';
	
	$.ajax({
		"url":"/Tasty/review/getReviewByAddress.do",
		"data":"address="+address,
		"dataType":"json",
		"error":function(a, b,c){
			alert(c);
		},
		"success":function(list){
			alert("성공");
			var txt = "";
			$.each(list, function(){
				txt += "<tr><td>"+this.reviewNum+"</td>";
				txt += "<td>"+this.title+"</td>";
				txt += "<td><button class='plus'>추천</button></td>";
				txt += "<td><button class='minus'>비추천</button></td>";
				txt += "<td>"+this.ups+"</td>";
				txt += "<td>-"+this.downs+"</td></tr>";
			});
			//alert(txt);
			$("#tBody").append(txt); 
		}
	});
	
 	$("table").on("click", ".plus", function(){
 		var evtSrc = this;
		$.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
			"url":"/Tasty/review/updateReviewUps.do",
			"data":"reviewNum="+$(evtSrc).parent().prev().prev().html(),
			"dataType":"json",
			"success":function(review){
				var txt = review.ups;
				$(evtSrc).parent().next().next().html(txt);
			}
		});
	});
 	
 	$("table").on("click", ".minus", function(){
 		var evtSrc = this;
		$.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
			"url":"/Tasty/review/updateReviewDowns.do",
			"data":"reviewNum="+$(evtSrc).parent().prev().prev().prev().html(),
			"dataType":"json",
			"success":function(review){
				var txt = review.downs;
				$(evtSrc).parent().next().next().html("-"+txt);
			}
		});
	});
	 

});
</script>

<body>


<h2> 식당명: ${sessionScope.eateryTitle}</h2>
<h3>식당 주소: ${sessionScope.eateryJibun}</h3>
<h3>식당 전화번호: ${sessionScope.eateryTel }</h3>

<a href="/Tasty/review/getAllTaste.do"><button type="button">리뷰 작성하기</button></a>
<p>
<p>
<p>

<table border="1">
	<thead>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>추천</td>
			<td>비추천</td>
			<td>Total 추천수</td>
			<td>Total 비추천수</td>
		</tr>
	</thead>
	<tbody id="tBody">
		
	</tbody>
</table>




</body>
</html>