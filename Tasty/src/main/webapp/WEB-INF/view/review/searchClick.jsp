<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.plus {
	color: blue;
	font-weight: bold; 
}
.minus{
	color: red;
	font-weight: bold;
}

.review{

border: 1px solid black;
width : 40%
}

.writer{
float : left;
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
			var memberPos  = 0;
			
			$.each(list, function(){
/* 				txt += "<tr><td>"+this.reviewNum+"</td>";
				txt += "<td>"+this.title+"</td>";
				txt += "<td>"+this.ratings+"/5.0</td>";
				txt += "<td><button class='plus'>추천</button></td>";
				txt += "<td><button class='minus'>비추천</button></td>";
				txt += "<td>"+this.ups+"</td>";
				txt += "<td>-"+this.downs+"</td>"
				txt += "<td><button type='button' class='rvBtn'>리뷰 상세보기</button></td></tr>"; */
				
				var email = this.email;
				
		 		$.ajax({
					"url":"/Tasty/member/getMemberPosAndTotal.do",
					"data":"email="+ email,
					"dataType":"json",
					"error":function(a, b,c){
						alert(c);
					},
					"success":function(all){
						alert(all);
						//memberPos = all;
					}
				}); 
				
				
				txt += "<div class='review'>";
				txt += "<div class='reviewNum'>" + this.reviewNum + "</div>";
				txt += "<div class='writer'>글쓴이 : " + email + "<br>";
				txt += "글쓴이 신뢰도 : " +memberPos + "</div>";
				txt += 	"<div class='title'>제목 : " + this.title + "</div>";
				txt += "<div class='ratings'>별점 : " + this.ratings + "/5.0</div>";
				txt += "<button class='plus'>추천</button>";
				txt += "<button class='minus'>비추천</button><br>";
				txt += "<span class='ups'>추천수 : " + this.ups + "     </span>"; 
				txt += "<span class='downs'>비추천수 : " + this.downs + "  </span><br>";
				txt += "<button type='button' class='rvBtn'>리뷰 상세보기</button>";
				txt += "</div><br>";
			});
			$("#reviews").append(txt); 
		}
	});
	
	
	
	$.ajax({
		"url":"/Tasty/review/getAverageRating.do",
		"data":"address="+address,
		"dataType":"json",
		"error":function(a, b,c){
			//alert(c);
		},
		"success":function(avg){
			$("#ratings").append('평균 평점 : '+avg + '점 / 5점'); 
		}
	});
	
	
	
	
	
	
	$("body").on("click", ".rvBtn", function(){
		
		var num = $(this).parent().children('.reviewNum').html();
	
		$('#reviewNumber').val(num);
		 $("#reviewDetail").submit(); 
		
		
	});
	
	
 /* 	$("table").on("click", ".plus", function(){
 		var evtSrc = this;
		$.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
			"url":"/Tasty/review/updateReviewUps.do",
			"data":"reviewNum="+$(evtSrc).parent().parent().children().eq(0).html(),
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
	}); */
	
	
 	$("body").on("click", ".plus", function(){
 		var evtSrc = this;
 		var num = $(this).parent().children('.reviewNum').html();
 		
 		$.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
			"url":"/Tasty/review/updateReviewUps.do",
			"data":"reviewNum="+num,
			"dataType":"json",
			"success":function(review){
				if(review == -1){
					alert("이미 선택하셨습니다.");
				}else{
				var txt = "추천수 : "+ review ;
				$(evtSrc).parent().children('.ups').html(txt);
				}
			}
		}); 
	});
	 
/*  	
 	$("div").on("click", ".minus", function(){
 		var evtSrc = this;
 		
		$.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
			"url":"/Tasty/review/updateReviewDowns.do",
			"data":"reviewNum="+$(evtSrc).parent().parent().children().eq(0).html(),
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
	}); */
 	
 	
  	$("body").on("click", ".minus", function(){
 		var evtSrc = this;
 		var num = $(this).parent().children('.reviewNum').html();
		$.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
			"url":"/Tasty/review/updateReviewDowns.do",
			"data":"reviewNum="+num,
			"dataType":"json",
			"success":function(review){
				if(review == -1){
					alert("이미 선택하셨습니다.");
				}else{
				var txt = "비추천수 : " + review + "<br>";
				$(evtSrc).parent().children('.downs').html(txt);
				}
			}
		});
	}); 
	 

	
});

</script>

<body>

<br><br><br>
<h2> 식당명: ${sessionScope.eateryTitle}</h2>
<h3>식당 주소: ${sessionScope.eateryJibun}</h3>
<h3>식당 전화번호: ${sessionScope.eateryTel }</h3>
<h4 id="ratings"></h4>

<a href="/Tasty/review/getAllTaste.do"><button type="button">리뷰 작성하기</button></a>
<p>
<p>
<p>

<!-- <table border="1">
	<thead>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>평점</td>
			<td>이 리뷰 도움 됨</td>
			<td>이 리뷰 별로</td>
			<td>Total 추천수</td>
			<td>Total 비추천수</td>
			<td>리뷰 상세보기</td>
		</tr>
	</thead>
	<tbody id="tBody">
		
	</tbody>
</table> -->


<div id="reviews">


</div>

<form action="${initParam.rootPath }/review/selectReviewByNum.do" id="reviewDetail" method="post">
 <sec:csrfInput/>
<input type="hidden" id="reviewNumber" name="reviewNum" value="">
</form>

</body>
</html>