<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
html, body {
	height: 96.5%;
	margin: 0 auto;
}
.plus {
   color: blue;
   font-weight: bold;
   margin-right:20px;
   border:1px #3c3c3c solid;
   height:24px;
   border-radius:5px;
}
.plus:active{
	background-color:#969696;
	box-shadow:0 5px 5px 0 grey inset;
}
.minus{
   color: red;
   font-weight: bold;
   border:1px #3c3c3c solid;
   height:24px;
   border-radius:5px;
}
.minus:active{
background-color:#969696;
box-shadow:0 5px 5px 0 grey inset;
}
.review{
margin-top:30px;
border-radius:10px;
width : 80%;
height:140px;
margin-left:50px;
background-color:white;
box-shadow:5px 5px grey;
}

.writer{
border-radius:10px;
border: 1px solid red;
float : left;
width:25%;
height:100%;
}

.reviewNum{
display:none;
}
.rvBtn{
margin-top:10px;
border:1px #6495ED solid;
border-radius:10px;
background-color:#50C2FF;
color:#E8F5FF;
}
.rvBtn:active{
background-color:#3CAEFF;
box-shadow:0 5px 5px 0 #289AFF inset;
}
.content{
	overflow:hidden;
}
.title{
	font-size:22px;
}
#mtTasteBtn{
	top:35%;
	left:20%;	
	position:absolute;
	z-index:10;
	border-radius:5px;
	border:0px;
	height:35px;
	background-color:#FE9A2E;
	width:120px;
	
}
#mtTasteBtn:active{
	background-color:#FF8200;
	box-shadow:0 5px 5px 0 #FF6100 inset;
}
#moreBtn{
	top:35%;
	left:20%;
	position:absolute;
	z-index:11;
	border-radius:5px;
	border:0px;
	height:35px;
	background-color:#FE9A2E;
	width:120px;
}
#moreBtn:active{
	background-color:#FF8200;
	box-shadow:0 5px 5px 0 #FF6100 inset;
}
</style>

