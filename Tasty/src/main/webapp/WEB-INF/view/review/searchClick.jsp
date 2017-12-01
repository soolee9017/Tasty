<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
tbody tr td:nth-child(5) {
	color: blue;
	font-weight: bold; 
}
tbody tr td:nth-child(6){
	color: red;
	font-weight: bold;
}

</style>

<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var address = '<%=(String)session.getAttribute("eateryJibun") %>';
	
	$.ajax({
		"url":"/Tasty/review/getReviewByAddress.do",
		"data":"address="+address,
		"dataType":"json",
		"error":function(a, b,c){
			alert(c);
		},
		"success":function(list){
			var txt = "";
			$.each(list, function(){
				txt += "<tr><td>"+this.reviewNum+"</td>";
				txt += "<td>"+this.title+"</td>";
				txt += "<td><button class='plus'>추천</button></td>";
				txt += "<td><button class='minus'>비추천</button></td>";
				txt += "<td>"+this.ups+"</td>";
				txt += "<td>-"+this.downs+"</td>"
				txt += "<td><button type='button' class='rvBtn'>리뷰 상세보기</button></td></tr>";
			});
			//alert(txt);
			$("#tBody").append(txt); 
		}
	});
	
	
	$("table").on("click", ".rvBtn", function(){
		
		var num = $(this).parent().parent().children().eq(0).html();
		$('#num').val(num);
		 $("#reviewDetail").submit(); 
		
		
	});
	
 	$("table").on("click", ".plus", function(){
 		var evtSrc = this;
		$.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
			"url":"/Tasty/review/updateReviewUps.do",
			"data":"reviewNum="+$(evtSrc).parent().prev().prev().html(),
			"dataType":"json",
			"success":function(review){
				if(review == -1){
					alert("이미 선택하셨습니다.");
				}else{
				var txt = review;
				$(evtSrc).parent().next().next().html(txt);
				}
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
				if(review == -1){
					alert("이미 선택하셨습니다.");
				}else{
				var txt = review;
				$(evtSrc).parent().next().next().html("-"+txt);
				}
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
			<td>리뷰 상세보기</td>
		</tr>
	</thead>
	<tbody id="tBody">
		
	</tbody>
</table>

<form action="${initParam.rootPath }/review/selectReviewByNum.do" id="reviewDetail" method="post">
 <sec:csrfInput/>
<input type="hidden" id="num" name="reviewNum" value="">
</form>

</body>
</html>