<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
   var address = '<%=(String)session.getAttribute("eateryJibun") %>';
   var ajaxCon;
   var atxt="";
   if($(".loginCheck").html()==1){
      ajaxCon = "getReviewByAddress2.do"; //로그인 안한 사람
   }else{
      ajaxCon = "getAllReviewByAddress.do"; //로그인 한 사람
   }
   
   $.ajax({
      "url":"/Tasty/review/"+ajaxCon,
      "data":"address="+address,
      "dataType":"json",
      "error":function(a, b,c){
      },
      "success":function(list){
         var txt = "";
         //로그인 한 사람만 '입맛맞춰 보기'누를 수 있게 하기
         if($(".loginCheck").html()==0){
            txt += "<button id='mtTasteBtn' type='button'>입맛맞춰 보기</button>";
         }
         var total;
         $.each(list, function(){

            
         
       
             total = this.member.totalUps + this.member.totalDowns;
             pos = (this.member.totalUps / total) * 100;
            
            
            txt += "<div class='review'>";
            txt += "<div class='reviewNum'>" + this.reviewNum + "</div>";
            txt += "<div class='writer'>리뷰 쓴사람 정보<br>글쓴이 : " + this.email + "<br>";
            txt += "신뢰도 <br> 받은 총 평가수" + total + "<br>";
            txt += "긍정평가률 : " + pos.toFixed(2) + "%</div>";
            txt += "<div class='title'>" + this.title + "</div>";
            txt += "<div class='ratings'>별점 : " + this.ratings + "/5.0</div>";
            txt += "<div class='content'>" + this.content + "</div>";
            txt += "<button class='plus glyphicon glyphicon-thumbs-up'><span>추천 " + this.ups + "</span></button>";
            txt += "<button class='minus 	glyphicon glyphicon-thumbs-down'><span>비추천 " + this.downs + "</span></button><br>";
            txt += "<button type='button' class='rvBtn'>리뷰 상세보기</button>";
            txt += "</div><br>";
         });
         $("#reviews").html(txt); 
      }
   });
   
   
   
   
   
   $.ajax({
      "url":"/Tasty/review/getAverageRating.do",
      "data":"address="+address,
      "dataType":"json",
      "error":function(a, b,c){
      },
      "success":function(avg){
      }
   });
   
   
   
   
   
   
   $("body").on("click", ".rvBtn", function(){
      
      var num = $(this).parent().children('.reviewNum').html();
   
      $('#reviewNumber').val(num);
       $("#reviewDetail").submit(); 
      
      
   });
   
   
 /*    $("table").on("click", ".plus", function(){
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
            var txt = "비추천수 : " + review;
            $(evtSrc).parent().children('.downs').html(txt);
            }
         }
      });
   }); 
   
   //로그인 후, 입맛맞춰보기.
   $("body").on("click","#mtTasteBtn",function(){
     $.ajax({
         "url":"/Tasty/review/getReviewByAddress.do",
         "data":"address="+address,
         "dataType":"json",
         "error":function(a, b,c){
         },
         "success":function(list){
            var txt = "";
            txt += "<button id='moreBtn' type='button'>리뷰 더 보기</button>";
            var total;
            $.each(list, function(){
                total = this.member.totalUps + this.member.totalDowns;
                pos = (this.member.totalUps / total) * 100;
               
               txt += "<div class='review'>";
               txt += "<div class='reviewNum'>" + this.reviewNum + "</div>";
               txt += "<div class='writer'>리뷰 쓴사람 정보<br>글쓴이 : " + this.email + "<br>";
               txt += "신뢰도 <br> 받은 총 평가수" + total + "<br>";
               txt += "긍정평가률 : " + pos.toFixed(2) + "%</div>";
               txt +=    "<div class='title'>" + this.title + "</div>";
               txt += "<div class='ratings'>별점 : " + this.ratings + "/5.0</div>";
               txt += "<div class='content'>" + this.content + "</div>";
               txt += "<button class='plus glyphicon glyphicon-thumbs-up'><span>추천 " + this.ups + "</span></button>";
               txt += "<button class='minus 	glyphicon glyphicon-thumbs-down'><span>비추천 " + this.downs + "</span></button><br>";
               txt += "<button type='button' class='rvBtn'>리뷰 상세보기</button>";
               txt += "</div><br>";
            });
            $("#reviews").html(txt); 
         }
      });
     
   });
    
   //로그인 후, 전체 리뷰보기
   $("body").on("click","#moreBtn",function(){
      $.ajax({
            "url":"/Tasty/review/getAllReviewByAddress.do",
            "data":"address="+address,
            "dataType":"json",
            "error":function(a, b,c){
            },
            "success":function(list){
               var txt = "";
               txt += "<button id='mtTasteBtn' type='button'>입맛맞춰 보기</button>";
               var total;
               $.each(list, function(){
             
                   total = this.member.totalUps + this.member.totalDowns;
                   if(total!=0){
                   pos = (this.member.totalUps / total) * 100;
                   }else{
                	   pos=0;
                   }
                  
                  txt += "<div class='review'>";
                  txt += "<div class='reviewNum'>" + this.reviewNum + "</div>";
                  txt += "<div class='writer'>리뷰 쓴사람 정보<br>글쓴이 : " + this.email + "<br>";
                  txt += "신뢰도 <br> 받은 총 평가수" + total + "<br>";
                  txt += "긍정평가률 : " + pos.toFixed(2) + "%</div>";
                  txt +=    "<div class='title'>" + this.title + "</div>";
                  txt += "<div class='ratings'>별점 : " + this.ratings + "/5.0</div>";
                  txt += "<div class='content'>" + this.content + "</div>";
                  txt += "<button class='plus glyphicon glyphicon-thumbs-up'><span>추천 " + this.ups + "</span></button>";
                  txt += "<button class='minus 	glyphicon glyphicon-thumbs-down'><span>비추천 " + this.downs + "</span></button><br>";
                  txt += "<button type='button' class='rvBtn'>리뷰 상세보기</button>";
                  txt += "</div><br>";
               });
               $("#reviews").html(txt); 
            }
         });
   });
   


   
});

</script>

<body>
<div style="margin-top:55px;">
<h2> 식당명: ${sessionScope.eateryTitle}</h2>
<h3>식당 주소: ${sessionScope.eateryJibun}</h3>
<h3>식당 전화번호: ${sessionScope.eateryTel }</h3>
<h4 id="ratings"></h4>
<sec:authorize access="isAnonymous()">
	<span class="loginCheck" style="display:none;">1</span>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<span class="loginCheck" style="display:none;">0</span>
	<a href="/Tasty/review/getAllTaste.do"><button type="button">리뷰 작성하기</button></a>
	<a id="writeRoute" href='${initParam.rootPath}/route/getXYByEmail.do?email=<sec:authentication property="principal.email"/>'><button>루트 작성하기</button></a>
</sec:authorize>	
<br><br>
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


<div id="reviews" style="overflow-x:hidden;overflow-y:auto; width:45%; height:400px;background-color:#D8D8D8;float:left;margin-top:70px;">

</div>
<div id="routeReviews" style="overflow-x:hidden;overflow-y:auto;width:45%; height:400px;background-color:#D8D8D8;float:right;margin-top:70px;">
	<c:forEach items="${requestScope.listOfRoute}" var="Route">
	<div class="center-block" style="border-radius:5px; box-shadow:5px 5px grey; height:120px; width:80%;margin-top:30px;background-color:white;">
	<h4>${Route.routeName}</h4><br>
	
		<c:forEach items="${Route.tempRouteList}" var="tempRoute" varStatus="cnt">
				<c:choose>
                <c:when test="${cnt.count == 1}">
                ${tempRoute.review.storeName}
                </c:when>
                <c:otherwise>
                <span class="glyphicon glyphicon-arrow-right"></span>&nbsp;&nbsp;${tempRoute.review.storeName}
                </c:otherwise>
                 </c:choose> 
		</c:forEach>
	<br><a href='${initParam.rootPath}/route/getRouteByNum.do?number=${Route.routeNum}&fromWhere=0'><button style="border:1px #6495ED solid; margin-top:10px;
border-radius:10px;" class="btn btn-info">루트 상 세보기</button></a>
	</div>
</c:forEach>
</div>


<form action="${initParam.rootPath }/review/selectReviewByNum.do" id="reviewDetail" method="post">
 <sec:csrfInput/>
<input type="hidden" id="reviewNumber" name="reviewNum" value="">
<input type="hidden" id="fromwhere" name="fromWhere" value="0">
</form>
</div>
</body>
</html>